package com.branch.model;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BranchDAO implements BranchDAO_interface {
	private static final String INSERT_SQL = "INSERT INTO Branch(braID,braName,braIntro,braPic,braTel,braVideo,braAddr,braLng,braLat,braState)"
			+ " VALUES('B'||LPAD(to_char(bra_seq.nextval)2,'0'),?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE = "UPDATE Branch set braName=?,braIntro=?,braPic?,braTel=?,braVideo=?,braAddr=?,braLng=?,braLat=?,braState=?";

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

	}

	@Override
	public void update(BranchVO branchVO) {

	}

	@Override
	public BranchVO findByPK(String braID) {
		return null;
	}

	@Override
	public List<BranchVO> getAll() {
		return null;
	}

}
