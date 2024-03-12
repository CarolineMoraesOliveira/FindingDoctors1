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
				<div class="question">
					<form:label path="lastName">Last name</form:label>
				</div>
				<form:input type ="text" path = "lastName" class="form-input large-textbox" placeholder="Your last name" ></form:input>   
				<form:errors path = "lastName"></form:errors><br>
				
				<div class=" question">
					<form:label path="city">Located city</form:label>
				</div>
				<form:input type ="text" path = "city" class="form-input large-textbox" placeholder="The city you live"></form:input>   
				<form:errors path = "city"></form:errors><br>
				
				<div class=" question">
					<form:label path="email">Email</form:label><br>
				</div>
				<form:input type = "text" path = "email" class="form-input large-textbox" placeholder="Your e-mail"/><br>
				<form:errors path = "email"></form:errors>
				
				<div class=" question">			
					<form:label path="gradInstitution">Graduation Institution</form:label>
				</div>
				<form:input path="gradInstitution" type = "text" class="form-input large-textbox" placeholder="The institution you graduated"/>
				<form:errors path = "gradInstitution"></form:errors><br>
				
				<div class=" question">
					<form:label path="specialty">Medical Specialty</form:label>
				</div>
				<form:input type ="text" path = "specialty" class= "form-input large-textbox" placeholder="Your main medical specialty area"></form:input>   
				<form:errors path = "specialty"></form:errors><br>
				
				
				<p>Do you have any specialized certification?
					<input type="radio" name="haveCertification" value="yes" id="yes">
					<label for="yes">Yes</label>
					<input type="radio" name="haveCertification" value="no" id="no">
					<label for="no">No</label>
				</p>
				<div id="haveCertificationError" class="error-message" style="display: none;"></div>
				<script>
				    $(document).ready(function() {
				        // Função para validar o campo haveCertification
				        function validateHaveCertification() {
				            if ($('input[name="haveCertification"]:checked').length === 0) {
				                $('#haveCertificationError').text('Please select an option').show();
				                return false;
				            }
				            $('#haveCertificationError').hide();
				            return true;
				        }
				
				        // Validar ao enviar o formulário
				        $('form').submit(function() {
				            return validateHaveCertification();
				        });
				
				        // Validar ao alterar a seleção
				        $('input[name="haveCertification"]').change(function() {
				            validateHaveCertification();
				        });
				    });
			</script>
				
			</div>
			<div>
				<div class=" question">
					<form:label path="certification">Describe your certificates or specialized skills/year of completion</form:label>
				</div>
				<form:textarea path = "certification" class= "form-input superlarge-textbox"></form:textarea>
				<form:errors path = "certification"></form:errors><br>
				
			
				<p>Do you have a pos graduation?
					<input type="radio" name="havePosGrad" value="yes" id="yes">
					<label for="yes">Yes</label>
					<input type="radio" name="havePosGrad" value="no" id="no">
					<label for="no">No</label>
				</p>
				<div id="havePosGradError" class="error-message" style="display: none;"></div>
				<script>
				    $(document).ready(function() {
				        // Função para validar o campo havePosGrad
				        function validateHavePosGrad() {
				            if ($('input[name="havePosGrad"]:checked').length === 0) {
				                $('#havePosGradError').text('Please select an option').show();
				                return false;
				            }
				            $('#havePosGradError').hide();
				            return true;
				        }
				
				        // Validar ao enviar o formulário
				        $('form').submit(function() {
				            return validateHavePosGrad();
				        });
				
				        // Validar ao alterar a seleção
				        $('input[name="havePosGrad"]').change(function() {
				            validateHavePosGrad();
				        });
				    });
			</script>


				<div class=" question">
					<form:label path="posGrad">Describe the pos graduations you have</form:label>
				</div>
				<form:textarea path = "posGrad" class= "form-input superlarge-textbox"></form:textarea>
				<form:errors path = "posGrad"></form:errors><br>
			</div>
			<div>
				<div class="question">   
				    <div class="form-floating d-flex justify-content-center">
				        <label for="floatingSelect" class="form-floating d-flex justify-content-center">Availability</label>
				        <select class="form-select" id="floatingSelect" aria-label="Floating label select example" style="width:200px;" name="dayShift" required>
						    <option value="" selected disabled hidden>Day-shift</option>
						    <option value="MONDAY">Monday</option>
						    <option value="TUESDAY">Tuesday</option>
						    <option value="WEDNESDAY">Wednesday</option>
						    <option value="THURSDAY">Thursday</option>
						    <option value="FRIDAY">Friday</option>
						    <option value="SATURDAY">Saturday</option>
						    <option value="SUNDAY">Sunday</option>
						</select>

					</div>
				    <div id="dayShiftError" class="error-message" style="display: none;">Please select an option</div>
				</div>

				<script>
				    $(document).ready(function() {
				        // Validar ao enviar o formulário
				        $('form').submit(function() {
				            var selectedValue = $('#floatingSelect').val();
				            if (selectedValue === null || selectedValue === '') {
				                $('#dayShiftError').show();
				                return false;
				            }
				            $('#dayShiftError').hide();
				            return true;
				        });
				    });
				</script>

				<div class=" question">	
					<form:label path="skills">Tell us about yourself and any personal skills you have</form:label>
				</div>
				<form:textarea path = "skills" class= "form-input superlarge-textbox"></form:textarea>
				<form:errors path = "skills"></form:errors><br>
			
				<div class=" question">
					<form:label path="phone">Phone</form:label>
				</div>
				<form:input path= "phone" type = "number" name ="number" class= "form-input large-textbox" placeholder="(000)000-0000 this format"/>
				<form:errors path = "phone"></form:errors><br>
				
				<div class=" question">	
					<form:label path="facebook">Facebook</form:label>
				</div>
				<form:input type ="text" path = "facebook" class= "form-input large-textbox" placeholder="Your facebook profile"></form:input>   
				<form:errors path = "facebook"></form:errors><br>
			
				<div class=" question">	
					<form:label path="linkedIn">linkedIn</form:label>
				</div>
				<form:input type ="text" path = "linkedIn" class= "form-input large-textbox" placeholder="Your linkedIn profile"></form:input>   
				<form:errors path = "linkedIn"></form:errors><br>
			</div>
		</div>
		<form:input type ="hidden" path = "password"></form:input>  	
		<input class="button" type = "submit" value= "Submit">
	</form:form>
</body>
</html>