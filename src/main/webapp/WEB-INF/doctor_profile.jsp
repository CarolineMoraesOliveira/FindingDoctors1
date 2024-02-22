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
<div class="background-image">
	<div class = "top">
		<p>FINDING<span>DOCTORS</span><p>
	</div>
	<div class = "top">
		<div>
			<h2><c:out value= "${newUser.firstName}"></c:out>'s profile page</h2>
		</div>
		<div class= "buttons">
				
				<c:if test = "${loggedUser.id == newUser.id}">
				
					<form action="/${newUser.id}/update" method="get">
				   		<button type="submit" value="edit">Edit profile</button>
					</form>
				
				
					<form action= "/${newUser.id}/delete" method="post"> 
						<input type="hidden" name="_method" value="delete"/>
						<input type="submit" value="Delete profile"/>
					</form>
				
				</c:if>
				<c:if test = "${loggedUser.id != newUser.id}">
					
						<a href="/welcome_company">Go Back</a>
					
				</c:if>
				
					<a href="/">Log out</a>
				
			
		</div>
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
	
	
</div>
</body>
</html>