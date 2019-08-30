<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>게시글 작성</title>
<script>
	$(document).ready(function() {
		$("#btnCancel").click(function() {
			location.href = "list.do";
		});
		$("#btnSave").click(function() {
	       var sendInfo = {
	           title : $("#Location").val(),
	           content : $("#content").val(),
	           writer: $("#writer").val()
	       };

			$.ajax({
			    url: 'insert.do',
			    type: 'post',
			    dataType: 'json',
			    contentType: 'application/json',
			    data: JSON.stringify(sendInfo)
			});
		});
	});
</script>
</head>
<body>
<h2>게시글 작성</h2>
<form id="form1" method="post" action="insert.do">
    <div>
        제목
        <input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <div>
        내용
        <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <div>
        이름
        <input name="writer" id="writer" placeholder="이름을 입력해주세요">
    </div>
    <div style="width:650px; text-align: center;">
        <button type="button" id="btnSave">확인</button>
        <button type="reset" id="btnCancel">취소</button>
    </div>
</form>
</body>
</html>
