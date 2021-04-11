package com.board.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.board.service.AcademyService;
import com.board.service.BoardService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AcademyController {
    @Autowired
    private AcademyService academyService;

	private static String getTagValue(String tag, Element eElement){
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node)nList.item(0);
		if(nValue == null) return null;
		return nValue.getNodeValue();
	}
	
	private static Document createDocument(String pageNum,String pageSize){
		Document documentInfo = null;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date currentDate = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(currentDate);
			cal.add(Calendar.MONTH, 3);
			String url = "https://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp";
			String servicekey = "gV6TA7Ep5JFP66lYZgtEip3bkBl6av4s";
			String stDt = formatter.format(currentDate);
			String endDt = formatter.format(cal.getTime());
			
			String parseUrl = url+"?returnType=XML&authKey="+servicekey+"&pageSize="+pageSize+"&srchTraStDt="+stDt+
					"&srchTraEndDt="+endDt+"&outType=1&sort=ASC&sortCol=TR_STT_DT&srchKeco1=20&pageNum=";
			
			documentInfo = (Document) DocumentBuilderFactory
									.newInstance()
									.newDocumentBuilder()
									.parse(parseUrl+pageNum);
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
		return documentInfo;
	}
	
	private void parseXml(Element root, List<Map<String, String>> list) {
		NodeList nList = root.getElementsByTagName("srchList").item(0).getChildNodes();
		
		for(int i=0; i<nList.getLength(); i++){
			Map<String, String> map = new HashMap<>();
			Node nNode = nList.item(i);
			Element eElement = (Element)nNode;
			
			System.out.println("#################");
			System.out.println("학원명: " + getTagValue("subTitle",eElement));
			System.out.println("학원ID: " + getTagValue("trainstCstId",eElement));

			map.put("ACADEMY_NM", getTagValue("subTitle",eElement));
			map.put("ACADEMY_ID", getTagValue("trainstCstId",eElement));
			
			list.add(map);
		}		
	}
	
	@RequestMapping(value="/academy/main")
	public String main(ModelMap model){
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/academy/main";
	}
	
	@RequestMapping(value="/academy/updateAcademyList")
	public String getList(ModelMap model){
		try {
			String pageNum = "1";
			String pageSize = "100";
			
			List<Map<String,String>> list = new ArrayList<>();
			
			Document documentInfo = createDocument(pageNum, pageSize);
			//rootTag
			documentInfo.getDocumentElement().normalize();
				System.out.println("root element:" + documentInfo.getDocumentElement().getNodeName());
			
			int tot = Integer.parseInt(getTagValue("scn_cnt", documentInfo.getDocumentElement()));
			int num = (tot / Integer.parseInt(pageSize))+1;
			
			parseXml(documentInfo.getDocumentElement(),list);
			
			for(int i=2; i<=num; i++){
				documentInfo = createDocument(""+i, pageSize);
				parseXml(documentInfo.getDocumentElement(),list);
			}
			
			academyService.updateAcademyList(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/academy/main";
	}
	
	@RequestMapping(value="/academy/autoSearch")
	@ResponseBody
	public String autoSearch(ModelMap model){
		
		List<String> food = new ArrayList<String>();
		food.add("엽기떡볶이");
		food.add("신전떡볶이");
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", food);
		
		String json="";
		try{
			ObjectMapper mapper = new ObjectMapper();

			json = mapper.writeValueAsString(data);
			System.out.println("json:"+json);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return json;
	}
}
