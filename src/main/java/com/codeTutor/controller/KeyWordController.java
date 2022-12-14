package com.codeTutor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.codeTutor.db.ContentDB;
import com.codeTutor.db.KeyWordDB;
import com.codeTutor.model.Content;
import com.codeTutor.model.Options;

@Controller
public class KeyWordController {
	@Autowired
	private ContentDB contentdb;
	@Autowired
	private KeyWordDB keyworddb;
	
	@GetMapping("/browse")
	public String showBrowse(Model model) {
		if(model.getAttribute("Contents") == null) {
			List<Content> content = contentdb.selectAll();
			model.addAttribute("Contents", content);
		}
		
		return "/browse";
	}
	
	@GetMapping("/search")
	public String searchContent(Model model, @ModelAttribute Options o, @RequestParam(value="keyword", required=true) String keyword) {
		List<Content> content = contentdb.selectContentByOption(o, keyword);
		model.addAttribute("Contents", content);
		
		return "/browse";
	}
}
