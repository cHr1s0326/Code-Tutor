<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Content</title>
</head>
<link type="text/css" rel="stylesheet" href="/resource/css/post.css">
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
			<div class="banner-container"></div>
		</div>

		<div class="body-container">
			<form action="/content/postContent.do" method="post">
				<div class="name-container">
					<label for="name">파일명: </label> <input type="text" id="name"
						name="name" placeholder="파일명" autocomplete="off" required>
				</div>
				<div class="desc-container">
					<label for="description">코드 설명: </label>
					<textarea class="description-textarea" id="description"
						name="description" placeholder="코드에 대한 설명을 적어주세요!"
						autocomplete="off" required></textarea>
				</div>
				<div class="content-wrap">
					<div class="option-wrap">
						<div class="keyword-container">
							<label for="keyword1">키워드: </label> <input type="text"
								id="keyword1" name="keyword1" placeholder="키워드"
								autocomplete="off" required>
						</div>

						<div class="option-container">
							<label for="language">언어: </label> <select
								class="content-language" name="language" id="language"
								onchange="changeMode()">
								<option value="Java">Java</option>
								<option value="C">C</option>
								<option value="C++">C++</option>
								<option value="Python">Python</option>
								<option value="JavaScript">JavaScript</option>
								<option value="CSS">CSS</option>
							</select>
						</div>
					</div>
					<div class="content-container">
						<textarea class="content-textarea" id="content" name="content"
							autocomplete="off"></textarea>
					</div>
					<div class="submit-container">
						<input type="submit" value="추가하기" onClick="valueCheck()">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="/resource/js/postCodeMirror.js"></script>
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
</html>