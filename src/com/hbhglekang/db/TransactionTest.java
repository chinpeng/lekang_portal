package com.hbhglekang.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TransactionTest {
	
	private DbUtil jdbcUtil;
	
	public TransactionTest(DbUtil jdbcUtil) {
		this.jdbcUtil = jdbcUtil;
	}
	
	public void transferTest()throws SQLException{
		int id1 =3;
		float m1= 100.0f;
		int id2 = 4;
		transfer2(id1,m1,id2);
	}
	
	public boolean transfer2(int id1,float m1,int id2)throws SQLException{
		boolean flag = false;
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = jdbcUtil.getConnection();
			conn.setAutoCommit(false);
			String sql = "update [user] set money = money=? where id = ?";
			ps= conn.prepareStatement(sql);
			ps.setFloat(1, m1);
			ps.setInt(2, id1);
			ps.executeUpdate();
			
			String sql1 = "update [user] set money = money+? where id = ?";
			ps= conn.prepareStatement(sql);
			ps.setFloat(1, m1);
			ps.setInt(2, id2);
			ps.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			conn.rollback();
			throw e;
		}finally{
			jdbcUtil.closeResultSet(rs);
			jdbcUtil.closeStatement(ps);
			jdbcUtil.closeConnection(conn);
		}
		return flag;
		
		
	}
	

}

