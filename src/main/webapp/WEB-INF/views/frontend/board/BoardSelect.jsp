<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>neocom</title>
</head>
<body>

	<div id="root">
		<header>
			<h1>neocom</h1>
		</header>

		<section id="container">

			<form role="form" method="post">

				<p>
					<label for="bno">글 번호</label><input type="text" id="bno" name="bno"
						value="${select.bno}" readonly="readonly" />
				</p>

				<p>
					<label for="title">글 제목</label><input type="text" id="title"
						name="title" value="${select.title}" readonly="readonly" />
				</p>
				<p>
					<label for="content">글 내용</label>
					<textarea id="content" name="content" readonly="readonly">${select.content}</textarea>
				</p>
				<p>
					<label for="writer">작성자</label><input type="text" id="writer"
						name="writer" value="${select.writer}" readonly="readonly" /><br />
					<label>작성 날짜</label> <span><fmt:formatDate
							value="${select.regDate}" pattern="yyyy-MM-dd" /></span>
				</p>
				<p></p>
			</form>

		</section>

		<hr />

		<footer> neocom </footer>

	</div>

</body>
</html>