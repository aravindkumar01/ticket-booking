package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.Login;
import com.example.demo.Entity.User;
import com.example.demo.Repo.LoginRepo;
import com.example.demo.Repo.UserRepo;

@Service
public class UserService {

	
	@Autowired
	UserRepo repo;
	
	@Autowired
	LoginRepo login;
	
	public boolean userAdd(User user, String password) {
		
		try {
			
			Login log=new Login();
			 log.setUsername(user.getEmail());
			 log.setPassword(password);
			 log.setRole(user.getRole());
			 log.setStatus(true);		
			 User u=repo.findByEmail(user.getEmail());
			 	if(u!=null) {			 		
			 		return false;
			 	}
			repo.save(user);			
			login.save(log);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public List<User> findAll(){
		
		try {
			
			return repo.findAll();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
		
	}

	public boolean deleteAdd(long id) {
		
		try {
			repo.deleteById(id);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			// TODO: handle exception
		}
	}


	public boolean updateUser(User user) {
		try {
			
			repo.save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			// TODO: handle exception
		}
	}
	
	
	public User getUser(String email) {
		
		try {
			
			return repo.findByEmail(email);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
}
