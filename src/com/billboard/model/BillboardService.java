package com.billboard.model;

import java.sql.Date;
import java.util.List;

public class BillboardService {
	
	private BillboardDAO_interface dao;
	
	public BillboardService() {
		dao =new BillboardDAO();
	}
	
	public BillboardVO addBB(String url, byte[] pic, Date bbStart, Date bbEnd ) {
		BillboardVO bbVO=new BillboardVO();
		
		bbVO.setUrl(url);
		bbVO.setPic(pic);
		bbVO.setBbStart(bbStart);		
		bbVO.setBbEnd(bbEnd);
		dao.insert(bbVO);
		
		return bbVO;
	}
	
	public BillboardVO updateBB(String url, byte[] pic,Date bbStart,Date bbEnd) {
		BillboardVO bbVO = new BillboardVO(); 
	
		bbVO.setUrl(url);
		bbVO.setPic(pic);
		bbVO.setBbStart(bbStart);
		bbVO.setBbEnd(bbEnd);
		dao.update(bbVO);
		return 	bbVO;
	}
		
	public void deleteBB(Integer bbID) {
		dao.delete(bbID);
	}
	
	public List<BillboardVO>getAll(){
		return dao.getAll();
	}
	
	
}
