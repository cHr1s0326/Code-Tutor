package com.codeTutor.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.codeTutor.model.Content;

public class ContentMapper implements RowMapper<Content>{
	@Override
	public Content mapRow(ResultSet rs, int rowNum) throws SQLException {
		Content content = new Content();
		content.setFid(rs.getInt("fid"));
		content.setName(rs.getString("name"));
		content.setDescription(rs.getString("description"));
		content.setContent(rs.getString("content"));
		content.setAuthor(rs.getString("author"));
		content.setLanguage(rs.getString("language"));
		content.setDate(rs.getString("date"));
		
		return content;
	}
	
}
