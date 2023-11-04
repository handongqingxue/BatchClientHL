package com.batchClientHL.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//eclipse搭建maven项目:https://blog.csdn.net/weixin_62332711/article/details/125630418
@Controller
@RequestMapping(MainController.MODULE_NAME)
public class MainController {

	public static final String MODULE_NAME="/main";
	
	@RequestMapping(value="/goPage")
	public String goPage(HttpServletRequest request) {
		
		String url = null;
		String page = request.getParameter("page");
		if("test".equals(page)) {//http://localhost:8080/BatchClientHL/main/goPage?page=test
			url="/test";
		}
		return url;
	}
}
