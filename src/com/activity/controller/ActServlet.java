package com.activity.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.activity.model.*;

public class ActServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("actID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入促銷活動編號");
				}

				// 若是有誤，把使用者重新送回搜尋頁面

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/activity/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				// 錯誤參數處理

				/*************************** 2.開始查詢資料 *****************************************/

				ActivityService actSvc = new ActivityService();
				ActivityVO actVO = actSvc.getOneByID(str);
				if (actVO == null) {
					errorMsgs.add("查無資料");
				}

				// 若是有誤，把使用者重新送回搜尋頁面
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/activity/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("actVO", actVO);
				String url = "/activity/listOneActivity.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
			}
		}

		if ("insert".equals(action)) { // 來自addAct.jsp的請求或是listAllActivity.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// 儲存錯誤訊息在list裡，並把錯誤訊息儲存在request scope
			// 若是任何錯誤訊息可以隨時叫出
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String actName = req.getParameter("actName");
				if (actName == null || actName.trim().length() == 0) {
					errorMsgs.add("促銷活動訊息，請勿空白");
				}

				java.sql.Date date1 = null;
				try {
					date1 = java.sql.Date.valueOf(req.getParameter("actStart"));
				} catch (IllegalArgumentException e) {
					date1 = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				java.sql.Date date2 = null;
				try {
					date2 = java.sql.Date.valueOf(req.getParameter("actEnd"));
				} catch (IllegalArgumentException e) {
					date2 = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				ActivityVO actVO = new ActivityVO();

				actVO.setActName(actName);
				actVO.setActStart(date1);
				actVO.setActEnd(date2);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/activity/addAct.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ActivityService actSvc = new ActivityService();
				actVO = actSvc.addAct(actName, date1, date2);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/activity/listAllActivity.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/activity/addAct.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// 儲存錯誤訊息在list裡，並把錯誤訊息儲存在request scope
			// 若是任何錯誤訊息可以隨時叫出
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String actID = req.getParameter("actID");

				/*************************** 2.開始查詢資料 ****************************************/
				ActivityService actSvc = new ActivityService();
				ActivityVO actVO = actSvc.getOneByID(actID);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("actVO", actVO); // 資料庫取出的empVO物件,存入req
				String url = "/activity/update_act_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/activity/listAllActivity.jsp");
				failureView.forward(req, res);
			}

		}

		if ("update".equals(action)) { // 來自update_activity_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// 儲存錯誤訊息在list裡，並把錯誤訊息儲存在request scope
			// 若是任何錯誤訊息可以隨時叫出
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String actID = req.getParameter("actID");

				String actName = req.getParameter("actName");
				if (actName == null || actName.trim().length() == 0) {
					errorMsgs.add("促銷活動名稱不可為空");
				}

				java.sql.Date actStart = null;
				try {
					actStart = java.sql.Date.valueOf(req.getParameter("actStart").trim());
				} catch (IllegalArgumentException e) {
					actStart = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期");
				}

				java.sql.Date actEnd = null;
				try {
					actEnd = java.sql.Date.valueOf(req.getParameter("actEnd").trim());
				} catch (IllegalArgumentException e) {
					actEnd = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期");
				}

				ActivityVO actVO = new ActivityVO();
				actVO.setActName(actName);
				actVO.setActStart(actStart);
				actVO.setActEnd(actEnd);

				// 把修改過後，格式仍有問題的回傳回去
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/update_emp_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ActivityService actSvc = new ActivityService();
				actVO = actSvc.updateAct(actName, actStart, actEnd, actID);
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("actVO", actVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/activity/listOneActivity.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("資料修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/activity/update_act_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// 儲存錯誤訊息

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String actID = req.getParameter("actID");

				/*************************** 2.開始刪除資料 ***************************************/
				ActivityService actSvc = new ActivityService();
				actSvc.deleteAct(actID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/activity/listAllActivity.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/activity/listAllActivity.jsp");
				failureView.forward(req, res);
			}

		}

	}
}