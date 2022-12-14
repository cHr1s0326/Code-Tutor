package com.codeTutor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codeTutor.db.ContentDB;
import com.codeTutor.db.KeyWordDB;
import com.codeTutor.model.Content;
import com.codeTutor.model.KeyWord;

@Controller
public class ViewController {
	@Autowired
	private ContentDB contentdb;
	@Autowired
	private KeyWordDB keyworddb;
	
	@GetMapping("/")
	public String showIndexView(Model model) {
		List<Content> content = contentdb.selectAll();
		model.addAttribute("allContent", content);
		
		return "/index";
	}
	
	@GetMapping("/post")
	public String showPostFuncView() {
		return "/post";
	}
	
	@GetMapping("/contentView")
	public String showContent(Model model, @RequestParam(value="fid", required=true) int fid) {
		Content content = contentdb.selectByFid(fid);
		model.addAttribute("content", content);
		return "/contentView";
	}
	
	@GetMapping("/contentUpdate")
	public String showUpdate(Model model, @RequestParam(value="fid", required=true) int fid) {
		Content content = contentdb.selectByFid(fid);
		KeyWord keyword = keyworddb.getKeyWord(fid);
		
		model.addAttribute("content", content);
		model.addAttribute("keyword", keyword);
		return "/contentUpdate";
	}
}
