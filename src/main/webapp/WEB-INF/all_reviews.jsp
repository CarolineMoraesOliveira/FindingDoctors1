<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/all_reviews.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>All your reviews</title>
</head>
<body>
<div class="background-image">
<div class = "top">
	<p>FINDING<span>DOCTORS</span><p>
	<h1>All the reviews you made...</h1>
</div>
 	<c:forEach var="review" items="${filteredReviews}">
        <c:out value="${review.description}"></c:out> to <span><c:out value = "${review.reviewUser.firstName}"></c:out></span><br>
    </c:forEach>
    <a href="/show_all_doctors">Go back</a>
	<a href="/">Log out</a>
</div>
</body>
</html>