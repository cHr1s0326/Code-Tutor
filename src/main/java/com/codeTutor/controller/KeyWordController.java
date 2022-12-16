package com.codeTutor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.codeTutor.Service.ContentService;
import com.codeTutor.model.Content;
import com.codeTutor.model.Options;

@Controller
public class KeyWordController {
	@Autowired
	private ContentService contentdb;
	
	@GetMapping("/search")
	public String searchContent(Model model, @ModelAttribute Options o, @RequestParam(value = "keyword", required = true) String keyword) {
		List<Content> content = contentdb.selectContentByOption(o, keyword);
		model.addAttribute("Contents", content);

		return "/browse";
	}

	@GetMapping("/searchByLanguage")
	public String searchByLanguage(Model model, @RequestParam(value = "language", required = true) String language) {
		List<Content> content = contentdb.selectContentByLanguage(language);
		model.addAttribute("Contents", content);

		return "/browse";
	}
	
	@GetMapping("/searchByAuthor")
	public String searchByAuthor(Model model, @RequestParam(value = "author", required = true) String author) {
		List<Content> content = contentdb.selectContentByAuthor(author);
		model.addAttribute("Contents", content);
		
		return "/browse";
	}
	
	@GetMapping("/searchByKeyWord")
	public String searchByKeyWord(Model model, @RequestParam(value = "keyword", required = true) String keyword) {
		List<Content> content = contentdb.selectContentBykeyWord(keyword);
		model.addAttribute("Contents", content);
		
		return "/browse";
	}
}
