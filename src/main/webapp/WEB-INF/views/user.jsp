<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<header-component></header-component>
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
<script type="text/javascript" src="/resource/js/header.js"></script>
</html>