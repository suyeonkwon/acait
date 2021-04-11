package com.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.AcademyMapper;
import com.board.service.AcademyService;

@Service
public class AcademyServiceImpl implements AcademyService{
	@Autowired
	private AcademyMapper academyMapper;
	
	@Override
	public void updateAcademyList(List<Map<String, String>> list)
			throws RuntimeException {
		
		for(Map<String,String> map : list){
			academyMapper.updateAcademyList(map);
		}
	}

}
