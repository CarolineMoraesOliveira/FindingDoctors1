<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/doctor_profile.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Doctor Profile</title>
</head>
<body>
	<div class = "top">
		<h2><c:out value= "${loggedUser.firstName}"></c:out>'s profile page</h2>
		<a href="/welcome_company">Go back</a>
		<a href="/">Log out</a>
	</div>
	<h4>Full name: <span><c:out value = "${newUser.firstName} "></c:out></span><span><c:out value="${newUser.lastName}"></c:out></span></h4>
	<h4>Email: <span><c:out value="${newUser.email}"></c:out></span></h4>
	<h4>Located city: <span><c:out value="${newUser.city}"></c:out></span></h4>
	<h4>Medical Specialty: <span><c:out value="${newUser.specialty}"></c:out></span></h4>
	<h4>Graduation Institution: <span><c:out value="${newUser.gradInstitution}"></c:out></span></h4>
	<h4>Certificates or specialized skills: <span><c:out value="${newUser.certification}"></c:out></span></h4>
	<h4>Pos graduation: <span><c:out value="${newUser.posGrad}"></c:out></span></h4>
	<h4>Availability/days-shift: <span><c:out value="${newUser.dayShift}"></c:out></span></h4>
	<h4>Personal information and skills: <span><c:out value="${newUser.skills}"></c:out></span></h4>
	<h4>LinkedIn profile: <span><c:out value="${newUser.linkedIn}"></c:out></span></h4>	

</body>
</html>