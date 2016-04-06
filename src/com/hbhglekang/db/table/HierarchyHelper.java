package com.hbhglekang.db.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.common.base.Joiner;
import com.hbhglekang.db.DbUtil;

public class HierarchyHelper implements TableHelper<Hierarchy> {

	private DbUtil dbUtil;

	public HierarchyHelper(DbUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	private String toStr(Hierarchy hierarchy) {
		List<String> list = new ArrayList<String>();
		if (hierarchy.getId() >= -1) {
			list.add("id=" + hierarchy.getId());
		}
		if (hierarchy.getName() != null) {
			list.add("name=\"" + hierarchy.getName() + "\"");
		}
		if (hierarchy.getParent_id() >= -1) {
			list.add("parent_id=" + hierarchy.getParent_id());
		}
		if (hierarchy.getPath() != null) {
			list.add("path=\"" + hierarchy.getPath() + "\"");
		}
		if (hierarchy.getMiaoshu() != null) {
			list.add("miaoshu=\"" + hierarchy.getMiaoshu() + "\"");
		}
		if (hierarchy.getType() != 0) {
			list.add("type=" + hierarchy.getType());
		}
		return Joiner.on(",").join(list);
	}

	/**
	 * 
	 * @param hierarchy
	 * @return
	 * @throws SQLException
	 */
	public List<Hierarchy> selectAll() throws SQLException {
		List<Hierarchy> result = new ArrayList<Hierarchy>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id,name,parent_id,path,miaoshu,type from " + Hierarchy.tableName;
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int parent_id = rs.getInt("parent_id");
				String path = rs.getString("path");
				String miaoshu = rs.getString("miaoshu");
				int type = rs.getInt("type");
				result.add(new Hierarchy(id, name, parent_id, path, miaoshu, type));
			}
		} finally {
			dbUtil.closeResultSet(rs);
			dbUtil.closeStatement(ps);
		}
		return result;
	}

	/**
	 * 
	 * @param hierarchy
	 * @return
	 * @throws SQLException
	 */
	public List<Hierarchy> select(Hierarchy hierarchy) throws SQLException {
		List<Hierarchy> result = new ArrayList<Hierarchy>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id,name,parent_id,path,miaoshu,type from " + hierarchy.getTableName();
			String str = toStr(hierarchy);
			if (str != null && str.trim().length() > 0) {
				sql = sql + " where " + str;
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int parent_id = rs.getInt("parent_id");
				String path = rs.getString("path");
				String miaoshu = rs.getString("miaoshu");
				int type = rs.getInt("type");
				result.add(new Hierarchy(id, name, parent_id, path, miaoshu, type));
			}
		} finally {
			dbUtil.closeResultSet(rs);
			dbUtil.closeStatement(ps);
		}
		return result;
	}

	/**
	 * 
	 * @param hierarchy
	 * @throws SQLException
	 */
	public void add(Hierarchy hierarchy) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "insert into " + hierarchy.getTableName() + "(name,parent_id,path,miaoshu,type) values(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, hierarchy.getName());
			ps.setInt(2, hierarchy.getParent_id());
			ps.setString(3, hierarchy.getPath());
			ps.setString(4, hierarchy.getMiaoshu());
			ps.setInt(5, hierarchy.getType());
			ps.executeUpdate();
		} finally {
			dbUtil.closeStatement(ps);
		}
	}

	/**
	 * 
	 * @param hierarchy
	 * @throws SQLException
	 */
	public void update(Hierarchy hierarchy) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "update " + hierarchy.getTableName() + " set " + toStr(hierarchy) + " where id=" + hierarchy.getId();
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
	public void delete(Hierarchy hierarchy) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "delete from " + hierarchy.getTableName() + " where id=" + hierarchy.getId();
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
		HierarchyHelper hh = new HierarchyHelper(dbUtil);
		// Hierarchy hierarchy = new Hierarchy(-2, null, 0, null, null);
		// List<Hierarchy> list = hh.select(hierarchy);
		// for(Hierarchy h : list){
		// System.out.println(h);
		// }
		List<Hierarchy> list = hh.selectAll();
		for (Hierarchy h : list) {
			System.out.println(h);
		}
		dbUtil.close();
	}

}
