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
<link rel="shortcut icon" href="/resource/img/icon/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="/resource/img/icon//favicon.ico"
	type="image/x-icon">
<body>
	<div class="body-wrap">
		<div class="header-wrap">
			<div class="header-container">
				<div class="logo">
					<img class="logo-img" src="/resource/img/logo.png"> <a
						href="/"><span class="logo-text">Code-Tutor </span></a>
				</div>
				<div class="menu-container">
					<ul class="menu">
						<li><a href="/browse">둘러보기</a></li>
						<li><a href="/post">추가하기</a></li>
					</ul>
				</div>
				<c:if test="${ loginUser == null }">
					<div class="login-menu">
						<div class="login-btn">
							<a href="/login"><span>로그인</span></a>
						</div>
					</div>
				</c:if>
				<c:if test="${ loginUser != null }">
					<div class="logout-menu">
						<div class="logout-btn">
							<a href="/logout.do"><span>로그아웃</span></a>
						</div>
					</div>
				</c:if>
			</div>
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
		<div class="sidemenu-container">
			<ul class="sidemenu">
				<li>
					<div class="language-container">
						<a href="searchByLanguage?language=Java"> <span
							class="language">Java</span>
						</a>
					</div>
					<div class="count-container">
						<span class="count">1</span>
					</div>
				</li>
				<li>
					<div class="language-container">
						<a href="searchByLanguage?language=C"> <span class="language">C</span>
						</a>
					</div>
					<div class="count-container">
						<span class="count">2</span>
					</div>
				</li>
				<li>
					<div class="language-container">
						<a href="searchByLanguage?language=C++"> <span
							class="language">C++</span>
						</a>
					</div>
					<div class="count-container">
						<span class="count">3</span>
					</div>
				</li>
				<li>
					<div class="language-container">
						<a href="searchByLanguage?language=Python"> <span
							class="language">Python</span>
						</a>
					</div>
					<div class="count-container">
						<span class="count">4</span>
					</div>
				</li>
				<li>
					<div class="language-container">
						<a href="searchByLanguage?language=JavaScript"> <span
							class="language">JavaScript</span>
						</a>
					</div>
					<div class="count-container">
						<span class="count">5</span>
					</div>
				</li>
				<li>
					<div class="language-container">
						<a href="searchByLanguage?language=CSS"> <span
							class="language">CSS</span>
						</a>
					</div>
					<div class="count-container">
						<span class="count">6</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="body-container">
			<c:forEach var="Content" items="${ Contents }">
				<div class="content-container">
					<div class="content-header">
						<div class="author-container">
							<span class="author"><a
								href="/searchByAuthor?author=${ Content.author }">${ Content.author }</a></span>
						</div>
						<div class="info-container">
							<span class="content-name"><a
								href="/contentView?fid=${ Content.fid }">${ Content.name }</a> / </span> <span
								class="content-language"><a
								href="searchByLanguage?language=${ Content.language }">${ Content.language }</a></span>
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