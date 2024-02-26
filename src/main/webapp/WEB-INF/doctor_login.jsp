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
<div class = "top">
	<p>FINDING<span>DOCTORS</span><p>
	<h1>Welcome doctor!</h1>
	<p>Join our growing community</p>
</div>
<div class = tables>
	<div>
		<h2 class="top2">Log in</h2>
		<form:form action = "/login" modelAttribute = "newLogin" method = "post">
	
			<div class="input-group">
				<form:label path="email"></form:label>
				<form:input type = "email" path = "email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="input-group-left"/><br>
			</div>
			<form:errors path = "email" id="error-message"></form:errors><br>
			
			<div class="input-group">
				<form:label path="password"></form:label>
				<form:input type = "password" path = "password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="input-group-left"/><br>
			</div>	
			<form:errors path = "password" id="error-message"></form:errors><br>
			
			
			 <button type="submit" class="btn btn-primary">Log in</button>
		
		</form:form>
	</div>
	<div>
		<h2 class= "top1">Register</h2>
		<form:form action = "/register_doctor" modelAttribute = "newUser" method = "post"> <!-- action to send the form by a post method and "blank paper with the user data -->
	
			<div class="input-group">
				<form:label path="firstName"></form:label>
				<form:input type = "text" path = "firstName" class="form-control" placeholder="First name" aria-label="First name" aria-describedby="input-group-left"/><br>
			</div>	
			<form:errors path = "firstName" id="error-message"></form:errors><br>
			
			<div class="input-group">
				<form:label path="email"></form:label>
				<form:input type = "email" path = "email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="input-group-left"/><br>
			</div>	
			<form:errors path = "email" id="error-message"></form:errors><br>
			
			<div class="input-group">
				<form:label path="password"></form:label>
				<form:input type = "password" path = "password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="input-group-left"/><br>
			</div>	
			<form:errors path = "password" id="error-message"></form:errors><br>
			
			<div class="input-group">
				<form:label path="confirm"></form:label>
				<form:input type = "password" path = "confirm" class="form-control" placeholder="Confirm password" aria-label="Confirm password" aria-describedby="input-group-left"/><br>
			</div>	
			<form:errors path = "confirm" id="error-message"></form:errors><br>
		
			
			<button type="submit" class="btn btn-primary">Register</button>
		</form:form>
	</div>
</div>
</body>
</html>