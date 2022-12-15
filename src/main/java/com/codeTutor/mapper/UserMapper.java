package com.codeTutor.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.codeTutor.model.User;

public class UserMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User u = new User();
		u.setUid(rs.getInt("uid"));
		u.setNickname(rs.getString("nickname"));
		u.setPassword(rs.getString("password"));
		
		return u;
	}
	
}
