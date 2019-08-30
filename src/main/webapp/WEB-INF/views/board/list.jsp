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
	src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<title>게시글 목록</title>
<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "write.do";
		});
	});
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="navbar-fixed-top.css" rel="stylesheet">
</head>
<body>

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
				<a class="navbar-brand" href="#">Hanwitter</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../navbar/">Default</a></li>
					<li><a href="../navbar-static-top/">Static top</a></li>
					<li class="active"><a href="./">Fixed top <span
							class="sr-only">(current)</span></a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container" style="margin-top: 5%">
		<div class="jumbotron">
			<form class="form-inline">
				<div class="col-md-4">
					<div class="form-group">
						<label for="exampleInputName2">Name</label> <input type="text"
							class="form-control" id="exampleInputName2" placeholder="전우형">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="exampleInputEmail2">Location</label> <input
							type="text" class="form-control" id="exampleInputEmail2"
							placeholder="서울">
					</div>
				</div>
				<!-- 				<div class="col-md-1"> -->
				<button type="submit" class="btn btn-default">등록</button>
				<!-- 				</div> -->
			</form>

			<textarea class="form-control" rows="3"
				style="padding-top: 5%; margin-top: 2%"></textarea>
		</div>
	</div>

	<div class="container" style="margin-top: 5%">
		<form class="form-inline">
			<div class="col-md-4">
				<div class="form-group">
					<label for="exampleInputName2">Name</label> <input type="text"
						class="form-control" id="exampleInputName2" placeholder="전우형">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleInputEmail2">Location</label> <input type="text"
						class="form-control" id="exampleInputEmail2" placeholder="서울">
				</div>
			</div>
			<!-- 				<div class="col-md-1"> -->
			<button type="submit" class="btn btn-default">등록</button>
			<!-- 				</div> -->
		</form>

		<textarea class="form-control" rows="3"
			style="padding-top: 5%; margin-top: 2%"></textarea>
	</div>

	<h2>게시글 목록</h2>
	<button type="button" id="btnWrite">글쓰기</button>
	<table border="1" width="600px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="boardVO">
			<tr>
				<td>${boardVO.bno}</td>
				<td><a href="/example/board/view.do?bno=${boardVO.bno}">${boardVO.title}</a></td>
				<td>${boardVO.writer}</td>
				<td>${boardVO.regdate}</td>
				<td>${boardVO.viewcnt}</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>
