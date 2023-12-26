package com.batchClientHL.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

	public static final String MODULE_NAME="home";
	
	@RequestMapping(value="/recipeManager")
	public String goRecipeManager(HttpServletRequest request) {

		return MODULE_NAME+"/recipeManager";
	}
}
