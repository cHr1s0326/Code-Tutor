<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<link rel="stylesheet" href="/resource/css/user.css" type="text/css">
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
			<div class="banner-container"></div>
		</div>
		<div class="body-container">
			<h2 style="text-align: center;">${ method }</h2>
			<div class="form-container">
				<form action="${ action }" method="post">
					<div class="input-wrap">
						<label for="nickname">아이디</label>
						<div class="input-container">
							<input type="text" name="nickname" required>
						</div>
					</div>
					<div class="input-wrap">
						<div class="password-container">
							<label for="password">비밀번호</label> ${ resetPassword }
						</div>
						<div class="input-container">
							<input type="password" name="password" required>
						</div>
					</div>
					${ passwordRepeat }
					<div class="input-wrap input-container submit-container">
						<input type="submit" value="${ method }">
					</div>
				</form>
			</div>
			${ signup }
		</div>
	</div>
</body>
</html>