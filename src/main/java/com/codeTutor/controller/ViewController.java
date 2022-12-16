package com.codeTutor.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.codeTutor.Service.ContentService;
import com.codeTutor.Service.KeyWordService;
import com.codeTutor.model.Content;
import com.codeTutor.model.KeyWord;
import com.codeTutor.model.User;
import com.codeTutor.Config.LanguageConstants;

@Controller
public class ViewController {
	@Autowired
	private ContentService contentdb;
	@Autowired
	private KeyWordService keyworddb;

	@GetMapping("/")
	public String showIndexView(Model model) {
		List<Content> content = contentdb.selectAll();
		model.addAttribute("allContent", content);

		return "/index";
	}

	@GetMapping("/browse")
	public String showBrowse(Model model) {
		String[] language = { LanguageConstants.JAVA, LanguageConstants.C, LanguageConstants.CPP,
				LanguageConstants.PYTHON, LanguageConstants.JAVA_SCRIPT, LanguageConstants.CSS };
		int[] counts = new int[language.length];
		
		for(int i = 0; i < counts.length; i++)
			counts[i] = contentdb.getCountByLanguage(language[i]);
		
		List<Content> content = contentdb.selectAll();
		model.addAttribute("Contents", content);
		model.addAttribute("Counts", counts);

		return "/browse";
	}

	@GetMapping("/signup")
	public String showSignupView(Model model) {
		model.addAttribute("method", "회원가입");
		model.addAttribute("action", "/user/signup.do");
		model.addAttribute("passwordRepeat",
				"					<div class=\"input-wrap\">\n"
						+ "						<div class=\"password-container\">\n"
						+ "							<label for=\"passwordRepeat\">비밀번호 확인</label>\n"
						+ "						</div>\n" + "						<div class=\"input-container\">\n"
						+ "							<input type=\"password\" name=\"passwordRepeat\" required>\n"
						+ "						</div>\n" + "					</div>");

		return "/user";
	}

	@GetMapping("/login")
	public String showLoginView(Model model, @SessionAttribute(name = "loginUser", required = false) User user) {
		if (user != null) {
			return "redirect:/";
		}
		model.addAttribute("method", "로그인");
		model.addAttribute("action", "/user/login.do");
		model.addAttribute("resetPassword",
				"<a href='/' style=\"font-size: 10px; margin-left: 20px;\">비밀번호를 잊으셨나요?</a>");
		model.addAttribute("signup",
				"			<div class=\"signup-container\">\n" + "				<div class=\"signup-btn\">\n"
						+ "					<a href=\"/signup\">회원가입</a>\n" + "				</div>\n"
						+ "			</div>");
		return "/user";
	}

	@GetMapping("/post")
	public String showPostFuncView(@SessionAttribute(name = "loginUser", required = false) User user) {
		if (user == null) {
			return "redirect:/login";
		}
		return "/post";
	}

	@GetMapping("/contentView")
	public String showContent(Model model, @RequestParam(value = "fid", required = true) int fid) {
		Content content = contentdb.selectByFid(fid);
		model.addAttribute("content", content);
		return "/contentView";
	}

	@GetMapping("/contentUpdate")
	public String showUpdate(Model model, @RequestParam(value = "fid", required = true) int fid) {
		Content content = contentdb.selectByFid(fid);
		KeyWord keyword = keyworddb.getKeyWord(fid);

		model.addAttribute("content", content);
		model.addAttribute("keyword", keyword);
		return "/contentUpdate";
	}
}
