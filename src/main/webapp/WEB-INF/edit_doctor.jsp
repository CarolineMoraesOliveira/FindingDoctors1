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
	<link rel="stylesheet" type="text/css" href="/css/edit_doctor.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/edit_doctor.js"></script>	
	<title>Edit your profile</title>
</head>
<body>
	<div class="top">
		<p>FINDING<span>DOCTORS</span><p>
	</div>
	<div class = "up">
		<h2>Hello, <span><c:out value="${loggedUser.firstName}"></c:out></span>!</h2><br>
		<h3>Your profile is your business card! Invest time to show your full potential !</h3>
	</div>
	<form:form action="/${newUser.id}/update" method="post" modelAttribute="newUser">
	<input type="hidden" name="_method" value="put">
		
		<form:input type ="hidden" path = "firstName"></form:input>  
		
		<div class = "division">
			<div>
				<div class=" question">
					<form:label path="lastName">Last name</form:label>
				</div>
				<form:input type ="text" path = "lastName" class="form-input" placeholder="Your last name" ></form:input>   
				<form:errors path = "lastName"></form:errors><br>
				
				<div class=" question">
					<form:label path="city">Located city</form:label>
				</div>
				<form:input type ="text" path = "city" class="form-input" placeholder="The city you live"></form:input>   
				<form:errors path = "city"></form:errors><br>
				
				<div class=" question">
					<form:label path="email">Email</form:label><br>
				</div>
				<form:input type = "text" path = "email" class="form-input" placeholder="Your e-mail"/><br>
				<form:errors path = "email"></form:errors>
				
				<div class=" question">			
					<form:label path="gradInstitution">Graduation Institution</form:label>
				</div>
				<form:input path="gradInstitution" type = "text" class="form-input" placeholder="The institution you graduated"/>
				<form:errors path = "gradInstitution"></form:errors><br>
				
				<div class=" question">
					<form:label path="specialty">Medical Specialty</form:label>
				</div>
				<form:input type ="text" path = "specialty" class="form-input" placeholder="Your main medical specialty area"></form:input>   
				<form:errors path = "specialty"></form:errors><br>
				
				
				<p>Do you have any specialized certification?
					<input type="radio" name="haveCertification" value="yes" id="yes">
					<label for="yes">Yes</label>
					<input type="radio" name="haveCertification" value="no" id="no">
					<label for="no">No</label>
				</p>
				
				<div class=" question">
					<form:label path="certification">Describe your certificates or specialized skills/year of completion</form:label>
				</div>
				<form:textarea path = "certification" cols="10" rows="10"></form:textarea>
				<form:errors path = "certification"></form:errors><br>
				
			
				<p>Do you have a pos graduation?
					<input type="radio" name="havePosGrad" value="yes" id="yes">
					<label for="yes">Yes</label>
					<input type="radio" name="havePosGrad" value="no" id="no">
					<label for="no">No</label>
				</p>
				
				<div class=" question">
					<form:label path="posGrad">Describe the pos graduations you have</form:label>
				</div>
				<form:textarea path = "posGrad" cols="10" rows="10"></form:textarea>
				<form:errors path = "posGrad"></form:errors><br>
			</div>
			<div>
				<div class=" question">	
					<form:label path="dayShift">Availability (days-shift)</form:label>
				</div>
				<form:input type ="text" path = "dayShift" class="form-input" placeholder="The days you are able to work"></form:input>   
				<form:errors path = "dayShift"></form:errors><br>
			
				<div class=" question">	
					<form:label path="skills">Tell us about yourself and any personal skills you have</form:label>
				</div>
				<form:textarea path = "skills" cols="10" rows="10"></form:textarea>
				<form:errors path = "skills"></form:errors><br>
			
				<div class=" question">
					<form:label path="phone">Phone</form:label>
				</div>
				<form:input path= "phone" type = "number" name ="number" class="form-input" placeholder="(000)000-0000 this format"/>
				<form:errors path = "phone"></form:errors><br>
				
				<div class=" question">	
					<form:label path="facebook">Facebook</form:label>
				</div>
				<form:input type ="text" path = "facebook" class="form-input" placeholder="Your facebook profile"></form:input>   
				<form:errors path = "facebook"></form:errors><br>
			
				<div class=" question">	
					<form:label path="linkedIn">linkedIn</form:label>
				</div>
				<form:input type ="text" path = "linkedIn" class="form-input" placeholder="Your linkedIn profile"></form:input>   
				<form:errors path = "linkedIn"></form:errors><br>
			</div>
		</div>
		<form:input type ="hidden" path = "password"></form:input>  	
		<input class="button" type = "submit" value= "Submit">
	</form:form>
</body>
</html>