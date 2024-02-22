<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/welcome_company.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Welcome, <c:out value="${loggedUser.companyUserName}"></c:out></title>
</head>
<body>
<div class="background-image">
		<div class = "top">
			<p>FINDING<span>DOCTORS</span><p>
		</div>
		<div class = "top">
			<div>
				<h2>Welcome, <span><c:out value="${loggedUser.companyUserName}"></c:out></span>!</h2>
			</div>
		<h3>Which doctor specialty would you like to find today?</h3>
		<form:form method="post" action="/all_available_doctors" modelAttribute="user">
		  <form:label path="specialty">Specialty</form:label>
		  <form:select path="specialty" id="specialtySelect">
		    <c:forEach var="eachUser" items="${users}">
		      <form:option path="specialty" value="${eachUser.specialty}">
		        <c:out value="${eachUser.specialty}" />
		      </form:option>
		    </c:forEach>
		  </form:select>
		  <form:label path="city">City</form:label>
		  <form:select path="city" id="citySelect">
		    <c:forEach var="eachUser" items="${users}">
		      <form:option path="city" value="${eachUser.city}">
		        <c:out value="${eachUser.city}" />
		      </form:option>
		    </c:forEach>
		  </form:select>
		  <input type="submit" value="See all doctors">
	</form:form>
	<script>
	  // Remove opções duplicadas do elemento 'specialtySelect'
	  var specialtySelect = document.getElementById("specialtySelect");
	  removeDuplicateOptions(specialtySelect);
	
	  // Remove opções duplicadas do elemento 'citySelect'
	  var citySelect = document.getElementById("citySelect");
	  removeDuplicateOptions(citySelect);
	
	  function removeDuplicateOptions(selectElement) {
	    var options = selectElement.getElementsByTagName("option");
	    var values = {};
	
	    for (var i = options.length - 1; i >= 0; i--) {
	      var value = options[i].value;
	      if (values[value]) {
	        selectElement.removeChild(options[i]);
	      } else {
	        values[value] = true;
	      }
	    }
	  }
	</script>
	<h3>Or would you prefer to do a review for a doctor?</h3>
	
	<form action="/show_all_doctors" method="get">
	   	<button type="submit" value="submit">Send a review to a doctor</button>
	</form>
	</div>
</div>
</body>
</html>