package com.codeTutor.Service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.codeTutor.mapper.UserMapper;
import com.codeTutor.model.User;

@Component
public class UserService {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public boolean userExist(String userName) {
		try {
			String sql = "SELECT EXISTS (SELECT * FROM user WHERE nickname = ?)";
			int result = Integer.parseInt(jdbcTemplate.queryForObject(sql, String.class, userName));
			
			return result == 1 ? true : false;
		} catch(Exception e) {
			System.out.println(e);
			
			return false;
		}
	}
	
	public User getUserByNickname(String userName) {
		try {
			String sql = "SELECT * FROM user WHERE nickname = ?";
			User result = jdbcTemplate.queryForObject(sql, new UserMapper(), userName);
			
			return result;
		} catch(Exception e) {
			System.out.println(e);
			
			return null;
		}
	}
	
	public String getPassword(String userName) {
		try {
			String sql = "SELECT password FROM user WHERE nickname = ?";
			String password = jdbcTemplate.queryForObject(sql, String.class, userName);
			
			return password;
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public void doSignup(User user) {
		try {
			String sql = "INSERT INTO user (nickname, password) VALUE (?, ?)";
			jdbcTemplate.update(sql, user.getNickname(), user.getPassword());
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public boolean doLogin(User user) {
		try {
			String sql = "SELECT EXISTS (SELECT * FROM user WHERE nickname = ? AND password = ?)";
			int result = Integer.parseInt(jdbcTemplate.queryForObject(sql, String.class, user.getNickname(), user.getPassword()));
			
			return result == 1 ? true : false;
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
