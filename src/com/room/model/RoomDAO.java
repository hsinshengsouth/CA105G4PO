package com.room.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RoomDAO implements RoomDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CA105G4DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_SQL = 
			 "Insert into Room (roomID, roomTypeID, braID, roomNo, roomState, memName)" 
			+ "values ('R'||LPAD(to_char(room_seq.nextVal),5,'0'), ?, ?, ?, ? ,?)";
	private static final String UPDATE_SQL = "Update Room set roomTypeID = ?, braID = ?, roomNo = ?, roomState = ?, memName =? where roomID = ?";
	private static final String GET_ONE_SQL = "Select roomID, roomTypeID, braID, roomNo, roomState, memName from Room where roomID = ?";
	private static final String GET_ALL_SQL = "Select * from Room";
	private static final String Find_By_Branch_SQL = "select * from Room where braID = ? ";
	private static final String Find_Room_ForAssign_SQL = "select * from Room where braID = ? and roomTypeID = ? and roomState = ?";
	
	
	@Override
	public void insert(RoomVO roomVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_SQL);
			
			pstmt.setString(1, roomVO.getRoomTypeID());
			pstmt.setString(2, roomVO.getBraID());
			pstmt.setInt(3, roomVO.getRoomNo());
			pstmt.setInt(4, roomVO.getRoomState());
			pstmt.setString(5, roomVO.getMemName());
			
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void update(RoomVO roomVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_SQL);
			
			pstmt.setString(1, roomVO.getRoomTypeID());
			pstmt.setString(2, roomVO.getBraID());
			pstmt.setInt(3, roomVO.getRoomNo());
			pstmt.setInt(4, roomVO.getRoomState());
			pstmt.setString(5, roomVO.getMemName());
			pstmt.setString(6, roomVO.getRoomID());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}


	@Override
	public RoomVO findByPrimaryKey(String roomID) {
		RoomVO roomVO= null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_SQL);
			
			pstmt.setString(1, roomID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				roomVO = new RoomVO();
				roomVO.setRoomID(rs.getString("roomID"));
				roomVO.setRoomTypeID(rs.getString("roomTypeID"));
				roomVO.setBraID(rs.getString("braID"));
				roomVO.setRoomNo(rs.getInt("roomNo"));
				roomVO.setRoomState(rs.getInt("roomState"));
				roomVO.setMemName(rs.getString("memName"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return roomVO;
	}

	@Override
	public List<RoomVO> getAll() {
		List<RoomVO> list = new ArrayList<RoomVO>();
		RoomVO roomVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				roomVO = new RoomVO();
				roomVO.setRoomID(rs.getString("roomID"));
				roomVO.setRoomTypeID(rs.getString("roomTypeID"));
				roomVO.setBraID(rs.getString("braID"));
				roomVO.setRoomNo(rs.getInt("roomNo"));
				roomVO.setRoomState(rs.getInt("roomState"));
				roomVO.setMemName(rs.getString("memName"));
				
				list.add(roomVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	@Override
	public List<RoomVO> findRoomByBranch(String braID){
		List<RoomVO> list = new ArrayList<RoomVO>();
		RoomVO roomVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_By_Branch_SQL);
			
			pstmt.setString(1, braID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				roomVO = new RoomVO();
				roomVO.setRoomID(rs.getString("roomID"));
				roomVO.setRoomTypeID(rs.getString("roomTypeID"));
				roomVO.setBraID(rs.getString("braID"));
				roomVO.setRoomNo(rs.getInt("roomNo"));
				roomVO.setRoomState(rs.getInt("roomState"));
				roomVO.setMemName(rs.getString("memName"));
				
				list.add(roomVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	@Override
	public List<RoomVO> findRoomForAssign(String braID, String roomTypeID, Integer roomState){
		List<RoomVO> list = new ArrayList<RoomVO>();
		RoomVO roomVO = new RoomVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(Find_Room_ForAssign_SQL);
			
			pstmt.setString(1, braID);
			pstmt.setString(2, roomTypeID);
			pstmt.setInt(3, roomState);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				roomVO = new RoomVO();
				roomVO.setRoomID(rs.getString("roomID"));
				roomVO.setRoomTypeID(rs.getString("roomTypeID"));
				roomVO.setBraID(rs.getString("braID"));
				roomVO.setRoomNo(rs.getInt("roomNo"));
				roomVO.setRoomState(rs.getInt("roomState"));
				roomVO.setMemName(rs.getString("memName"));
				
				list.add(roomVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	
	
//	public static void main(String args[]) {
//		RoomDAO dao = new RoomDAO();
		//新增測試
//		RoomVO roomVO1 = new RoomVO();
//		roomVO1.setRoomTypeID("RT10");
//		roomVO1.setBraID("B02");
//		roomVO1.setRoomNo(150);
//		roomVO1.setRoomState(2);
//		roomVO1.setMemName("Ivan");
//		dao.insert(roomVO1);
//		System.out.println("Successfully Insert!");
		
		//修改
//		RoomVO roomVO2 = new RoomVO();
//		roomVO2.setRoomID("R00043");
//		roomVO2.setRoomState(1);
//		dao.update(roomVO2);
//		System.out.println("Successfully Update!");
		
		//查詢單筆
//		RoomVO roomVO3 = dao.findByPrimaryKey("R00030");
//		System.out.println(roomVO3.getRoomTypeID());
//		System.out.println(roomVO3.getBraID());
//		System.out.println(roomVO3.getRoomNo());
//		System.out.println(roomVO3.getRoomState());
//		System.out.println(roomVO3.getMemName());
//		System.out.println("Successfully Search!");
		
		//查詢全部
//		List<RoomVO> rl = dao.getAll();
//		for(RoomVO room : rl) {
//			System.out.println(room.getRoomID());
//			System.out.println(room.getRoomTypeID());
//			System.out.println(room.getBraID());
//			System.out.println(room.getRoomNo());
//			System.out.println(room.getRoomState());
//			System.out.println(room.getMemName());
//			System.out.println("====================");
//		}
//		System.out.println("Successfully Search!");
//	}	
}
