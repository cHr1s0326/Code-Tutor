<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${content.name}</title>
<link type="text/css" rel="stylesheet"
	href="/resource/css/contentUpdate.css">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/lib/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="/resource/plugin/codemirror5/theme/ambiance.css">
</head>
<body>
	<div class="body-wrap">
		<div class="header-wrap">
			<header-component></header-component>
		</div>
		<div class="body-container">
			<form action="/content/updateContent.do?fid=${ content.fid }"
				method="post">
				<div class="content-container">
					<div class="content-header">
						<div class="detail-container">
							<div class="description-container">
								<label for="description">코드 설명: </label>
								<textarea class="description-textarea" name="description" required>${ content.description }</textarea>
							</div>
						</div>
						<div class="info-container">
							<div class="name-container">
								<label for="name">파일명: </label><input type="text"
									class="content-name" name="name" value="${ content.name }" required>
							</div>
							<div class="language-container">
								<span class="content-language" style="display: none">${ content.language }</span>
								<label for="language">언어: </label> <select
									class="content-language" name="language" id="language"
									onchange="changeMode()" style="display: inline-block;" required>
									<option class="java-option" value="Java">Java</option>
									<option class="c-option" value="C">C</option>
									<option class="cpp-option" value="C++">C++</option>
									<option class="python-option" value="Python">Python</option>
									<option class="js-option" value="JavaScript">JavaScript</option>
									<option class="css-option" value="CSS">CSS</option>
								</select>
							</div>
						</div>
						<div class="option-container">
							<div class="keyword-container">
								<label for="keyword1">키워드: </label> <input type="text"
									class="keyword" name="keyword1" value="${ keyword.keyword1 }" required>
							</div>
							<div class="date-container">
								<span class="date">${ content.date }</span>
							</div>
						</div>
					</div>
					<div class="content-body">
						<textarea class="content-textarea" name="content">${ content.content }</textarea>
					</div>
					<div class="btn-container">
						<input type="submit" value="수정">
					</div>
				</div>
			</form>
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

<script type="text/javascript" src="/resource/js/contentUpdate.js"></script>
<script type="text/javascript" src="/resource/js/header.js"></script>
</html>