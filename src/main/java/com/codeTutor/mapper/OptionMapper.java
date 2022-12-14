package com.codeTutor.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.codeTutor.model.Options;

public class OptionMapper implements RowMapper<Options> {
	@Override
	public Options mapRow(ResultSet rs, int rowNum) throws SQLException {
		Options o = new Options();
		o.setKeywordOption(rs.getString("keywordOption"));
		o.setSearchOption(rs.getString("searchOption"));
		o.setLanguageOption(rs.getString("languageOption"));
		
		System.out.println(o);
		
		return o;
	}
}
