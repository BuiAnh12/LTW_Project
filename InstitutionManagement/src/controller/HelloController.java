package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	@RequestMapping("dashboard")
	public String sayHello() {
		return "dashboard/dashboard";
	}
	
	@RequestMapping("schedue")
	public String schedue() {
		return "schedule/schedue";
	}
}
