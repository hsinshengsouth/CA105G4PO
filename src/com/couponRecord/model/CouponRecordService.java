package com.couponRecord.model;

import java.util.List;

public class CouponRecordService {
	private CouponRecord_interface dao;

	public CouponRecordService() {
		dao = new CouponRecordDAO();
	}

	public CouponRecordVO addCR(String cpnID, String memID, Integer cpnState) {
		CouponRecordVO crVO = new CouponRecordVO();

		crVO.setCpnID(cpnID);
		crVO.setMemID(memID);
		crVO.setCpnState(cpnState);
		dao.insert(crVO);

		return crVO;
	}

	public CouponRecordVO updateCR(String memID, String cpnID,Integer cpnState) {
		CouponRecordVO crVO = new CouponRecordVO();
		
		crVO.setCpnID(cpnID);
		crVO.setMemID(memID);
		crVO.setCpnState(cpnState);
		dao.update(memID, cpnID);
		
		return crVO;
	}
	
	public List<CouponRecordVO>findByMemID(String memID){
		return dao.findByMemID(memID);
	}
	
	
}