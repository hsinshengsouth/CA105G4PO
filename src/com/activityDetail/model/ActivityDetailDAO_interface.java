package com.activityDetail.model;

import java.sql.Connection;
import java.util.List;

public interface ActivityDetailDAO_interface {
	public  void insert(ActivityDetailVO activityDetailVO); 
	public void update(ActivityDetailVO activityDetailVO);
	public void delete(String actID);
	public ActivityDetailVO findByPK(String actID);
	public List<ActivityDetailVO > getAll();
	public void insert2(ActivityDetailVO adVO, Connection con);
}
