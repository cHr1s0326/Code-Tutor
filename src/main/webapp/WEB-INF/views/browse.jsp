<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>browse</title>
</head>
<link type="text/css" href="/resource/css/browse.css" rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/lib/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/theme/ambiance.css">
<body>
	<div class="body-wrap">
		<div class="header-wrap">
			<header-component></header-component>
			<div class="banner-container">
				<form action="/search" method="get">
					<select class="keyword-option" name="keywordOption">
						<option value="keyword">키워드로 검색</option>
						<option value="author">작성자로 검색</option>
					</select> <input type="search" class="search-form" name="keyword"
						autocomplete="off" placeholder="검색어">
					<button type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
					<select class="search-option" name="searchOption">
						<option value="recent">최근 추가된 날짜</option>
						<option value="old">오래된 순</option>
					</select> <select class="language-option" name="languageOption">
						<option value="All">All</option>
						<option value="Java">Java</option>
						<option value="C">C</option>
						<option value="C++">C++</option>
						<option value="Python">Python</option>
						<option value="JavaScript">JavaScript</option>
						<option value="CSS">CSS</option>
					</select>
				</form>
			</div>
		</div>
		<div class="body-container">
			<c:forEach var="Content" items="${ Contents }">
				<div class="content-container">
					<div class="content-header">
						<div class="author-container">
							<span class="author">${ Content.author }</span>
						</div>
						<div class="info-container">
							<span class="content-name"><a
								href="/contentView?fid=${ Content.fid }">${ Content.name }</a></span> <span
								class="content-language"><a href="#">${ Content.language }</a></span>
						</div>
						<div class="detail-container">
							<div class="description-container">
								<span class="description">${ Content.description }</span>
							</div>
							<div class="date-container">
								<span class="date">${ Content.date }</span>
							</div>
						</div>
					</div>
					<div class="content-body">
						<a href="/contentView?fid=${ Content.fid }"> <textarea
								class="js" id="content" name="content">${ Content.content }</textarea>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script src="https://kit.fontawesome.com/a10e09fadf.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resource/js/header.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/lib/codemirror.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/clike/clike.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/python/python.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/css/css.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/javascript/javascript.js"></script>
<script type="text/javascript" src="/resource/js/indexCodeMirror.js"></script>
<script type="text/javascript" src="/resource/js/index.js"></script>
</html>