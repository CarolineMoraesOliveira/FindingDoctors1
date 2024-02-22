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
<title>All doctors by specialty and city</title>
</head>
<body>
<div>
	<h1>All available doctors by specialty and city</h1>
	<a href="/">Go back</a>
	<a href="/">Log out</a>
</div>
<ul>
  <c:forEach var="user" items="${filteredDoctors}">
    <li>
      <a href="/${user.id}/updated_doctor">
        <c:out value="${user.firstName}" />
        <c:out value="${user.lastName}" />
      </a><br>
    </li>
  </c:forEach>
</ul>
</body>
</html>