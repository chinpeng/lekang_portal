package com.hbhglekang.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class CurdTest extends DbUtil {

	public CurdTest(String host, int port, String db, String username,
			String password) throws ClassNotFoundException, SQLException {
		super(host, port, db, username, password);
	}

	/**
	 * 
	 * @throws SQLException
	 */
	private void add() throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			String sql = "insert into [user](name,password,email,age,birthday,money) values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "psName");
			ps.setString(2, "psPassword");
			ps.setString(3, "jkjs@126.com");
			ps.setInt(4, 23);
			ps.setDate(5, new java.sql.Date(new java.util.Date().getDate()));
			ps.setFloat(6, 2344);
			ps.executeUpdate();
		} finally {
			closeStatement(ps);
		}

	}

	/*
	 * 
	 */
	private void get() throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select id,name,password,email,birthday,money from [user]";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String pass = rs.getString("password");
				String email = rs.getString("email");
				Date birthday = rs.getDate("birthday");
				float money = rs.getFloat("money");
				System.out.println("id是：" + id + "姓名是： " + name + " 密码是："
						+ pass + "邮箱是：" + email + "生日是： " + birthday + "工资是"
						+ money);
			}
		} finally {
			closeResultSet(rs);
			closeStatement(ps);
		}

	}

	/**
	 * 
	 * @throws SQLException
	 */
	private void update() throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			String sql = "update [user] set name='lucy',password='123',money=5000 where id=1";
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			closeStatement(ps);
		}

	}

	/**
	 * 
	 * @throws SQLException
	 */
	private void delete() throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			String sql = "delete from [user] where id=1";
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();

		} finally {
			closeStatement(ps);
		}

	}
	
}
