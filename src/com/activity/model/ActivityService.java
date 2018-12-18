package com.activity.model;

import java.util.List;

public class ActivityService {
	
	private ActivityDAO_interface dao;
	
	public ActivityService() {
		dao =new ActivityJDBCDAO();
	}
	
	public ActivityVO addAct(String actName, java.sql.Date startDate,java.sql.Date  endDate) {
		ActivityVO actVO= new ActivityVO();
		
		actVO.setActName(actName);
		actVO.setActStart(startDate);
		actVO.setActEnd(endDate);
		dao.insert(actVO);
		
		return actVO;
	}
	
	public ActivityVO updateAct(String actName,java.sql.Date startDate,java.sql.Date  endDate,String actID) {
		ActivityVO actVO =new ActivityVO();
		
		actVO.setActName(actName);
		actVO.setActStart(startDate);
		actVO.setActEnd(endDate);
		actVO.setActID(actID);
		dao.update(actVO);
		
		return actVO;
	}
	
	public void deleteAct(String actID) {
		dao.delete(actID);
	}
	
	public ActivityVO getOneByID(String actID) {
		return dao.findByPK(actID);
	}
	
	public ActivityVO getOneByName(String actName) {
		return dao.findByName(actName);
	}
	
	public List<ActivityVO>getAll(){
		return dao.getAll();
	}
	
}
