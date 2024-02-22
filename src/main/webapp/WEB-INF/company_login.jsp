<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/company_login.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Login and Registration</title>
</head>
<body>
<div class="background-image">
<div class = "top">
	<p>FINDING<span>DOCTORS</span><p>
	<h1>Welcome company!</h1>
	<p>Join our growing community</p>
</div>
<div class = tables>
	<div>
		<h2 class= "top1">Login</h2>
		<form:form action = "/company_login" modelAttribute = "newLoginCompany" method = "post">
	
			<form:label path="email">Email:</form:label>
			<form:errors path = "email" id="error-message"></form:errors><br>
			<form:input type = "email" path = "email"/><br>
		
			<form:label path="password">Password:</form:label>
			<form:errors path = "password" id="error-message"></form:errors><br>
			<form:input type = "password" path = "password"/><br>
	
			<input type = "submit" value = "Submit"/>
		</form:form>
	</div>
	<div>
		<h2 class="top2">Register</h2>
		<form:form action = "/company_register" modelAttribute = "newCompanyUser" method = "post"> <!-- action to send the form by a post method and "blank paper with the user data -->
	
			<form:label path="companyUserName">Username:</form:label>
			<form:errors path = "companyUserName" id="error-message"></form:errors><br>
			<form:input type = "text" path = "companyUserName"/><br>
	
			<form:label path="email">Email:</form:label>
			<form:errors path = "email" id="error-message"></form:errors><br>
			<form:input type = "text" path = "email"/><br>
	
			<form:label path="password">Password:</form:label>
			<form:errors path = "password" id="error-message"></form:errors><br>
			<form:input type = "password" path = "password"/><br>
	
			<form:label path="confirm">Confirm Password:</form:label>
			<form:errors path = "confirm" id="error-message"></form:errors><br>
			<form:input type = "password" path = "confirm"/><br>

			<input type = "submit" value = "Submit"/>
		</form:form>
	</div>
</div>
</div>
</body>
</html>