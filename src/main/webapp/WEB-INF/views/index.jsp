<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Tutor</title>
<link type="text/css" href="/resource/css/index.css" rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/lib/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/theme/ambiance.css">
<link rel="shortcut icon" href="/resource/img/icon/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="/resource/img/icon//favicon.ico"
	type="image/x-icon">
</head>
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
				<span class="banner-text">Try to be a Code influencer!</span>
			</div>
		</div>
		<div class="body-container">
			<c:forEach var="Content" items="${ allContent }">
				<div class="content-container">
					<div class="content-header">
						<div class="author-container">
							<span class="author"><a
								href="searchByAuthor?author=${ Content.author}">${ Content.author }</a></span>
						</div>
						<div class="info-container">
							<span class="content-name"><a
								href="/contentView?fid=${ Content.fid }">${ Content.name }</a></span> <span
								class="content-language"><a
								href="/searchByLanguage?language=${ Content.language }">${ Content.language }</a></span>
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
<script type="text/javascript"
	src="/resource/plugin/codemirror5/lib/codemirror.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/javascript/javascript.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/clike/clike.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/python/python.js"></script>
<script type="text/javascript"
	src="/resource/plugin/codemirror5/mode/css/css.js"></script>
<script type="text/javascript" src="/resource/js/indexCodeMirror.js"></script>
<script type="text/javascript" src="/resource/js/index.js"></script>
</html>