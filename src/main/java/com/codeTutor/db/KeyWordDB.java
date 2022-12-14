package com.codeTutor.db;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.codeTutor.mapper.KeyWordMapper;
import com.codeTutor.model.KeyWord;

@Component
public class KeyWordDB {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public KeyWord getKeyWord(int fid) {
		try {
			String sql = "SELECT * FROM keyword WHERE fid = ?";
			KeyWord result = jdbcTemplate.queryForObject(sql, new KeyWordMapper(), fid);
			
			return result;
			
		} catch (Exception e) {
			System.out.println(e);
			
			return new KeyWord();
		}
	}

	public boolean insertKeyWord(KeyWord k) {
		try {
			String sql = "INSERT INTO keyword (fid, keyword1) VALUE (?, ?)";
			jdbcTemplate.update(sql, k.getFid(), k.getKeyword1());
			
			return true;
		} catch (Exception e) {
			System.out.println(e);
			
			return false;
		}

	}
	
	public boolean updateKeyWord(KeyWord k) {
		try {
			String sql = "UPDATE keyword SET keyword1 = ? WHERE fid = ?";
			jdbcTemplate.update(sql, k.getKeyword1(), k.getFid());
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public boolean deleteKeyWord(int fid) {
		try {
			String sql = "DELETE FROM keyword WHERE fid = ?";
			jdbcTemplate.update(sql, fid);
			
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
