package com.jhta.neocom.oauth;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class User {
	@Id // primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String password;
	private String email;
	@Enumerated(EnumType.STRING)
	private Role role; //ROLE_USER, ROLE_ADMIN
	
	@Builder
	   public User(String name, String email, String picture, Role role) {
	       this.name = name;
	       this.email = email;
	       this.role = role;
	   }

	   public User update(String name, String picture) {
	       this.name = name;
	       return this;
	   }

	   public String getRoleKey() {
	       return this.role.getKey();
	   }
}
