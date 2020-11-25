package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Entity.User;
import com.example.demo.Service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	UserService service;
	
	@PostMapping
	public @ResponseBody ResponseEntity<?> newCustomer(@RequestParam("name") String name,@RequestParam("password") String password,
			@RequestParam("email") String email,@RequestParam("phone") String phone) {		
		
		try {			
			User user=new User();
			   user.setEmail(email);
			   user.setPhone(phone);
			   user.setName(name);
			   user.setRole("user");
			   
			return  new ResponseEntity<Boolean>(service.userAdd(user,password), HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Boolean>(false, HttpStatus.EXPECTATION_FAILED);
			// TODO: handle exception
		}
	}
	
	@PutMapping
	public @ResponseBody boolean updateUser(@RequestBody User user) {
		
		
		try {			
			User u=service.getUser(user.getEmail());
				user.setRole(u.getRole());
			return service.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			// TODO: handle exception
		}
	}
	
}
