<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="/css/doctor_login.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/first.js"></script>	
	<title>Login and Registration</title>
</head>
<body>
<div class="background-image">
<div class = "top">
	<p>FINDING<span>DOCTORS</span><p>
	<h1>Welcome doctor!</h1>
	<p>Join our growing community</p>
</div>
<div class = tables>
	<div>
		<h2 class="top2">Log in</h2>
		<form:form action = "/login" modelAttribute = "newLogin" method = "post">
	
			<form:label path="email">Email:</form:label>
			<form:errors path = "email" id="error-message"></form:errors><br>
			<form:input type = "email" path = "email"/><br>
		
			<form:label path="password">Password:</form:label>
			<form:errors path = "password" id="error-message"></form:errors><br>
			<form:input type = "password" path = "password"/><br>
	
			 <button type="submit" class="btn btn-primary">Log in</button>
		</form:form>
	</div>
	<div>
		<h2 class= "top1">Register</h2>
		<form:form action = "/register_doctor" modelAttribute = "newUser" method = "post"> <!-- action to send the form by a post method and "blank paper with the user data -->
	
			<form:label path="firstName">First name:</form:label>
			<form:errors path = "firstName" id="error-message"></form:errors><br>
			<form:input type = "text" path = "firstName"/><br>
	
			<form:label path="email">Email:</form:label>
			<form:errors path = "email" id="error-message"></form:errors><br>
			<form:input type = "email" path = "email"/><br>
	
			<form:label path="password">Password:</form:label>
			<form:errors path = "password" id="error-message"></form:errors><br>
			<form:input type = "password" path = "password" /><br>
	
			<form:label path="confirm">Confirm password:</form:label>
			<form:errors path = "confirm" id="error-message"></form:errors><br>
			<form:input type = "password" path = "confirm"/><br>

			 <button type="submit" class="btn btn-primary">Register</button>
		</form:form>
	</div>
</div>
</div>

</body>
</html>