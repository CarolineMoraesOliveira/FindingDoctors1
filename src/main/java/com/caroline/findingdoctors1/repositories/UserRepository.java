package com.caroline.findingdoctors1.repositories;

import java.util.List;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.caroline.findingdoctors1.models.RegisterUser;
import com.caroline.findingdoctors1.models.User;


@Repository
public interface UserRepository extends JpaRepository <User, Long>{
	
	List<User> findBySpecialtyAndCity(String specialty, String city);
	
	Optional <User> findByEmail(String email);
	
	Optional<User> findById(Long id);
	
	RegisterUser save(RegisterUser newUser);
	
	List <User> findAll();

}
