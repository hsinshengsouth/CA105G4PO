package com.branch.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.activity.model.ActivityVO;

public class BranchDAO implements BranchDAO_interface {
	private static final String INSERT_SQL = "INSERT INTO Branch(braID,braName,braIntro,braPic,braTel,braVideo,braAddr,braLng,braLat,braState)"
			+ " VALUES('B'||LPAD(to_char(bra_seq.nextval)2,'0'),?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE = "UPDATE Branch set braName=?,braIntro=?,braPic?,braTel=?,braVideo=?,braAddr=?,braLng=?,braLat=?,braState=? WHERE braID=?";

	private static final String DELETE = "DELETE FROM Branch WHERE braID=?";
	private static final String FIND_BY_PK = "SELECT * FROM Branch WHERE ID=?";
	private static final String FIND_ALL_STMT = "SELECT * FROM Branch ORDER BY braID";

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CA105G4DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void insert(BranchVO branchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_SQL);

			pstmt.setString(1, branchVO.getBraName());
			pstmt.setString(2, branchVO.getBraIntro());
			pstmt.setBytes(3, branchVO.getBraPic());
			pstmt.setString(4, branchVO.getBraTel());
			pstmt.setBytes(5, branchVO.getBraVideo());
			pstmt.setString(6, branchVO.getBraAddr());
			pstmt.setDouble(7, branchVO.getBraLng());
			pstmt.setDouble(8, branchVO.getBraLat());
			pstmt.setInt(9, branchVO.getBraState());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void update(BranchVO branchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, branchVO.getBraName());
			pstmt.setString(2, branchVO.getBraIntro());
			pstmt.setBytes(3, branchVO.getBraPic());
			pstmt.setString(4, branchVO.getBraTel());
			pstmt.setBytes(5, branchVO.getBraVideo());
			pstmt.setString(6, branchVO.getBraAddr());
			pstmt.setDouble(7, branchVO.getBraLng());
			pstmt.setDouble(8, branchVO.getBraLat());
			pstmt.setInt(9, branchVO.getBraState());
			pstmt.setString(10, branchVO.getBraID());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
	
	
	
	
	@Override
	public BranchVO findByPK(String braID) {
		BranchVO braVO =null;
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			
			pstmt.setString(1, braID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				braVO = new BranchVO();
				
				braVO.setBraID(rs.getString("braID"));
				braVO.setBraName(rs.getString("braName"));
				braVO.setBraIntro(rs.getString("braIntro"));
				braVO.setBraPic(rs.getBytes("braPic"));
				braVO.setBraTel(rs.getString("braTel"));
				braVO.setBraAddr(rs.getString("braAddr"));
				braVO.setBraLng(rs.getDouble("braLng"));
				braVO.setBraLat(rs.getDouble("braLat"));
				braVO.setBraState(rs.getInt("braState"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		
		
		
		
		return braVO;
	}

	@Override
	public List<BranchVO> getAll() {
		BranchVO braVO = new BranchVO();
		Connection con =null;
		PreparedStatement pstmt =null;
		List<BranchVO> list = new ArrayList<BranchVO>();
		ResultSet rs =null;
		
		
		try {
			con =ds.getConnection();
			pstmt =con.prepareStatement(FIND_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				braVO =new BranchVO(); 	
				
				
				
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

}
