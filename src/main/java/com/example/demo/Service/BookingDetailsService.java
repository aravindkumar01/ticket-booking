package com.example.demo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.BookingDetails;
import com.example.demo.Entity.User;
import com.example.demo.Repo.BookingDetailsRepo;

@Service
public class BookingDetailsService {

	
	@Autowired
	private BookingDetailsRepo repo;
	
	public boolean saveBookingDetails(BookingDetails details) {
		try {
			
			return repo.save(details) != null;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			
		}
		
	}
	
	public List<BookingDetails> getByUser(User user_id) {
		try {
			
			return repo.findByUser(user_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<BookingDetails> getAll() {
		try {
			
			return repo.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
