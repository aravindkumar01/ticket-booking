package com.example.demo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Entity.Login;
import com.example.demo.Entity.User;
import com.example.demo.Service.LoginService;
import com.example.demo.Service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
	

	
	@Autowired
	UserService userService;
	
	@GetMapping("/login")
	public @ResponseBody Login addUser(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession session) {
		try {
			
			
			
			if(username.equals("admin@gmail.com") && password.equals("admin@gmail.com")) {
				
				
				Login log=new Login();
					log.setRole("admin");
					log.setUsername("admin@gmail.com");
					log.setStatus(true);
					log.setPassword("admin@gmail.com");
				User u=new User();
					u.setRole("admin");
					u.setName("admin");
					u.setEmail("admin@gmail.com");
				session.setAttribute("login", log);
				session.setAttribute("user", u);
				return log;
			}
			
			
			Login log=service.findLogin(username,password);
			

		//	model.addAttribute("user",log.getRole());	
			
			
			if(log!=null) {
				session.setAttribute("login", log);
				User u=userService.getUser(log.getUsername());
				session.setAttribute("user", u);
				return log;
			}
			
			
			return null;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
			
		}
	}

}
