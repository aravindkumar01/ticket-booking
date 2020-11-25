package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import com.example.demo.Entity.User;
import com.example.demo.Service.UserService;

@SpringBootApplication
public class SpringBootDemo extends  SpringBootServletInitializer implements ApplicationRunner{


	 @Value("${username}")
	 private String name;
	 
	 @Autowired
	 UserService service;
	 
	public static void main(String[] args) {
		///createLogin();
		SpringApplication.run(SpringBootDemo.class, args);
		
	}

	 @Override
	    public void run( ApplicationArguments args ) throws Exception
	    {
	        System.out.println( "Name: " + name );
	        try {
				
	        	User u=new User();
	        		u.setEmail(name);
	        		u.setRole("admin");
	        	service.userAdd(u, name);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	    }
}

 

