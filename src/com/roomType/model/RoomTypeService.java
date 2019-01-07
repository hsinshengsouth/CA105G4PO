package com.roomType.model;

import java.util.*;

public class RoomTypeService {
	
	private RoomTypeDAO_interface dao;
	
	public RoomTypeService() {
		dao = new RoomTypeDAO();
	}
	
	public RoomTypeVO addRoomType(String braID, String rtName, byte[] rtPic, String rtIntro, Integer rtMinimum, Integer rtLimit, Integer weeklyPrice, Integer holidayPrice, Integer total) {
		RoomTypeVO rtVO = new RoomTypeVO();
		rtVO.setBraID(braID);
		rtVO.setRtName(rtName);
		rtVO.setRtPic(rtPic);
		rtVO.setRtIntro(rtIntro);
		rtVO.setRtMinimum(rtMinimum);
		rtVO.setRtLimit(rtLimit);
		rtVO.setWeeklyPrice(weeklyPrice);
		rtVO.setHolidayPrice(holidayPrice);
		rtVO.setTotal(total);
		
		dao.insert(rtVO);
		
		return rtVO;
	}
	
	public RoomTypeVO updateRoomType(String rtID, String braID, String rtName, byte[] rtPic, String rtIntro, Integer rtMinimum, Integer rtLimit, Integer weeklyPrice, Integer holidayPrice, Integer total) {
		
		RoomTypeVO rtVO = new RoomTypeVO();
		rtVO.setRtID(rtID);
		rtVO.setBraID(braID);
		rtVO.setRtName(rtName);
		rtVO.setRtPic(rtPic);
		rtVO.setRtIntro(rtIntro);
		rtVO.setRtMinimum(rtMinimum);
		rtVO.setRtLimit(rtLimit);
		rtVO.setWeeklyPrice(weeklyPrice);
		rtVO.setHolidayPrice(holidayPrice);
		rtVO.setTotal(total);
		
		dao.update(rtVO);
		
		return rtVO;
	}
	
	public RoomTypeVO getOneRoomType(String rtID) {
		return dao.findByPrimaryKey(rtID);
	}
	
	public List<RoomTypeVO> getAll() {
		return dao.getAll();
	}
	
	public Set<RoomTypeVO> getAllInSet() {
		return dao.getAllInSet();
	}
	
	/**[Gina]{Ajax}用分店找房型**/
	public List<RoomTypeVO> findRoomTypeByBraID(String braID) {
		return dao.findRoomTypeByBranch(braID);
	}
	/**[Gina]{Ajax}用分店找房型**/
	
//	//更改房型的剩餘房間數欄位
//	public void updateRoomBalance(String balance, String rtID) {
//		dao.updateRoomBalance(balance, rtID);
//	}

}