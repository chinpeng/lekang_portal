package com.hbhglekang.db.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.common.base.Joiner;
import com.hbhglekang.db.DbUtil;

public class TaocanHelper implements TableHelper<Taocan> {

	private DbUtil dbUtil;

	public TaocanHelper(DbUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	private String toStr(Taocan taocan) {
		List<String> list = new ArrayList<String>();
		if (taocan.getId() > 0) {
			list.add("id=" + taocan.getId());
		}
		if (taocan.getName() != null) {
			list.add("name=\"" + taocan.getName() + "\"");
		}
		if (taocan.getType() != null) {
			list.add("type=\"" + taocan.getType()+"\"");
		}
		if (taocan.getPic_path() != null) {
			list.add("pic_path=\"" + taocan.getPic_path()+"\"");
		}
		return Joiner.on(",").join(list);
	}

	/**
	 * 
	 * @param hierarchy
	 * @return
	 * @throws SQLException
	 */
	public List<Taocan> selectAll() throws SQLException {
		List<Taocan> result = new ArrayList<Taocan>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id,name,type,pic_path  from " + Taocan.tableName;
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String type = rs.getString("type");
				String pic_path = rs.getString("pic_path");
				result.add(new Taocan(id, name, type, pic_path));
			}
		} finally {
			dbUtil.closeResultSet(rs);
			dbUtil.closeStatement(ps);
		}
		return result;
	}

	/**
	 * 
	 * @param taocan
	 * @return
	 * @throws SQLException
	 */
	public List<Taocan> select(Taocan taocan) throws SQLException {
		List<Taocan> result = new ArrayList<Taocan>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id,name,type,pic_path from " + taocan.getTableName();
			String str = toStr(taocan);
			if (str != null && str.trim().length() > 0) {
				sql = sql + " where " + str;
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String type = rs.getString("type");
				String pic_path = rs.getString("pic_path");
				result.add(new Taocan(id, name, type, pic_path));
			}
		} finally {
			dbUtil.closeResultSet(rs);
			dbUtil.closeStatement(ps);
		}
		return result;
	}

	/**
	 * 
	 * @param taocan
	 * @throws SQLException
	 */
	public void add(Taocan taocan) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "insert into " + taocan.getTableName() + "(name,type,pic_path) values(?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, taocan.getName());
			ps.setString(2, taocan.getType());
			ps.setString(3, taocan.getPic_path());
			ps.executeUpdate();
		} finally {
			dbUtil.closeStatement(ps);
		}
	}

	/**
	 * 
	 * @param taocan
	 * @throws SQLException
	 */
	public void update(Taocan taocan) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "update " + taocan.getTableName() + " set " + toStr(taocan) + " where id=" + taocan.getId();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			dbUtil.closeStatement(ps);
		}
	}

	/**
	 * 
	 * @throws SQLException
	 */
	public void delete(Taocan taocan) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "delete from " + taocan.getTableName() + " where id=" + taocan.getId();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			dbUtil.closeStatement(ps);
		}
	}

	/**
	 * 
	 * @param args
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static void main(String[] args) throws Exception {
		String host = "localhost";
		int port = 3306;
		String db = "lekang_portal_db";
		String username = "root";
		String password = "baeeq0122";
		DbUtil dbUtil = new DbUtil(host, port, db, username, password);
		TaocanHelper hh = new TaocanHelper(dbUtil);
		List<Taocan> list = hh.selectAll();
		for (Taocan h : list) {
			System.out.println(h);
		}
		dbUtil.close();
	}

}
