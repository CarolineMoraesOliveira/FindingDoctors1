package com.caroline.findingdoctors1.services;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caroline.findingdoctors1.models.CompanyUser;
import com.caroline.findingdoctors1.models.Review;
import com.caroline.findingdoctors1.repositories.ReviewRepository;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository reviewRepository;

	
	public Review findReviewById(Long id) {
		Optional<Review> ReviewOrEmpty = reviewRepository.findById(id);
			
			return ReviewOrEmpty.isPresent() ? ReviewOrEmpty.get() : null;
			
			}
	
	public Review create(Review newReview) {

		return reviewRepository.save(newReview);
		
	}

	public Review onUpdate(Review newReview) {

			return reviewRepository.save(newReview);
			
		}
		
	public void deleteReview(Long id) {
			reviewRepository.deleteById(id);
			
		}

	public List<Review> findAll() {
		
		return reviewRepository.findAll();
	}

	public List<Review> findByReviewCompanyUser(CompanyUser reviewCompanyUser) {
		
		return reviewRepository.findByReviewCompanyUser(reviewCompanyUser);
	}

	

}
