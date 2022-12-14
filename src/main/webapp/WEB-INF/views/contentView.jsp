<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>
	<div class="body-wrap">
		<div class="header-wrap">
			<header-component></header-component>
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
							class="content-language"><a href="#">${ content.language }</a></span>
					</div>
					<div class="date-container">
						<span class="date">${ content.date }</span>
					</div>
				</div>
				<div class="content-body">
					<textarea class="content-textarea">${ content.content }</textarea>
				</div>
				<div class="btn-container">
				<form class="delete-form" action="/content/deleteContent.do?fid=${ content.fid }" method="post">
					<input type="button" class="update-btn" value="수정" onClick="location.href='/contentUpdate?fid=${ content.fid }'">
					<input type="submit" class="delete-btn" value="삭제">
				</form>
				</div>
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
<script type="text/javascript" src="/resource/js/header.js"></script>

</html>