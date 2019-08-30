<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>게시글 작성</title>
<script>
	$(document).ready(function(){
		$("#btnSave").click(function(){
			// 폼에 입력한 데이터를 서버로 전송
        });
		$("#btnDel").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href = "delete.do?bno="+${vo.bno};
				alert("삭제되었습니다.");
			}
        });
		$("#btnMod").click(function(){
			$("#form1").submit();
        });
		$("#btnReset").click(function(){
			location.href = "list.do";
        });
    });
</script>
</head>
<body>
	<h2>게시글 상세보기</h2>
	<form name="form1" method="post" action="">
		<div>
			제목 <input name="title" id="title" size="80" value="${vo.title}">
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80">${vo.content}</textarea>
		</div>
		<div>
			이름 <input name="writer" id="writer" value="${vo.writer}">
		</div>
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			<button type="reset" id="btnReset">취소</button>
			<button type="button" id="btnDel">삭제</button>
			<button type="submit" id="btnMod">수정</button>
		</div>
	</form>
</body>
</html>
