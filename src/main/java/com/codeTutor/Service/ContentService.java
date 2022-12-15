package com.codeTutor.Service;

import org.springframework.stereotype.Component;

import com.codeTutor.mapper.ContentMapper;
import com.codeTutor.model.Content;
import com.codeTutor.model.Options;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

@Component
public class ContentService {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Content> selectAll() {
		String sql = "SELECT * FROM content order by date desc";
		List<Content> result = jdbcTemplate.query(sql, new ContentMapper());

		return result;
	}

	public Content selectByFid(int fid) {
		String sql = "SELECT * FROM content WHERE fid = ?";
		Content result = jdbcTemplate.queryForObject(sql, new ContentMapper(), fid);

		return result;
	}

	public boolean insertContent(Content c) {
		try {
			String sql = "INSERT INTO content (name, description, content, author, language, date) VALUE(?, ?, ?, ?, ?, ?)";
			jdbcTemplate.update(sql, c.getName(), c.getDescription(), c.getContent(), c.getAuthor(), c.getLanguage(),
					c.getDate());
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public void updateContent(Content c) {
		String sql = "UPDATE content SET name=?, description=?, content=?, author=?, language=?, date=? WHERE fid=?";
		jdbcTemplate.update(sql, c.getName(), c.getDescription(), c.getContent(), c.getAuthor(), c.getLanguage(),
				c.getDate(), c.getFid());
		System.out.println("fid =" + c.getFid() + " content updated.");
	}

	public void deleteContent(int fid) {
		String sql = "DELETE FROM content WHERE fid = ?";
		jdbcTemplate.update(sql, fid);
		System.out.println("fid = " + fid + " content updated.");
	}

	public String getLastID() {
		String sql = "SELECT fid FROM content ORDER BY fid DESC LIMIT 1";
		String result = (String) jdbcTemplate.queryForObject(sql, String.class);

		return result;
	}

	public List<Content> selectContentByOption(Options o, String keyword) {
		List<Content> c;
		try {
			String searchOption = "";
			if(o.getSearchOption().equals("recent"))
				searchOption = "order by date desc";
			else
				searchOption = "order by date asc";
			
			if (o.getLanguageOption().equals("All")) {
				if (o.getKeywordOption().equals("keyword")) {
					String sql = "SELECT * FROM content WHERE fid IN (SELECT fid FROM keyword WHERE keyword1 = ?) " + searchOption;
					c = jdbcTemplate.query(sql, new ContentMapper(), keyword);
				}

				else {
					String sql = "SELECT * FROM content WHERE author = ? " + searchOption;
					c = jdbcTemplate.query(sql, new ContentMapper(), keyword);
				}
			}

			else {
				if (o.getKeywordOption().equals("keyword")) {
					String sql = "SELECT * FROM "
							+ "(SELECT c.fid, name, description, content, author, language, date, keyword1 "
							+ "FROM content AS c INNER JOIN keyword AS k ON c.fid = k.fid) T"
							+ "WHERE language = ? AND keyword1 = ? " + searchOption;
					c = jdbcTemplate.query(sql, new ContentMapper(), o.getLanguageOption(), keyword);
				}
				
				else {
					String sql = "SELECT * FROM content WHERE language=? AND author=? " + searchOption;
					c = jdbcTemplate.query(sql, new ContentMapper(), o.getLanguageOption(), keyword);
				}
			}

			return c;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public List<Content> selectContentByLanguage(String language) {
		try {
			String sql = "SELECT * FROM content WHERE language = ? order by date desc";
			List<Content> result = jdbcTemplate.query(sql, new ContentMapper(), language);
			
			return result;
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public List<Content> selectContentByAuthor(String author) {
		try {
			String sql = "SELECT * FROM content WHERE author = ? order by date desc";
			List<Content> result = jdbcTemplate.query(sql, new ContentMapper(), author);
			
			return result;
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
