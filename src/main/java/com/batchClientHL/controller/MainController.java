package com.batchClientHL.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.batchClientHL.entity.*;

//eclipse搭建maven项目:https://blog.csdn.net/weixin_62332711/article/details/125630418
@Controller
@RequestMapping(MainController.MODULE_NAME)
public class MainController {

	public static final String MODULE_NAME="/main";
	
	@RequestMapping(value="/goPage")
	public String goPage(HttpServletRequest request) {
		
		String url = null;
		String page = request.getParameter("page");
		//http://localhost:8080/BatchClientHL/main/goPage?page=testStaProc
		//http://localhost:8080/BatchClientHL/main/goPage?page=testDynProc
		//http://localhost:8080/BatchClientHL/main/goPage?page=testDrawProSFC
		if("testDrawProSFC".equals(page)) {

			request.setAttribute("initialStep", ProcedureData.INITIAL_STEP);
			request.setAttribute("regularStep", ProcedureData.REGULAR_STEP);
			request.setAttribute("transition", ProcedureData.TRANSITION);
			request.setAttribute("terminalStep", ProcedureData.TERMINAL_STEP);
			request.setAttribute("link", ProcedureData.LINK);
			request.setAttribute("andDivergence", ProcedureData.AND_DIVERGENCE);
			request.setAttribute("andConvergence", ProcedureData.AND_CONVERGENCE);
			
			request.setAttribute("initialStepText", ProcedureData.INITIAL_STEP_TEXT);
			request.setAttribute("regularStepText", ProcedureData.REGULAR_STEP_TEXT);
			request.setAttribute("transitionText", ProcedureData.TRANSITION_TEXT);
			request.setAttribute("terminalStepText", ProcedureData.TERMINAL_STEP_TEXT);
			request.setAttribute("linkText", ProcedureData.LINK_TEXT);
			request.setAttribute("andDivergenceText", ProcedureData.AND_DIVERGENCE_TEXT);
			request.setAttribute("andConvergenceText", ProcedureData.AND_CONVERGENCE_TEXT);
			
			request.setAttribute("singleTSpaceSign", BatchView.SINGLE_T_SPACE_SIGN);
			request.setAttribute("tSign", BatchView.T_SIGN);
			
			url="/"+page;
		}
		else
			url="/"+page;
		
		return url;
	}
}
