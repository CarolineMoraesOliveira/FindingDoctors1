package com.caroline.findingdoctors1.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.caroline.findingdoctors1.models.CompanyUser;
import com.caroline.findingdoctors1.models.Review;
import com.caroline.findingdoctors1.models.User;
import com.caroline.findingdoctors1.services.CompanyUserService;
import com.caroline.findingdoctors1.services.ReviewService;
import com.caroline.findingdoctors1.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ReviewController {
	
	@Autowired
	private CompanyUserService companyUserService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewService reviewService;

	 
	@GetMapping("/{id}/review")
	 public String reviewForm (@PathVariable("id") Long id, 
			 @ModelAttribute ("newReview") Review newReview,
			 Model model, HttpSession session) {
	 
	 if (session.getAttribute("userId") == null) {
		 return "redirect:/";
	 }
	 else {
		 
	 Long userId = (Long) session.getAttribute("userId");    
	 model.addAttribute("loggedUser", companyUserService.findById(userId));
	 
	 User user = userService.findUserById(id);
	 model.addAttribute("thisUser", user);
	
	 model.addAttribute("newReview", newReview);
	 
	 return "review_doctor.jsp";
 }
}
	
	@PostMapping("/{id}/review")
    public String addReviewToDB(@Valid @ModelAttribute("newReview") Review newReview, 
    		BindingResult result, Model model, HttpSession session,
    		@PathVariable("id") Long id, CompanyUser reviewCompanyUser) {
        
	    if(result.hasErrors()) {  
	    	model.addAttribute("newReview", newReview);
	    	Long userId = (Long) session.getAttribute("userId");    
       	 	model.addAttribute("loggedUser", companyUserService.findById(userId));
       	 	User user = userService.findUserById(id);
       	 	model.addAttribute("thisUser", user);
       	 
             return "review_doctor.jsp"; 
        }
        else {
        	  reviewService.create(newReview);
        	  Long userId = (Long) session.getAttribute("userId");    
        		 model.addAttribute("loggedUser", companyUserService.findById(userId));
        		 
        		 User user = userService.findUserById(id);
        		 model.addAttribute("thisUser", user);
        		
        		 model.addAttribute("newReview", newReview);
        	 
              
        	return "redirect:/show_reviews";
        }
}
	
	@GetMapping("/show_reviews")
	 public String showAllReviewsMadeByThisCompanyUser(
			 Model model, HttpSession session) {
	 
	 if (session.getAttribute("userId") == null) {
		 return "redirect:/";
	 }
	 else {
		 
	 Long userId = (Long) session.getAttribute("userId");  
	 CompanyUser revCompanyUser = companyUserService.findById(userId);
	 model.addAttribute("loggedUser", revCompanyUser);
        
     List<Review> filteredReviews = reviewService.findByReviewCompanyUser(revCompanyUser);
     model.addAttribute("filteredReviews", filteredReviews);
	 
	 List <User> allusers = userService.findAll();
	 model.addAttribute("user", allusers);
	 
	 
	 return "all_reviews.jsp";
}
	
}
}

