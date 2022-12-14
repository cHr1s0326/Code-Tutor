package com.codeTutor.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.codeTutor.model.KeyWord;

public class KeyWordMapper implements RowMapper<KeyWord>{
	@Override
	public KeyWord mapRow(ResultSet rs, int rowNum) throws SQLException {
		KeyWord k = new KeyWord();
		k.setFid(rs.getInt("fid"));
		k.setKeyword1(rs.getString("keyword1"));
		k.setKeyword2(rs.getString("keyword2"));
		k.setKeyword3(rs.getString("keyword3"));
		
		return k;
	}
}
