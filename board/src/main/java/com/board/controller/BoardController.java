package com.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.service.BoardService;

@Controller
public class BoardController {
	
    @Autowired
    private BoardService boardService;

	@RequestMapping(value="/board/list")
	public String getList(ModelMap model){
		try {
			List<Map> list = boardService.selectBoardList();
			
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/list";
	}
}
