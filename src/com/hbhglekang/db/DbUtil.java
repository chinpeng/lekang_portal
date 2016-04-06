package com.hbhglekang.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbUtil {
	private final String url;
	private final String username;
	private final String password;
	private static String driverName = "com.mysql.jdbc.Driver";
	private final Connection connection;

	public DbUtil(String host, int port, String db, String username,
			String password) throws ClassNotFoundException, SQLException {
		this.url = String.format("jdbc:mysql://%s:%s/%s", host, port, db);
		this.username = username;
		this.password = password;
		Class.forName(driverName);
		this.connection = DriverManager.getConnection(this.url, this.username,
				this.password);
	}

	public Connection getConnection() {
		return connection;
	}

	/**
	 * 
	 * @param rs
	 * @param st
	 * @param conn
	 */
	public boolean closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 
	 * @param rs
	 * @param st
	 * @param conn
	 */
	public boolean closeStatement(Statement st) {
		try {
			if (st != null) {
				st.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/**
	 * 
	 * @param rs
	 */
	public boolean closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void close() {
		closeConnection(connection);
	}

}
