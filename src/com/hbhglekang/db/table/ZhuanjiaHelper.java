package com.hbhglekang.db.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.common.base.Joiner;
import com.hbhglekang.db.DbUtil;

public class ZhuanjiaHelper implements TableHelper<Zhuanjia> {

	private DbUtil dbUtil;

	public ZhuanjiaHelper(DbUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	private String toStr(Zhuanjia zhuanjia) {
		List<String> list = new ArrayList<String>();
		if (zhuanjia.getId() > 0) {
			list.add("id=" + zhuanjia.getId());
		}
		if (zhuanjia.getName() != null) {
			list.add("name=\"" + zhuanjia.getName() + "\"");
		}
		if (zhuanjia.getSex() != null) {
			list.add("sex=\"" + zhuanjia.getSex() + "\"");
		}
		if (zhuanjia.getAge() >= 0) {
			list.add("age=" + zhuanjia.getAge());
		}
		if (zhuanjia.getTitle() != null) {
			list.add("title=\"" + zhuanjia.getTitle() + "\"");
		}
		if(zhuanjia.getIntroduction() != null){
			list.add("introduction=\"" + zhuanjia.getIntroduction() + "\"");
		}
		if(zhuanjia.getAvatar_path() != null){
			list.add("avatar_path=\"" + zhuanjia.getAvatar_path() + "\"");
		}
		return Joiner.on(",").join(list);
	}

	/**
	 * 
	 * @param Content
	 * @return
	 * @throws SQLException
	 */
	public List<Zhuanjia> selectAll() throws SQLException {
		List<Zhuanjia> result = new ArrayList<Zhuanjia>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id, name, sex, age, title, introduction, avatar_path from " + Zhuanjia.tableName;
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				int age = rs.getInt("age");
				String title = rs.getString("title");
				String introduction = rs.getString("introduction");
				String avatar_path = rs.getString("avatar_path");
				result.add(new Zhuanjia(id, name, sex, age, title, introduction, avatar_path));
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
	public List<Zhuanjia> select(Zhuanjia zhuanjia) throws SQLException {
		List<Zhuanjia> result = new ArrayList<Zhuanjia>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id, name, sex, age, title, introduction, avatar_path from " + zhuanjia.getTableName();
			String str = toStr(zhuanjia);
			if (str != null && str.trim().length() > 0) {
				sql = sql + " where " + str;
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				int age = rs.getInt("age");
				String title = rs.getString("title");
				String introduction = rs.getString("introduction");
				String avatar_path = rs.getString("avatar_path");
				result.add(new Zhuanjia(id, name, sex, age, title, introduction, avatar_path));
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
	public void add(Zhuanjia zhuanjia) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "insert into " + zhuanjia.getTableName() + "(name, sex, age, title, introduction, avatar_path) values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, zhuanjia.getName());
			ps.setString(2, zhuanjia.getSex());
			ps.setInt(3, zhuanjia.getAge());
			ps.setString(4, zhuanjia.getTitle());
			ps.setString(5, zhuanjia.getIntroduction());
			ps.setString(6, zhuanjia.getAvatar_path());
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
	public void update(Zhuanjia zhuanjia) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "update " + zhuanjia.getTableName() + " set " + toStr(zhuanjia) + " where id=" + zhuanjia.getId();
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
	public void delete(Zhuanjia zhuanjia) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "delete from " + zhuanjia.getTableName() + " where id=" + zhuanjia.getId();
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
		ZhuanjiaHelper hh = new ZhuanjiaHelper(dbUtil);
		// Hierarchy hierarchy = new Hierarchy(-2, null, 0, null, null);
		// List<Hierarchy> list = hh.select(hierarchy);
		// for(Hierarchy h : list){
		// System.out.println(h);
		// }
		List<Zhuanjia> list = hh.selectAll();
		for (Zhuanjia h : list) {
			System.out.println(h);
		}
		dbUtil.close();
	}

}
