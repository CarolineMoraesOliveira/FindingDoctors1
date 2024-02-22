<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/review_doctor.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Making a review</title>
</head>
<body>
<div class="background-image">
	<div class = "content">
	<div class = "top">
		<p>FINDING<span>DOCTORS</span><p>
	<div>
		<h1>Write a review for this doctor!</h1>
	</div>
	<h3><c:out value = "${thisUser.firstName} ${thisUser.lastName}"/></h3>
	
	<form:form action = "/${thisUser.id}/review" method = "post" modelAttribute = "newReview">
	
		<form:label path="description"></form:label>
		<form:textarea path = "description" cols="30" rows="10"></form:textarea>
		<form:errors path = "description"></form:errors>
		
		<form:input type= "hidden" path = "reviewCompanyUser" value="${loggedUser.id}"></form:input>
		<form:input type= "hidden" path = "reviewUser" value="${thisUser.id}"></form:input>
		<input class="button" type = "submit" value= "Submit">
	</form:form>
	<a href="/show_all_doctors">Go back</a>
	<a href="/">Log out</a>
	</div>
	</div>
</div>
</body>
</html>