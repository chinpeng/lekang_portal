package com.hbhglekang.db.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.common.base.Joiner;
import com.hbhglekang.db.DbUtil;

public class ContentHelper implements TableHelper<Content> {

	private DbUtil dbUtil;

	public ContentHelper(DbUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	private String toStr(Content content) {
		List<String> list = new ArrayList<String>();
		if (content.getId() >= -1) {
			list.add("id=" + content.getId());
		}
		if (content.getName() != null) {
			list.add("name=\"" + content.getName() + "\"");
		}
		if (content.getHierarchy_id() >= -1) {
			list.add("hierarchy_id=" + content.getHierarchy_id());
		}
		if (content.getData() != null) {
			list.add("data=\"" + content.getData() + "\"");
		}
		list.add("timestamp=\"" + content.getTimestamp() + "\"");
		return Joiner.on(",").join(list);
	}

	/**
	 * 
	 * @param Content
	 * @return
	 * @throws SQLException
	 */
	public List<Content> selectAll() throws SQLException {
		List<Content> result = new ArrayList<Content>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id,name,hierarchy_id,data,timestamp from " + Content.tableName;
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int hierarchy_id = rs.getInt("hierarchy_id");
				String data = rs.getString("data");
				long timestamp = rs.getLong("timestamp");
				result.add(new Content(id, name, hierarchy_id, data, timestamp));
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
	public List<Content> select(Content content) throws SQLException {
		List<Content> result = new ArrayList<Content>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id,name,hierarchy_id,data,timestamp from " + content.getTableName();
			String str = toStr(content);
			if (str != null && str.trim().length() > 0) {
				sql = sql + " where " + str;
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int hierarchy_id = rs.getInt("hierarchy_id");
				String data = rs.getString("data");
				long timestamp = rs.getLong("timestamp");
				result.add(new Content(id, name, hierarchy_id, data, timestamp));
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
	public void add(Content content) throws SQLException {
		if(content.getId() > 0){
			update(content);
			return;
		}
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "insert into " + content.getTableName() + "(name,hierarchy_id,data,timestamp) values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, content.getName());
			ps.setInt(2, content.getHierarchy_id());
			ps.setString(3, content.getData());
			ps.setLong(4, content.getTimestamp());
			ps.executeUpdate();
		} finally {
			dbUtil.closeStatement(ps);
		}
	}

	/**
	 * 
	 * @param content
	 * @throws SQLException
	 */
	public void update(Content content) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "update " + content.getTableName() + " set " + toStr(content) + " where id=" + content.getId();
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
	public void delete(Content content) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "delete from " + content.getTableName() + " where id=" + content.getId();
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
		ContentHelper hh = new ContentHelper(dbUtil);
		// Hierarchy hierarchy = new Hierarchy(-2, null, 0, null, null);
		// List<Hierarchy> list = hh.select(hierarchy);
		// for(Hierarchy h : list){
		// System.out.println(h);
		// }
		List<Content> list = hh.selectAll();
		for (Content h : list) {
			System.out.println(h);
		}
		dbUtil.close();
	}

}
