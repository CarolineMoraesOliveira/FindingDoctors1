package com.caroline.findingdoctors1.services;


import java.util.Optional;



import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.caroline.findingdoctors1.models.CompanyUser;
import com.caroline.findingdoctors1.models.LoginCompanyUser;
import com.caroline.findingdoctors1.repositories.CompanyUserRepository;

@Service
public class CompanyUserService {
	
	@Autowired
	private CompanyUserRepository companyUserRepository;

	    
    public CompanyUser register(CompanyUser newCompany, BindingResult result) { // method to get the results that was attached 
    	
    	Optional <CompanyUser> companyIsTryingToLog = companyUserRepository.findByEmail(newCompany.getEmail()); //call the repository to see if the email sent by the user already exist and
    	// the answer goes to a variable
    	if (companyIsTryingToLog.isPresent()) { // if the email exist will be in the variable caught by the repository
    		
    		result.rejectValue("email", "Matches", "This user email already exists"); //the result from the user will be rejected in case the email (variable) is present (will match), and will send a message to the user
    	}
    	
    	if(!newCompany.getPassword().equals(newCompany.getConfirm())) { // or if the password doesn't match the confirm password
    	    
    		result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	
    	if (result.hasErrors()) { // or if the result from the user has errors in validations will be returned the message in the model validation
    		
    		return null;
    	}
    		
    	String hashed = BCrypt.hashpw(newCompany.getPassword(), BCrypt.gensalt()); // or everything is correct so the the password will be hashed, added to the salt and then hashed again 
    	newCompany.setPassword(hashed); // the password that will be stored on the DB is the variable above that is the junction of the hashed password + salt + hash of both together
    	
    	return companyUserRepository.save(newCompany); // after the process above so the newUser (registration) can be saved to DB
    	
    }
    
    public CompanyUser findById(Long id) {
    	Optional <CompanyUser> companyIsTryingToLog = companyUserRepository.findById(id); // calling the repository 
    	// to see if the id passed by the controller is already stored in DB
    		if (companyIsTryingToLog.isPresent()) { // if the id is present so the repository is going to send
    			return companyIsTryingToLog.get();
    		}
    		return null; // if is not present will return null
    }
   
    
    
    public CompanyUser login(LoginCompanyUser newLoginObject, BindingResult result) {// the method to get newLoginObject and 
    	
    	
    	Optional <CompanyUser> companyIsTryingToLog = companyUserRepository.findByEmail(newLoginObject.getEmail());// the
    	
    
    	if (!companyIsTryingToLog.isPresent()) { 
    		
    		result.rejectValue("email", "Matches", "This user is not found");  
    		
    		
    		return null;
    	}
    		
    	CompanyUser companyUser = companyIsTryingToLog.get();  
    		
    	
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), companyUser.getPassword())) {// now we are going to test 
    		
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	    
    	}
    	
    	if (result.hasErrors()) {
    		
    		return null; 
    	}
    	
    	else {
    		return companyUser;   
    	}
    	
    }


    public CompanyUser update(CompanyUser companyUser) {
		
		return companyUserRepository.save(companyUser);
	}
	
	

}
	

