<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/register.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Welcome</title>
</head>
<body>
<p>FINDING<span>DOCTORS</span><p>
<h2>Hello!</h2><br>
<h3>It is an immense pleasure to have you with us.</h3>
<h4>Just some information about you in order to connect with potential employers!</h4><br>

<form:form action="/register_doctor" method="post" modelAttribute="newUser">
	
	<form:label path="lastName">Last name</form:label>
	<form:input path="lastName" type = "text"/>
	<form:errors path = "lastName"></form:errors><br>
				
	<form:label path="gradInstitution">Graduation Institution</form:label>
	<form:input path="gradInstitution" type = "text"/>
	<form:errors path = "gradInstitution"></form:errors><br>

	<form:label path="specialty">Medical Specialty</form:label>
	<form:input type ="text" path = "specialty"></form:input>   
	<form:errors path = "specialty"></form:errors><br>
	
	<form:label path="haveCertification">Do you have any specialized certification?</form:label>
	<input type="checkbox" name="haveCertification" value="true">
	<form:errors path = "haveCertification"></form:errors><br>
	
	<form:label path="certification">Describe your certificates or specialized skills/year of completion</form:label>
	<form:textarea path = "certification" cols="10" rows="10"></form:textarea>
	<form:errors path = "certification"></form:errors><br>
		
	<form:label path="havePosGrad">Do you have a pos graduation?</form:label>
	<input type="checkbox" name="haveCertification" value="true">
	<form:errors path = "havePosGrad"></form:errors><br>
		
	<form:label path="posGrad">Describe your pos graduations/year of completion</form:label>
	<form:textarea path = "posGrad" cols="10" rows="10"></form:textarea>
	<form:errors path = "posGrad"></form:errors><br>
		
		
	<form:label path="dayShift">Availability (days-shift)</form:label>
	<form:input type ="text" path = "dayShift"></form:input>   
	<form:errors path = "dayShift"></form:errors><br>
		
	<form:label path="skills">Tell us about yourself and any personal skills you have</form:label>
	<form:textarea path = "skills" cols="10" rows="10"></form:textarea>
	<form:errors path = "skills"></form:errors><br>
		
	<form:label path="phone">Phone</form:label>
	<form:input path= "phone" type = "number" name ="number"/>
	<form:errors path = "phone"></form:errors><br>
		
	<form:label path="facebook">Facebook</form:label>
	<form:input type ="text" path = "facebook"></form:input>   
	<form:errors path = "facebook"></form:errors><br>
		
	<form:label path="linkedIn">linkedIn</form:label>
	<form:input type ="text" path = "linkedIn"></form:input>   
	<form:errors path = "linkedIn"></form:errors><br>
	
	<form:label path="password">Password</form:label><br>
	<form:errors path = "password"></form:errors>
	<form:input type = "password" path = "password"/><br>
	
	<form:label path="confirm">Confirm Password</form:label><br>
	<form:errors path = "confirm"></form:errors>
	<form:input type = "password" path = "confirm"/><br>

		
	<input class="button" type = "submit" value= "Submit">
</form:form>
</body>
</html>