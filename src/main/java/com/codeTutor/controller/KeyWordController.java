package com.codeTutor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.codeTutor.Config.LanguageConstants;
import com.codeTutor.Service.ContentService;
import com.codeTutor.model.Content;
import com.codeTutor.model.Options;

@Controller
public class KeyWordController {
	@Autowired
	private ContentService contentdb;
	
	@GetMapping("/search")
	public String searchContent(Model model, @ModelAttribute Options o, @RequestParam(value = "keyword", required = true) String keyword) {
		String[] language = { LanguageConstants.JAVA, LanguageConstants.C, LanguageConstants.CPP,
				LanguageConstants.PYTHON, LanguageConstants.JAVA_SCRIPT, LanguageConstants.CSS };
		int[] counts = new int[language.length];
		
		for(int i = 0; i < counts.length; i++)
			counts[i] = contentdb.getCountByLanguage(language[i]);
		
		List<Content> content = contentdb.selectContentByOption(o, keyword);
		
		model.addAttribute("Contents", content);
		model.addAttribute("Counts", counts);
		
		return "/browse";
	}

	@GetMapping("/searchByLanguage")
	public String searchByLanguage(Model model, @RequestParam(value = "language", required = true) String language) {
		String[] l = { LanguageConstants.JAVA, LanguageConstants.C, LanguageConstants.CPP,
				LanguageConstants.PYTHON, LanguageConstants.JAVA_SCRIPT, LanguageConstants.CSS };
		int[] counts = new int[l.length];
		
		for(int i = 0; i < counts.length; i++)
			counts[i] = contentdb.getCountByLanguage(l[i]);
		
		List<Content> content = contentdb.selectContentByLanguage(language);
		
		model.addAttribute("Contents", content);
		model.addAttribute("Counts", counts);
		
		return "/browse";
	}
	
	@GetMapping("/searchByAuthor")
	public String searchByAuthor(Model model, @RequestParam(value = "author", required = true) String author) {
		String[] language = { LanguageConstants.JAVA, LanguageConstants.C, LanguageConstants.CPP,
				LanguageConstants.PYTHON, LanguageConstants.JAVA_SCRIPT, LanguageConstants.CSS };
		int[] counts = new int[language.length];
		
		for(int i = 0; i < counts.length; i++)
			counts[i] = contentdb.getCountByLanguage(language[i]);
		
		List<Content> content = contentdb.selectContentByAuthor(author);
		model.addAttribute("Contents", content);
		model.addAttribute("Counts", counts);
		
		return "/browse";
	}
	
	@GetMapping("/searchByKeyWord")
	public String searchByKeyWord(Model model, @RequestParam(value = "keyword", required = true) String keyword) {
		String[] language = { LanguageConstants.JAVA, LanguageConstants.C, LanguageConstants.CPP,
				LanguageConstants.PYTHON, LanguageConstants.JAVA_SCRIPT, LanguageConstants.CSS };
		int[] counts = new int[language.length];
		
		for(int i = 0; i < counts.length; i++)
			counts[i] = contentdb.getCountByLanguage(language[i]);
		
		List<Content> content = contentdb.selectContentBykeyWord(keyword);
		
		model.addAttribute("Contents", content);
		model.addAttribute("Counts", counts);
		
		return "/browse";
	}
}
