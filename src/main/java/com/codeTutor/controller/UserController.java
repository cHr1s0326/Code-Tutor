package com.codeTutor.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.codeTutor.Service.UserService;
import com.codeTutor.model.User;
import com.codeTutor.model.Signup;

@Controller
public class UserController {
	@Autowired BCryptPasswordEncoder encoder;
	@Autowired
	private UserService userdb;
	
	@PostMapping("/user/signup.do")
	public String doSignup(Model model, @ModelAttribute User u, @ModelAttribute Signup ul) {
		if(!u.getPassword().equals(ul.getPasswordRepeat())) {
			model.addAttribute("msg", "두 비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "/signup");
			
			return "alert";
		}
		boolean isExist = userdb.userExist(u.getNickname());
		String encryptPassword = encoder.encode(u.getPassword());
		u.setPassword(encryptPassword);
		
		if(!isExist) {
			userdb.doSignup(u);
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			model.addAttribute("url", "/");
		}
		
		else {
			model.addAttribute("msg", "이미 존재하는 사용자입니다.");
			model.addAttribute("url", "/signup");
		}
		return "alert";
	}
	
	@PostMapping("/user/login.do")
	public String doLogin(Model model, HttpServletRequest request, @ModelAttribute User u) {
		String encryptPassword = userdb.getPassword(u.getNickname());
		boolean loginResult = encoder.matches(u.getPassword(), encryptPassword);
		
		if(!loginResult) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "/login");
			
			return "alert";
		}
		
		User loginUser = userdb.getUserByNickname(u.getNickname());
		loginUser.setPassword(null);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		
		return "redirect:/";
	}
	
	@GetMapping("/logout.do")
	public String doLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}
