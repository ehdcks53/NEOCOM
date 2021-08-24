package com.jhta.neocom.oauth;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jhta.neocom.model.Sns_memberInfo;

public interface  UserRepository extends JpaRepository<User, Integer> {
	
	Optional<User> findByEmail(String email);
}