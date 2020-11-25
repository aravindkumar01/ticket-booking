package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Entity.BookingDetails;
import com.example.demo.Entity.User;
import com.example.demo.Service.BookingDetailsService;
import com.example.demo.Service.UserService;

@Controller
@RequestMapping("/booking")
public class BookingController {

	
	@Autowired
	BookingDetailsService service;
	
	@Autowired
	UserService userService;
	@PostMapping("/{username}/")
	public @ResponseBody ResponseEntity<?> newBooking(@RequestBody BookingDetails bookingDetails,@PathVariable("username") String username){
		try {
			
			User u=userService.getUser(username);
			
			if(u!=null) {
				bookingDetails.setUser(u);
				return  new ResponseEntity<Boolean>(service.saveBookingDetails(bookingDetails), HttpStatus.CREATED);
			}
			return  new ResponseEntity<Boolean>(false, HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Boolean>(false, HttpStatus.EXPECTATION_FAILED);
			
		}
	}
	
	@GetMapping("/{username}/")
	 @ResponseBody
	public ResponseEntity<?> getBookingByUser(@PathVariable("username") String username){
		try {
			
			User u=userService.getUser(username);
			
			if(u!=null) {
				
				return  new ResponseEntity<List<BookingDetails>>(service.getByUser(u), HttpStatus.OK);
			}
			return  new ResponseEntity<Boolean>(false, HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Boolean>(false, HttpStatus.EXPECTATION_FAILED);
			
		}
	}
	
	@GetMapping("/all")
	 @ResponseBody
	public ResponseEntity<?> getBookingAll(){
		try {
			
			
				
				return  new ResponseEntity<List<BookingDetails>>(service.getAll(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Boolean>(false, HttpStatus.EXPECTATION_FAILED);
			
		}
	}
}
