<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/all_available_doctors.css">
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
			<h2>All available doctors by <span>specialty</span> and <span>city</span></h2>
		</div>
	</div>
<ul class="no-bullets">
  <c:forEach var="user" items="${filteredDoctors}">
    <li>
      <a href="/${user.id}/updated_doctor">
        <c:out value="${user.firstName}" />
        <c:out value="${user.lastName}" />
      </a><br>
    </li>
  </c:forEach>
</ul>
<a href="/welcome_company">Go back</a>
<a href="/">Log out</a>
</div>
</body>
</html>