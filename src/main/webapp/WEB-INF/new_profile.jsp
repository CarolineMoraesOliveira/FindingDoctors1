<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/new_profile.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Making a new profile</title>
</head>
<body>
<div class="background-image">
	<div class="top">
		<p>FINDING<span>DOCTORS</span><p>
	</div>
	<div class = "up">
		<h2>Wanna make a new profile or take a break?</h2><br>
		<h3>If you decide to make a new profile whenever you want is just make a new register with your first name, email and password. Hope see you back!</h3>
	</div>

<a href="/doctor">Make a new profile</a>
<a href="/">Log out</a>
</div>
</body>
</html>