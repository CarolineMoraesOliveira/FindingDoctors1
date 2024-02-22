package com.caroline.findingdoctors1.repositories;

import java.util.List;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.caroline.findingdoctors1.models.CompanyUser;
import com.caroline.findingdoctors1.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository <Review, Long>{
	
	Optional<Review> findById(Long id);
	
	List <Review> findAll ();

	List<Review> findByReviewCompanyUser(CompanyUser reviewCompanyUser);

	
}

