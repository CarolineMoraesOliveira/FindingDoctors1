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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	<title>Edit your profile</title>
</head>
<body>
	<div class="top">
		<p>FINDING<span>DOCTORS</span><p>
	</div>
	<div class = "up">
		<h2>Hello, <span><c:out value="${loggedUser.firstName}"></c:out></span>!</h2><br>
		<h3>Your profile is your business card! Invest time to show your full potential!</h3>
	</div>
	<form:form action="/${newUser.id}/update" method="post" modelAttribute="newUser">
	<input type="hidden" name="_method" value="put">
		
		<form:input type ="hidden" path = "firstName"></form:input>  
		
		<div class = "division">
			<div>
				<div class="input-group">
					<form:label path="lastName"></form:label>
					<form:input type = "lastName" path = "lastName" class="form-control" style="text-align: left;" placeholder="Last name" aria-label="Last name" aria-describedby="input-group-left"/><br>
				</div>
				<form:errors path = "lastName" id="error-message"></form:errors><br>
				<div class="input-group">
					<form:label path="city"></form:label>
					<form:input type = "city" path = "city" class="form-control" style="text-align: left;" placeholder="The city you live" aria-label="City" aria-describedby="input-group-left"/><br>
				</div>
				<form:errors path = "city" id="error-message"></form:errors><br>
				<div class="input-group">
					<form:label path="email"></form:label>
					<form:input type = "email" path = "email" class="form-control" style="text-align: left;" placeholder="Email" aria-label="Emal" aria-describedby="input-group-left"/><br>
				</div>
				<form:errors path = "email" id="error-message"></form:errors><br>
				<div class="input-group">
					<form:label path="gradInstitution"></form:label>
					<form:input type = "gradInstitution" path = "gradInstitution" class="form-control" style="text-align: left;" placeholder="The institution you graduated" aria-label="gradInstitution" aria-describedby="input-group-left"/><br>
				</div>
				<form:errors path = "gradInstitution" id="error-message"></form:errors><br>
				<div class="input-group">
					<form:label path="specialty"></form:label>
					<form:input type = "specialty" path = "specialty" class="form-control" style="text-align: left;" placeholder="Your main medical specialty area" aria-label="specialty" aria-describedby="input-group-left"/><br>
				</div>
				<form:errors path = "specialty" id="error-message"></form:errors><br>
				<p>
					Do you have any specialized certification?
					<input type="radio" name="haveCertification" value="yes" id="yes">
					<label for="yes">Yes</label>
					<input type="radio" name="haveCertification" value="no" id="no">
					<label for="no">No</label>
				</p>
				<div id="haveCertificationError" class="error-message" style="display: none;"></div>
				<div class="input-group" id="certificationField" style="display: none;">
					<form:label path="certification"></form:label>
					<form:textarea type = "certification" path="certification" class="form-input superlarge-textbox" style="text-align: left;" placeholder="Describe your certificates or specialized skills/year of completion" aria-label="certification" aria-describedby="input-group-left"></form:textarea>
				</div>
				<form:errors path = "certification" id="error-message"></form:errors><br>
				<script>
				    $(document).ready(function() {
				        // Função para validar o campo haveCertification
				        function validateHaveCertification() {
				            if ($('input[name="haveCertification"]:checked').val() === "yes") {
				                $('#certificationField').show();
				            } else {
				                $('#certificationField').hide();
				            }
				        }
				
				        // Validar ao carregar a página
				        validateHaveCertification();
				
				        // Validar ao alterar a seleção
				        $('input[name="haveCertification"]').change(function() {
				            validateHaveCertification();
				        });
				    });
				</script>
				<p>Do you have a post graduation?
					<input type="radio" name="havePosGrad" value="yes" id="yes">
					<label for="yes">Yes</label>
					<input type="radio" name="havePosGrad" value="no" id="no">
					<label for="no">No</label>
				</p>
				<div id="havePosGradError" class="error-message" style="display: none;"></div>
				<div class="input-group" id="posGradField" style="display: none;">
					<form:label path="posGrad"></form:label>
					<form:textarea type = "posGrad" path="posGrad" class="form-input superlarge-textbox" style="text-align: left;" placeholder="Describe the post graduations you have" aria-label="certification" aria-describedby="input-group-left"></form:textarea>
				<div>
				<form:errors path = "posGrad" id="error-message"></form:errors><br>
				</div>
			</div>
				<script>
				    $(document).ready(function() {
				        // Função para validar o campo havePosGrad
				        function validateHavePosGrad() {
				        	 if ($('input[name="havePosGrad"]:checked').val() === "yes") {
					                $('#posGradField').show();
					            } else {
					                $('#posGradField').hide();
					            }
					        }
				
				        // Validar ao enviar o formulário
				     		validateHavePosGrad();
				
				     	// Validar ao alterar a seleção
					        $('input[name="havePosGrad"]').change(function() {
					            validateHavePosGrad();
				        });
				    });
				</script>
				<div class="question">
				    <label class="form-label">Availability</label>
				    <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="mondayCheckbox" name="availableDays" value="MONDAY">
				        <label class="form-check-label" for="mondayCheckbox">Monday</label>
				    </div>
				    <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="tuesdayCheckbox" name="availableDays" value="TUESDAY">
				        <label class="form-check-label" for="tuesdayCheckbox">Tuesday</label>
				    </div>
				    <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="wednesdayCheckbox" name="availableDays" value="WEDNESDAY">
				        <label class="form-check-label" for="wednesdayCheckbox">Wednesday</label>
				    </div>
				     <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="thursdayCheckbox" name="availableDays" value="THURSDAY">
				        <label class="form-check-label" for="thursdayCheckbox">Thursday</label>
				    </div>
				     <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="fridayCheckbox" name="availableDays" value="FRIDAY">
				        <label class="form-check-label" for="fridayCheckbox">Friday</label>
				    </div>
				     <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="saturdayCheckbox" name="availableDays" value="SATURDAY">
				        <label class="form-check-label" for="saturdayCheckbox">Saturday</label>
				    </div>
				     <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="sundayCheckbox" name="availableDays" value="SUNDAY">
				        <label class="form-check-label" for="sundayCheckbox">Sunday</label>
				    </div>
				     <div class="form-check" style="display: inline-flex;">
				        <input class="form-check-input" type="checkbox" id="nightsCheckbox" name="availableDays" value="NIGHTS">
				        <label class="form-check-label" for="nightsCheckbox">NIGHTS</label>
				    </div>
				</div>
				<div id="availabilityError" class="error-message" style="display: none;">Please select at least one day</div>
				<script>
				    $(document).ready(function() {
				        // Validar ao enviar o formulário
				        $('form').submit(function() {
				            var checkedDays = $('input[name="availableDays"]:checked').length;
				            if (checkedDays === 0) {
				                $('#availabilityError').show();
				                return false;
				            }
				            $('#availabilityError').hide();
				            return true;
				        });
				    });
				</script>
				<div class="input-group">
					<form:label path="skills"></form:label>
				</div>
					<form:textarea path="skills" class="form-input superlarge-textbox" style="text-align: left;" placeholder="Tell us about yourself and any personal skills you have" aria-label="skills" aria-describedby="input-group-left"></form:textarea>
				</div>
				
				<form:errors path = "skills" id="error-message"></form:errors><br>
				</div>
		
			<div class= "question">
				<div class="input-group">
					<form:label path="phone"></form:label>
					<form:input type = "phone" path = "phone" name ="number" class= "form-input large-textbox" placeholder="(000)000-0000 this format" style="text-align: left;" aria-label="phone" aria-describedby="input-group-left"/><br>
				</div>
				<form:errors path = "phone" id="error-message"></form:errors><br>
				
				
				
			
				
				
				
				
				
				<div class="input-group">	
					<form:label path="facebook">Facebook</form:label>
				</div>
				<form:input type ="text" path = "facebook" class= "form-input large-textbox" placeholder="Your facebook profile"></form:input>   
				<div>
					<form:errors path = "facebook"></form:errors><br>
				</div>
				
				
				<div class="input-group">	
					<form:label path="linkedIn">LinkedIn</form:label>
				</div>
				<form:input type ="text" path = "linkedIn" class= "form-input large-textbox" placeholder="Your linkedIn profile"></form:input>   
				<div>
					<form:errors path = "linkedIn"></form:errors><br>
				</div>
			</div>
		</div>
		<form:input type ="hidden" path = "password"></form:input>  	
		<input class="button" type = "submit" value= "Submit">
	</form:form>
</body>
</html>