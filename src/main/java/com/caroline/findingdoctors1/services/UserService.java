package com.caroline.findingdoctors1.services;

import java.util.List;


import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.caroline.findingdoctors1.models.LoginUser;
import com.caroline.findingdoctors1.models.RegisterUser;
import com.caroline.findingdoctors1.models.User;
import com.caroline.findingdoctors1.repositories.UserRepository;

import jakarta.validation.Valid;



@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;

	    
public RegisterUser register(@Valid RegisterUser newUser, BindingResult result) { // method to get the results that was attached 
    	
    	Optional <User> userIsTryingToLog = userRepository.findByEmail(newUser.getEmail()); //call the repository to see if the email sent by the user already exist and
    	// the answer goes to a variable
    	if (userIsTryingToLog.isPresent()) { // if the email exist will be in the variable caught by the repository
    		
    		result.rejectValue("email", "Matches", "This user email already exists"); //the result from the user will be rejected in case the email (variable) is present (will match), and will send a message to the user
    	}
    	
    	if(!newUser.getPassword().equals(newUser.getConfirm())) { // or if the password doesn't match the confirm password
    		
    		result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	
    	if (result.hasErrors()) { // or if the result from the user has errors in validations will be returned the message in the model validation
    		
    		return null;
    	}
    		
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt()); // or everything is correct so the the password will be hashed, added to the salt and then hashed again 
    	newUser.setPassword(hashed); // the password that will be stored on the DB is the variable above that is the junction of the hashed password + salt + hash of both together
   
    	return userRepository.save(newUser); // after the process above so the newUser (registration) can be saved to DB
    	
    }
   


	public User findById(Long id) {
    	Optional <User> userIsTryingToLog = userRepository.findById(id); // calling the repository 
    	// to see if the id passed by the controller is already stored in DB
    		if (userIsTryingToLog.isPresent()) { // if the id is present so the repository is going to send
    			return userIsTryingToLog.get();
    		}
    		return null; // if is not present will return null
    }
   
    
    
    public User login(LoginUser newLoginObject, BindingResult result) {// the method to get newLoginObject and 
    	// his respective result
    	
    	Optional <User> userIsTryingToLog = userRepository.findByEmail(newLoginObject.getEmail());// the
    	// repository is going to try to find the newLoginObject 
    
    	if (!userIsTryingToLog.isPresent()) { // if the email is not present 
    		
    		result.rejectValue("email", "Matches", "This user is not found"); // we are going to reject 
    		// the result because the email doesn't match with any email stored 
    		
    		return null;
    	}
    		
    		User user = userIsTryingToLog.get(); // the other answer is if the email is present so 
    		// we are going to get this object
    	
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {// now we are going to test 
    		// the password from the id newLoginOject and the user stored with the same id password
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	    // going to reject the value sent by the newLoginObject in case the password don't match
    	    // with the user password stored 
    	}
    	
    	if (result.hasErrors()) {
    		
    		return null; //  there is error on email the return is null 
    	}
    	
    	else {
    		return user;  // if everything is ok so the service will return the user 
    	}
    	
 
    	
	}

public User findUserById(Long id) {
	Optional<User> UserOrEmpty = userRepository.findById(id);
		
		return UserOrEmpty.isPresent() ? UserOrEmpty.get() : null;
		
		}

public User onUpdate(User newUser) {

		return userRepository.save(newUser);
		
	}
	
public void deleteProfile(Long id) {
		userRepository.deleteById(id);
		
	}

public List<User> findAll() {
	
	return userRepository.findAll();
}

public List <User> findBySpecialtyAndCity(String specialty, String city){
	
	return userRepository.findBySpecialtyAndCity(specialty, city);
}
}

    

	

