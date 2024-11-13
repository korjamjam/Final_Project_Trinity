package com.project.trinity.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	@GetMapping("main")
	public String main() {
		return "redirect:/";
	}
}
