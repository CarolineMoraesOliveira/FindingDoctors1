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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="/css/doctor_profile.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/doctor_profile.js"></script>
	<title>Finding Doctors</title>		
</head>
<body>
<div class="background-image">
	<div class = "top">
		<p>FINDING<span>DOCTORS</span><p>
	</div>
	<div class = "top1">
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