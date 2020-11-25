package com.example.demo.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.Login;
import com.example.demo.Repo.LoginRepo;

@Service
public class LoginService {

	@Autowired
	LoginRepo repo;
	
	
	public Login findLogin(String username,String password) {
		
		
		try {
			
			return repo.findLogin(username, password);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			// TODO: handle exception
		}
	}
}
