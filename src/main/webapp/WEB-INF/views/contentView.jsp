<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ content.name }</title>
</head>
<link type="text/css" rel="stylesheet"
	href="/resource/css/contentView.css">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/lib/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/theme/ambiance.css">
<link rel="shortcut icon" href="/resource/img/icon/favicon.ico" type="image/x-icon">
<link rel="icon" href="/resource/img/icon//favicon.ico" type="image/x-icon">
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
		</div>
		<div class="body-container">
			<div class="content-container">
				<div class="content-header">
					<div class="detail-container">
						<div class="description-container">
							<span class="description">${ content.description }</span>
						</div>
					</div>
					<div class="info-container">
						<span class="content-name">${ content.name } / </span> <span
							class="content-language"><a href="/searchByLanguage?language=${ content.language }">${ content.language }</a></span>
					</div>
					
					<div class="keyword-container">
						<span class="keyword"><a href="/searchByKeyWord?keyword=${ keyword.keyword1 }">#${ keyword.keyword1 }</a></span>
					</div>
					<div class="date-container">
						<span class="date">${ content.date }</span>
					</div>
				</div>
				<div class="content-body">
					<textarea class="content-textarea">${ content.content }</textarea>
				</div>
				<c:if test="${ loginUser.nickname == content.author }">
					<div class="btn-container">
						<form class="update-form" action="/content/deleteContent.do?fid=${ content.fid }" method="post">
							<input type="button" class="update-btn" value="수정" onClick="location.href='/contentUpdate?fid=${ content.fid }'">
							<input type="submit" class="delete-btn" value="삭제">
						</form>
					</div>
				</c:if>
			</div>
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
	
<script type="text/javascript" src="/resource/js/contentViewCodeMirror.js"></script>
</html>