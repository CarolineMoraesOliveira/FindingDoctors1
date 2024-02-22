package com.caroline.findingdoctors1.models;

import java.util.Date;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

	@Entity
	@Table(name="reviews")
	public class Review {
	    
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    
	    @NotEmpty(message="The description can not be empty")
	    @Size(min=1, max=255, message="The description must have between 1 and 255 characters")
	    private String description;
	    
	    @Column(updatable=false)
	    private Date createdAt;
	    
	    @PrePersist
	    protected void onCreate() {
	    	 this.createdAt= new Date();
	    }
	    
	    @Column(updatable=false)
	    private Date updatedAt;

	    @PreUpdate
	    protected void onUpdate() {
	    	this.setUpdatedAt(new Date());
	    }
	    
	    @ManyToOne(fetch=FetchType.LAZY, cascade = CascadeType.PERSIST)
	    @JoinColumn(name="companyUser_id") // Name of the foreign key is being created in review's table
	    private CompanyUser reviewCompanyUser;

	    @ManyToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	    @JoinColumn(name="user_id") // Name of the foreign key is being created in review's table
	    private User reviewUser;
	    
	    // Constructors
	  
	    public Review() {
	    	
	    }

		public Review(Long id,
				@NotEmpty(message = "The description can not be empty") @Size(min = 1, max = 255, message = "The description must have between 1 and 255 characters") String description,
				Date createdAt, Date updatedAt, CompanyUser reviewCompanyUser, User reviewUser) {
		
			this.id = id;
			this.description = description;
			this.createdAt = createdAt;
			this.updatedAt = updatedAt;
			this.reviewCompanyUser = reviewCompanyUser;
			this.reviewUser = reviewUser;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Date getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}

		public Date getUpdatedAt() {
			return updatedAt;
		}

		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}

		public CompanyUser getReviewCompanyUser() {
			return reviewCompanyUser;
		}

		public void setReviewCompanyUser(CompanyUser reviewCompanyUser) {
			this.reviewCompanyUser = reviewCompanyUser;
		}

		public User getReviewUser() {
			return reviewUser;
		}

		public void setReviewUser(User reviewUser) {
			this.reviewUser = reviewUser;
		}

		
		
		
}
