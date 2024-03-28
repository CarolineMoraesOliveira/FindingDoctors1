package com.caroline.findingdoctors1.models;

import java.util.Date;
import java.util.List;

import com.caroline.findingdoctors1.util.ValidDayShift;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
    
@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull(message="First name is required!")
    @Size(min=3, max=30, message="First name must be between 3 and 30 characters.")
    private String firstName;
    
    @NotBlank(message="Last name is required!")
    @Size(min=3, max=30, message="Last name must be between 3 and 30 characters.")
    private String lastName;
    
    @NotBlank(message="The city where you are located is required!")
    @Size(min=3, max=30, message="City name must be between 3 and 30 characters.")
    private String city;
    
    @NotNull(message="Email is required.")
    @Email(message="Please enter a valid email.")
    private String email;
    
    @NotNull(message="Password is required.")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters.")
    private String password;
    
    @NotBlank(message="The graduation institution's name is required.")
    @Size(min=1, max=128, message="The institution's name must have between 1 and 128 characters")
    private String gradInstitution;
    
    @NotBlank(message="You must choose an specialty area.")
    @Size(min=3, max=128)
    private String specialty;
    
    @Column(nullable = false, columnDefinition = "TINYINT(1) default 0")
    @NotNull (message= "You must choose an option.")
    private Boolean haveCertification;
    
    private String certification;
    
    @Column(nullable = false, columnDefinition = "TINYINT(1) default 0")
    @NotNull (message= "You must choose an option.")
    private Boolean havePosGrad;
    
    private String posGrad;
    
    public enum DayShift {
        MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY, NIGHTS
    }

    @ValidDayShift(message = "Please select your availability")
    private DayShift dayShift;

    
    @NotBlank(message="Your personal skills are required.")
    @Size(min=1, max=255, message="Your personal skills description must have between 1 and 255 characters")
    private String skills;
    
    @NotBlank(message = "Your contact phone is required.")
    @Pattern(regexp = "^[0-9]{10}$", message = "Invalid phone number format. Use 10 digits.")
    private String phone;
    
    @Size(min=3, max=128)
    private String facebook;
    
    @Size(min=3, max=128)
    private String linkedIn;
    
    @Column(updatable=false)
    private Date updatedAt;

    @PreUpdate
    protected void onUpdate() {
    	this.setUpdatedAt(new Date());
    }
    
    @OneToMany(mappedBy="reviewUser", fetch=FetchType.LAZY)
    private List<Review> reviewUser;
    
    public User (){
    	
    }

	public User(Long id,
			@NotNull(message = "First name is required!") @Size(min = 3, max = 30, message = "First name must be between 3 and 30 characters.") String firstName,
			@NotBlank(message = "Last name is required!") @Size(min = 3, max = 30, message = "Last name must be between 3 and 30 characters.") String lastName,
			@NotBlank(message = "The city where you are located is required!") @Size(min = 3, max = 30, message = "City name must be between 3 and 30 characters.") String city,
			@NotNull(message = "Email is required.") @Email(message = "Please enter a valid email.") String email,
			@NotNull(message = "Password is required.") @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters.") String password,
			@NotBlank(message = "The graduation institution's name is required.") @Size(min = 1, max = 128, message = "The institution's name must have between 1 and 128 characters") String gradInstitution,
			@NotBlank(message = "You must choose an specialty area.") @Size(min = 3, max = 128) String specialty,
			@NotNull(message = "You must choose an option.") Boolean haveCertification, String certification,
			@NotNull(message = "You must choose an option.") Boolean havePosGrad, String posGrad, DayShift dayShift,
			@NotBlank(message = "Your personal skills are required.") @Size(min = 1, max = 255, message = "Your personal skills description must have between 1 and 255 characters") String skills,
			@NotBlank(message = "Your contact phone is required.") @Pattern(regexp = "^[0-9]{10}$", message = "Invalid phone number format. Use 10 digits.") String phone,
			@Size(min = 3, max = 128) String facebook, @Size(min = 3, max = 128) String linkedIn, Date updatedAt,
			List<Review> reviewUser) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.city = city;
		this.email = email;
		this.password = password;
		this.gradInstitution = gradInstitution;
		this.specialty = specialty;
		this.haveCertification = haveCertification;
		this.certification = certification;
		this.havePosGrad = havePosGrad;
		this.posGrad = posGrad;
		this.dayShift = dayShift;
		this.skills = skills;
		this.phone = phone;
		this.facebook = facebook;
		this.linkedIn = linkedIn;
		this.updatedAt = updatedAt;
		this.reviewUser = reviewUser;
	}

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

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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

	public String getGradInstitution() {
		return gradInstitution;
	}

	public void setGradInstitution(String gradInstitution) {
		this.gradInstitution = gradInstitution;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public Boolean getHaveCertification() {
		return haveCertification;
	}

	public void setHaveCertification(Boolean haveCertification) {
		this.haveCertification = haveCertification;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public Boolean getHavePosGrad() {
		return havePosGrad;
	}

	public void setHavePosGrad(Boolean havePosGrad) {
		this.havePosGrad = havePosGrad;
	}

	public String getPosGrad() {
		return posGrad;
	}

	public void setPosGrad(String posGrad) {
		this.posGrad = posGrad;
	}

	public DayShift getDayShift() {
		return dayShift;
	}

	public void setDayShift(DayShift dayShift) {
		this.dayShift = dayShift;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getLinkedIn() {
		return linkedIn;
	}

	public void setLinkedIn(String linkedIn) {
		this.linkedIn = linkedIn;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Review> getReviewUser() {
		return reviewUser;
	}

	public void setReviewUser(List<Review> reviewUser) {
		this.reviewUser = reviewUser;
	}

}