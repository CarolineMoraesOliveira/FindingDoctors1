package com.caroline.findingdoctors1.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class RegisterUser {
	
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	 	
	 	@NotBlank(message="First name is required")
	    @Size(min=3, max=30, message="First name must be between 3 and 30 characters.")
	    private String firstName;
	    
	 	@NotBlank(message="Email is required")
	    @Email(message="Please enter a valid email!")
	    private String email;
	    
	    @NotBlank(message="Password is required")
	    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
	    private String password;
	    
	    @Column(updatable=false)
	    private Date createdAt;
	    
	    @PrePersist
	    protected void onCreate() {
	    	 this.createdAt= new Date();
	    }
	    
	    @Transient
	    @NotNull(message="Confirm Password is required")
	    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
	    private String confirm;
	    
	    public RegisterUser() {
	    	
	    }

		public RegisterUser(Long id,
				@NotBlank(message = "First name is required!") @Size(min = 3, max = 30, message = "First name must be between 3 and 30 characters.") String firstName,
				@NotBlank(message = "Email is required") @Email(message = "Please enter a valid email!") String email,
				@NotBlank(message = "Password is required!") @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters") String password,
				Date createdAt,
				@NotNull(message = "Confirm Password is required!") @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters") String confirm) {
			
			this.id = id;
			this.firstName = firstName;
			this.email = email;
			this.password = password;
			this.createdAt = createdAt;
			this.confirm = confirm;
		}

		// getters and setters
		
		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getFirstName() {
			return firstName;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
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

		public Date getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}

		public String getConfirm() {
			return confirm;
		}

		public void setConfirm(String confirm) {
			this.confirm = confirm;
		}

		

}