package com.caroline.findingdoctors1.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.caroline.findingdoctors1.models.CompanyUser;
import com.caroline.findingdoctors1.models.LoginCompanyUser;
import com.caroline.findingdoctors1.models.User;
import com.caroline.findingdoctors1.services.CompanyUserService;
import com.caroline.findingdoctors1.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CompanyController {

	@Autowired
	private CompanyUserService companyUserService;
	
	@Autowired
	private UserService userService;

	
	@GetMapping("/company")
		public String pageToShowLoginRegistration (
				@ModelAttribute ("newCompanyUser") CompanyUser newCompanyUser, 
				@ModelAttribute ("newLoginCompany") CompanyUser newLoginCompany) {
		return "company_login.jsp";
	}
		    
	 @PostMapping("/company_register")
	    public String register (@Valid @ModelAttribute("newCompanyUser") CompanyUser newCompanyUser, 
	    		BindingResult result, HttpSession session, Model model) { 
		 
	       companyUserService.register(newCompanyUser,result); 
	        
	        if(result.hasErrors()) {
	        	
	            model.addAttribute("newLoginCompany", new LoginCompanyUser()); 
	            return "company_login.jsp";
	        }
	        else {
	        	
	        	session.setAttribute("userId", newCompanyUser.getId()); 
	    
	        return "redirect:/welcome_company";
	        }
	 }
	 
	 @GetMapping ("/welcome_company")
	 	public String welcomePage (@ModelAttribute ("user") User user, Model model, 
	 			HttpSession session) { 
	 	
		 if (session.getAttribute("userId") == null) {
			 return "redirect:/";
		 }
		 else {
			 
		 Long userId = (Long) session.getAttribute("userId");    
		 model.addAttribute("loggedUser", companyUserService.findById(userId));
		 
		 CompanyUser companyUser = companyUserService.findById(userId); 
		 model.addAttribute("companyUser", companyUser);  
		 
		 List <User> allUsers = userService.findAll();
		 model.addAttribute("users", allUsers);
		 
		 	return "welcome_company.jsp";
		 }
	 }	 
	 
	 @PostMapping ("/all_available_doctors")
	 	public String allAvailableDoctors (@ModelAttribute ("user") User user,
	 			BindingResult result, Model model, HttpSession session) { 
	 	
		 if (session.getAttribute("userId") == null) {
			 return "redirect:/";
		 }
		 else {
			 
		 Long userId = (Long) session.getAttribute("userId");    
		 model.addAttribute("loggedUser", companyUserService.findById(userId));
		 
		 CompanyUser companyUser = companyUserService.findById(userId); 
		 model.addAttribute("companyUser", companyUser);
		 
		 String specialty = user.getSpecialty();
	     String city = user.getCity();
	        
	     List<User> filteredDoctors = userService.findBySpecialtyAndCity(specialty, city);
	     model.addAttribute("filteredDoctors", filteredDoctors);
		 
		 
		 	return "all_available_doctors.jsp";
		 }
	 }
	 
	 @PostMapping("/company_login")
	    public String login(@Valid @ModelAttribute("newLoginCompany") LoginCompanyUser newLoginCompany, 
	            BindingResult result, Model model, HttpSession session) {
	       
	        
	         CompanyUser companyUser = companyUserService.login(newLoginCompany, result); // i will store the answer coming from the
	         
	    
	        if(result.hasErrors()) { 
	       
	            model.addAttribute("newCompanyUser", new CompanyUser());
	           
	            return "company_login.jsp"; 
	            
	        }
	        else {
	        
	        	session.setAttribute("userId", companyUser.getId()); 
	        	
	        return "redirect:/welcome_company";
	        }
	 }
	 
	 @GetMapping ("/show_all_doctors")
	 	public String showAllDoctorsFromTheDB (@ModelAttribute ("users") User user,
	 			Model model, HttpSession session) { 
	 	
		 if (session.getAttribute("userId") == null) {
			 return "redirect:/";
		 }
		 else {
			 
		 Long userId = (Long) session.getAttribute("userId");    
		 model.addAttribute("loggedUser", companyUserService.findById(userId));
		 
		 CompanyUser companyUser = companyUserService.findById(userId); 
		 model.addAttribute("companyUser", companyUser);
		 
		 List<User> allUsers = userService.findAll();
		 model.addAttribute("users", allUsers);
		 
		 
		 	return "show_all_doctors.jsp";
		 }
}
	
}


