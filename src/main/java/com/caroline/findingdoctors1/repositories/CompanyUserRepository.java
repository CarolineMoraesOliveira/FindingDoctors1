package com.caroline.findingdoctors1.repositories;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.caroline.findingdoctors1.models.CompanyUser;



@Repository
public interface CompanyUserRepository extends JpaRepository <CompanyUser, Long>{


	
	Optional <CompanyUser> findByEmail(String email);
	
	Optional<CompanyUser> findById(Long id);

	<S extends CompanyUser> S save(S companyUser);
}
