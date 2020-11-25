package com.example.demo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Entity.User;
import com.example.demo.Service.UserService;

@Controller
public class ViewController {

	@Autowired
	HttpSession session;
	
	@Autowired
	UserService service;

	@RequestMapping("/")
	public String home() {

		return "login";
	}

	@RequestMapping("/register")
	public String register() {

		return "register";
	}

	@RequestMapping("/logout")
	public String register(HttpSession session) {

		session.removeAttribute("user");
		return "login";
	}

	@GetMapping("/login/menu")
	public ModelAndView menu(ModelMap model, HttpSession session) {

		try {
			User u = (User) session.getAttribute("user");

			if (u == null) {

				return new ModelAndView("login");
			}

			model.addAttribute("username", u.getEmail());
			model.addAttribute("userType", u.getRole());
			return new ModelAndView("menu");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("/admin/home")
	public String departmentDetails() {

		return "bookingDetails";
	}

	@RequestMapping("/user/home")
	public String userHome() {

		try {
			User u = (User) session.getAttribute("user");
			if (u == null) {
				return "login";
			}
			return "bookingHistory";

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}

	}
	@RequestMapping("/user/booking")
	public String booking() {

		try {
			User u = (User) session.getAttribute("user");
			if (u == null) {
				return "login";
			}
			return "booking";

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}

	}

	@RequestMapping("/userAccount")
	public ModelAndView userAccont(ModelMap model, HttpSession session1) {

		try {

			User u = (User) session.getAttribute("user");
                 
			u=service.getUser(u.getEmail());
			if (u == null) {

				return new ModelAndView("login");
			}

			model.addAttribute("name", u.getName());
			model.addAttribute("id", u.getId());
			model.addAttribute("gender", u.getGender());
			model.addAttribute("email", u.getEmail());
			model.addAttribute("phone", u.getPhone());
			model.addAttribute("address", u.getAddress());
			model.addAttribute("city", u.getCity());
			model.addAttribute("state", u.getState());
			model.addAttribute("pincode", u.getPincode());
			model.addAttribute("district", u.getDistrict());

			model.addAttribute("user", "admin");
			return new ModelAndView("userAccount");

			// return "packages";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping("/addPackage")
	public ModelAndView addPackages(ModelMap model, HttpSession session) {

		try {
			User u = (User) session.getAttribute("user");

			if (u == null) {

				return new ModelAndView("login");
			}

			model.addAttribute("persons", "");
			return new ModelAndView("addPackage");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping("/signup")
	public ModelAndView register(ModelMap model, HttpSession session) {

		try {

			return new ModelAndView("register");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

}
