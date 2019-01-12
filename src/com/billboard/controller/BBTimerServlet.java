package com.billboard.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.billboard.model.BillboardService;

@WebServlet("/BBTimerServlet")
public class BBTimerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BBTimerServlet() {
        super();
    }

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String action =req.getParameter("action"); 
		
		if("insert".equals(action)) {
			
			Date onTime =null;
			
			try {
				onTime = Date.valueOf(req.getParameter("bbStart"));
			} catch (IllegalArgumentException e) {
				onTime = new Date(System.currentTimeMillis());
			}
			
			Date offTime =null;
			
			try {
				offTime = Date.valueOf(req.getParameter("bbEnd"));
			} catch (IllegalArgumentException e) {
				offTime = new Date(System.currentTimeMillis());
			}
			
			
			TimerTask task = new TimerTask() {

				@Override
				public void run() {
					
					
					
					
					
					
				}
				
			};
			
			
			
			
		}
		
		
		
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
		
	}

}
