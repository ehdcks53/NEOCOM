<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test.jsp</title>

</head>
<body>
	<h1>깃 테스트</h1>
	<h1>깃 테스트 인용</h1>
	
	<h1>카테고리 테스트</h1>
    <ul>
	    <c:forEach var="vo" items="${category_list }">
		    <li>카테고리코드 : ${vo.category_id }, 카테고리이름 : ${vo.category_name }, 카테고리상위코드 : ${vo.category_parent }, 카테고리순서 : ${vo.category_order }</li>	

	    </c:forEach>
    </ul>
    
</body>
</html>