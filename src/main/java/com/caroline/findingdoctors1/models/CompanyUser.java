package com.caroline.findingdoctors1.models;

import java.util.List;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
    
@Entity
@Table(name="companies")
public class CompanyUser {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message="Company name is required!")
    @Size(min=3, max=30, message="Company name must be between 3 and 30 characters(letters)")
    private String companyUserName;
    
    @NotBlank(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
    
    @NotBlank(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    @Transient
    @NotBlank(message="Confirm Password is required!")
    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
    private String confirm;
    
    @OneToMany(mappedBy="reviewCompanyUser", fetch=FetchType.LAZY, cascade = CascadeType.PERSIST)
    private List<Review> reviews;
    
    // Constructors
  
    public CompanyUser() {
    	
    }

	
	
	public CompanyUser(Long id,
			@NotBlank(message = "Company name is required!") @Size(min = 3, max = 30, message = "Company name must be between 3 and 30 characters(letters)") String companyUserName,
			@NotBlank(message = "Email is required!") @Email(message = "Please enter a valid email!") String email,
			@NotBlank(message = "Password is required!") @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters") String password,
			@NotBlank(message = "Confirm Password is required!") @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters") String confirm,
			List<Review> reviews) {
	
		this.id = id;
		this.companyUserName = companyUserName;
		this.email = email;
		this.password = password;
		this.confirm = confirm;
		this.reviews = reviews;
	}


	// getters and setters
	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getCompanyUserName() {
		return companyUserName;
	}



	public void setCompanyUserName(String companyUserName) {
		this.companyUserName = companyUserName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getConfirm() {
		return confirm;
	}



	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}



	public List<Review> getReviews() {
		return reviews;
	}



	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}	
}
	
	

	