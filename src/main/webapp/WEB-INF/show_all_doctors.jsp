<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/show_all_doctors.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>All doctors by specialty and city</title>
</head>
<body>
<div class="background-image">
	<div class = "top">
		<p>FINDING<span>DOCTORS</span><p>
	</div>
	<div class = "top">
		<div>
			<h2>Choose a doctor to send a <span>review</span></h2>
		</div>
	<ul class = "no-bullets">
  		<c:forEach var="user" items="${users}">
    		<li>
      			<a href="/${user.id}/review">
       				<c:out value="${user.firstName}" />
        			<c:out value="${user.lastName}" />
      			</a><br>
    		</li>
 		 </c:forEach>
	</ul>
	</div>
	<div>
		<a href="/welcome_company">Go back</a>
		<a href="/">Log out</a>
	</div>
</div>
</body>
</html>