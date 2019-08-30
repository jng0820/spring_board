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
<title>게시글 목록</title>
<script>
	$(document).ready(function() {
		$("#btnCancel").click(function() {
			location.href = "list.do";
		});
// 		$("#btnDel").click(function(){
// 			if(confirm("삭제하시겠습니까?")){
// 				location.href = "delete.do?bno=" +$("#bno").val();
// 				alert("삭제되었습니다.");
// 			}
// 	    });
		$("#btnSave").click(function() {
			var sendInfo = {
				title : $("#title").val(),
				content : $("#content").val(),
				writer : $("#writer").val()
			};
			if(sendInfo.writer == ""){
				alert("이름을 입력해주세요");
				return;
			}
			if(sendInfo.content == ""){
				alert("내용을 입력해주세요");
				return;
			}
			if(sendInfo.title == ""){
				alert("위치를 입력해주세요");
				return;
			}
			console.log(sendInfo);
			$.ajax({
				url : 'view.do',
				type : 'post',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify(sendInfo),
				success : function() {
					window.location.reload(1);
				}
			});
		});
	});
	setInterval(function() {
		$('#boardlist').load(document.URL + ' #boardlist ');
	}, 3000);
	function delbtn(bno){
		if(confirm("삭제하시겠습니까?")){
			var sendInfo = {
				bno : bno
			}
			$.ajax({
				  url: 'delete.do',
				  method: 'DELETE',
				  dataType : 'json',
				  contentType : 'application/json',
				  data: JSON.stringify(sendInfo),
				  success:function(){
					  alert("삭제되었습니다.")
					  window.location.reload(1);
				  }
				})
		}
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="navbar-fixed-top.css" rel="stylesheet">
</head>
<body bgcolor="#ffc90e">
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color: black">Hanwitter</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
				</ul>
			</div>

			<!-- 입력폼 -->
			<form class="form-inline" id="form1" method="" action=""
				style="margin-top: 2%;">
				<div class="col-md-4">
					<div class="form-group">
						<label for="exampleInputName2">Name</label> <input type="text"
							class="form-control" id="writer" placeholder=" 이름이 뭐에요?">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="exampleInputEmail2">Location</label> <input
							type="text" class="form-control" id="title"
							placeholder=" 위치가 어디세요?">
					</div>
				</div>
				
				<button id="btnSave" class="btn btn-warning pull-right">등록</button>

				<textarea class="form-class" rows="3"
					style="margin-top: 2%" id="content"
					placeholder=" 할 말 있어요?"></textarea>
			</form>
		</div>
	</nav>
	<div style="height:100%; background-color:#ffc90e">
	<!-- 대화들 -->
	<!-- <div id="boardlist" style="margin-top: 18%;"> -->
	<div id="boardlist" style="margin-top: 15%; background-color: #ffc90e;">
		<c:forEach items="${list}" var="boardVO">
			<!-- <div class="container" style="margin-top: 2%; border: 1px solid #e0e0e0; padding:2%"> -->
			<div class="container" style="margin-top: 2%; border-radius: 15px; background-color: #ffffff; box-shadow: 0px 5px 10px 0px #555555; padding:2%">
				<form class="form-inline" action="">
					<div class="col-md-2" id="bno" value = ${boardVO.bno }>
						<span>글 번호 : ${boardVO.bno}</span><br>
					</div>
					<div class="col-md-4">

						<div class="form-group">
							<label for="exampleInputName2">작성자</label> <input type="text"
								class="form-control" style="background-color: #ffffff; border: 0px solid #ffffff" id="exampleInputName2"
								value="@ ${boardVO.writer}" readonly="readonly">
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label for="exampleInputEmail2">Location</label> <input
								type="text" class="form-control" style="background-color: #ffffff; border: 0px solid #ffffff" id="exampleInputEmail2"
								value="${boardVO.title}" readonly="readonly">
						</div>

					</div>
					<button onClick="delbtn(${boardVO.bno})" class="btn btn-warning pull-right" style="margin-bottom:1%">삭제</button>
				</form>
				<textarea class="form-control" rows="2"
					style="margin-top: 2%; background-color: #ffffff; border: 0px solid #ffffff" readonly="readonly">${boardVO.content} </textarea>
			</div>
		</c:forEach>
	</div>
	</div>
</body>
<style>
textarea {
	width: 100%;
	resize: none;
}
input[readonly]{
  background-color:transparent;
  border: 0;
  font-size: 1em;
}

</style>
</html>
