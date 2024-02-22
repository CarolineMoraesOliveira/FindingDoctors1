package com.caroline.findingdoctors1.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.caroline.findingdoctors1.models.LoginUser;
import com.caroline.findingdoctors1.models.RegisterUser;
import com.caroline.findingdoctors1.models.User;
import com.caroline.findingdoctors1.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {


@Autowired
private UserService userService;
	
	    
@GetMapping("/")
	public String index () {
		return "first.jsp";
}

// DOCTOR'S PAGE FOR LOGIN AND REGISTRATION //

@GetMapping("/doctor")
	public String showLoginRegistrationOptions (
	        @ModelAttribute ("newUser") RegisterUser newUser,
			@ModelAttribute ("newLogin") LoginUser newLogin){ 
	       
		return "doctor_login.jsp";
}
	
// DOCTOR'S REGISTRATION
	
@PostMapping("/register_doctor")
public String register (@Valid @ModelAttribute("newUser") RegisterUser newUser, 
		BindingResult result, HttpSession session, Model model) { 
	
   userService.register(newUser,result); 
   
    if(result.hasErrors()) {
    	
        model.addAttribute("newLogin", new LoginUser()); 
      
        return "doctor_login.jsp";
    }
    else {
    	
    	session.setAttribute("userId", newUser.getId());
    	
    return "redirect:/edit";
    }

}

//DOCTOR'S LOGIN

@PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	            			BindingResult result, Model model, HttpSession session) {
	        
	        
	         User user = userService.login(newLogin, result); 
	         
	    
	        if(result.hasErrors()) {  
	        	 
	            model.addAttribute("newUser", new RegisterUser());
	            
	            return "doctor_login.jsp"; 
	        }
	        else {
	        
	        	session.setAttribute("userId", user.getId()); 
	        	
	        return "redirect:/edit";
	        }
}


	 
@GetMapping ("/edit")
	 	public String formToEditDoctor (@ModelAttribute ("newUser") 
	 	User newUser, Model model, HttpSession session) { 
		
		 if (session.getAttribute("userId") == null) {
			 return "redirect:/";
		 }
		 else {
		 Long userId = (Long) session.getAttribute("userId");    
		 model.addAttribute("loggedUser", userService.findById(userId));
		 
		 User user = userService.findUserById(userId);
		 model.addAttribute("newUser", user);
		 
		  return "edit_doctor.jsp";
		 }
}

@PutMapping ("/{id}/update") 
public String updatedUser(@Valid @ModelAttribute ("newUser") User newUser, BindingResult result, 
		HttpSession session, Model model, @PathVariable ("id") Long id ) {
	 
	 if (session.getAttribute("userId") == null) {
		 
		return "redirect:/";
	}
	 Long userId = (Long) session.getAttribute("userId");
	 
	 if(result.hasErrors()) { 
		 System.out.println(result.getAllErrors());
		 model.addAttribute("loggedUser", userService.findById(id));
		 model.addAttribute("newUser", newUser);
     
		return "edit_doctor.jsp";
	}
	else {

		User updatedUser = userService.findUserById(userId);
		model.addAttribute("newUser", updatedUser);
        userService.onUpdate(newUser);
	
			 
		return "redirect:/"+id+"/updated_doctor";
	}
}

@GetMapping ("/{id}/updated_doctor")
public String showDoctorDetails (@PathVariable ("id") Long id, 
		 @ModelAttribute ("newUser") User newUser,
		 HttpSession session, Model model) 
		  {
	 
	 if (session.getAttribute("userId") == null) {
		 
		 return "redirect:/";
	 }
	 
	 else {
		 Long userId = (Long) session.getAttribute("userId"); 
		 model.addAttribute("loggedUser", userService.findById(userId));
		 
		 model.addAttribute("newUser", userService.findUserById(id));
		 
		 
		 return "doctor_profile.jsp";
	 }
}
@GetMapping ("/{id}/update")
public String formToUpdateDoctor (@ModelAttribute ("newUser") 
		User newUser, Model model, HttpSession session) { 

		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		else {
			Long userId = (Long) session.getAttribute("userId");    
			model.addAttribute("loggedUser", userService.findById(userId));
 
			User user = userService.findUserById(userId);
			model.addAttribute("newUser", user);
 
			return "edit_doctor.jsp";
		}
	}

//ROUTE TO DELETE THE DOCTOR PROFILE FROM THE DATABASE.

@DeleteMapping ("/{id}/delete")
	public String deleteProfileFromTheDB (@PathVariable ("id") Long id, 
			HttpSession session, Model model ) {
	
	 if (session.getAttribute("userId") == null) {
		 
			return "redirect:/";
		 }
		 else {
			 
			 Long userId = (Long) session.getAttribute("userId"); 
			 model.addAttribute("loggedUser", userService.findById(userId));
			 
			 userService.deleteProfile(id);
			
			 return "redirect:/"+id+"/new_profile";
		 }
	}
@GetMapping ("/{id}/new_profile")
public String pageToShowIfTheDoctorWantToMakeNewProfile (
		@ModelAttribute ("newUser") 
		User newUser, Model model, HttpSession session) { 

		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		else {
			Long userId = (Long) session.getAttribute("userId");    
			model.addAttribute("loggedUser", userService.findById(userId));
 
			User user = userService.findUserById(userId);
			model.addAttribute("newUser", user);
 
			return "new_profile.jsp";
		}
	}
}

