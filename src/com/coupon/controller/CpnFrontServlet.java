package com.coupon.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CpnFrontServlet")
public class CpnFrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
	
	
	
	
	}

}
