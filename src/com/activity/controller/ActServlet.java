package com.activity.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.activity.model.*;

public class ActServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public  void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {  //來自select_page.jsp的請求
			List<String> errorMsgs =new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
	try {
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String str =req.getParameter("actID");
			if(str==null||(str.trim()).length()==0) {
				errorMsgs.add("請輸入促銷活動編號");
			}
			
			//若是有誤，把使用者重新送回搜尋頁面
			
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher failureView =req.getRequestDispatcher("/activity/select_page.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
			//錯誤參數處理
			
			
			/***************************2.開始查詢資料*****************************************/
			
			ActivityService actSvc =new ActivityService();
			ActivityVO actVO = actSvc.getOneByID(str);
			if(actVO==null){
				errorMsgs.add("查無資料");
			}
			
			
			//若是有誤，把使用者重新送回搜尋頁面
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher failureView =req.getRequestDispatcher("/activity/select_page.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
			req.setAttribute("actVO", actVO);
			String url ="/activity/listOneActivity.jsp";
			RequestDispatcher successView =req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}catch(Exception e) {
			errorMsgs.add("無法取得資料"+e.getMessage());
		}
	}
		
		
	
		if("getName_For_Display".equals(action)) {  //來自select_page.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
	try {
			String str = req.getParameter("actName");
			
			if(!errorMsgs.isEmpty()) {
				RequestDispatcher failureView =req.getRequestDispatcher("/activity/select_page.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
			/***************************2.開始查詢資料*****************************************/
			ActivityService actSvc =new ActivityService();
			ActivityVO actVO = actSvc.getOneByName(str) ;
			if(actVO==null) {
				errorMsgs.add("查無資料");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/activity/select_page.jsp");
				failureView.forward(req, res);
				return;
			}
			
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
			req.setAttribute("actVO", actVO);
			String url = "/activity/listOneActivity.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}catch(Exception e) {
			errorMsgs.add("無法取得資料"+e.getMessage());
		}
			
		}
	}

}
