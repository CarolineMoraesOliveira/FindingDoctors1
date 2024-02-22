<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="white">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
	<style>
		body {font-family: 'Poppins';font-size: 15px;}
		a { text-decoration: none;}
	</style>
	<title>Finding Doctors</title>
	<link rel="stylesheet" type="text/css" href="/css/first.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/first.js"></script>	
</head>
<body style="background-color: white;">
<ul class="nav">
  <li class= nav-item>
  	<img src= "https://www.canva.com/design/DAF1kZws3KI/dCeNhDBYquhaLJKEY6PeyQ/edit?utm_content=DAF1kZws3KI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton" />
  </li>
  <li class="nav-item">
  	<a href="/doctor" class="btn btn-outline-primary" role="button">Are you a doctor</a>
  </li>
  <li class="nav-item">
  	<a href="/company" class="btn btn-outline-primary" role="button">Are you a company?</a>
  </li>
</ul>
<div class = "name">
	<h1>FINDING<span>DOCTORS</span></h1>
	<div class="fire-text">
		<h2>The best <span>way</span> to connect <span>employers</span> and specialty <span>doctors!</span></h2>
	</div>
</div>
</body>
</html>