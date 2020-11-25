package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.Entity.BookingDetails;
import com.example.demo.Entity.User;

@Repository
public interface BookingDetailsRepo extends JpaRepository<BookingDetails, Long>{

	List<BookingDetails> findByUser(User user_id);

}
