package com.hbhglekang.db.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.common.base.Joiner;
import com.hbhglekang.db.DbUtil;

/**
 * 
 * @author pengchen
 *
 */
public class TaocanInfoHelper implements TableHelper<TaocanInfo> {

	private DbUtil dbUtil;

	public TaocanInfoHelper(DbUtil dbUtil) {
		this.dbUtil = dbUtil;
	}

	private String toStr(TaocanInfo taocanInfo) {
		List<String> list = new ArrayList<String>();
		if (taocanInfo.getId() > 0) {
			list.add("id=" + taocanInfo.getId());
		}
		if(taocanInfo.getTcid() > 0){
			list.add("tcid=" + taocanInfo.getTcid());
		}
		if (taocanInfo.getName() != null) {
			list.add("name=\"" + taocanInfo.getName() + "\"");
		}
		if (taocanInfo.getCount() >= 0) {
			list.add("count=" + taocanInfo.getCount());
		}
		if (taocanInfo.getEvaluate() >= 0) {
			list.add("evaluate=" + taocanInfo.getEvaluate());
		}
		if (taocanInfo.getPrice() > 0) {
			list.add("price=" + taocanInfo.getPrice());
		}
		if (taocanInfo.getAvailability() != null) {
			list.add("availability=\"" + taocanInfo.getAvailability() + "\"");
		}
		if (taocanInfo.getPackageMeaning() != null) {
			list.add("packageMeaning=\"" + taocanInfo.getPackageMeaning() + "\"");
		}
		if (taocanInfo.getMainItems() != null) {
			list.add("mainItems=\"" + taocanInfo.getMainItems() + "\"");
		}
		if (taocanInfo.getDiseaseScreening() != null) {
			list.add("diseaseScreening=\"" + taocanInfo.getDiseaseScreening() + "\"");
		}
		if (taocanInfo.getDesc_url() != null) {
			list.add("desc_url=\"" + taocanInfo.getDesc_url() + "\"");
		}
		return Joiner.on(",").join(list);
	}

	/**
	 * 
	 * @param TaocanInfo
	 * @return
	 * @throws SQLException
	 */
	public List<TaocanInfo> selectAll() throws SQLException {
		List<TaocanInfo> result = new ArrayList<TaocanInfo>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id, tcid, name, count, evaluate, price, availability, packageMeaning, mainItems, diseaseScreening, desc_url from " + TaocanInfo.tableName;
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				int tcid = rs.getInt("tcid");
				String name = rs.getString("name");
				long count = rs.getLong("count");
				int evaluate = rs.getInt("evaluate");
				float price = rs.getFloat("price");
				String availability = rs.getString("availability");
				String packageMeaning = rs.getString("packageMeaning");
				String mainItems = rs.getString("mainItems");
				String diseaseScreening = rs.getString("diseaseScreening");
				String desc_url = rs.getString("desc_url");
				result.add(new TaocanInfo(id, tcid, name, count, evaluate, price, availability, packageMeaning, mainItems, diseaseScreening, desc_url));
			}
		} finally {
			dbUtil.closeResultSet(rs);
			dbUtil.closeStatement(ps);
		}
		return result;
	}

	/**
	 * 
	 * @param taocanInfo
	 * @return
	 * @throws SQLException
	 */
	public List<TaocanInfo> select(TaocanInfo taocanInfo) throws SQLException {
		List<TaocanInfo> result = new ArrayList<TaocanInfo>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "select id, tcid, name, count, evaluate, price, availability, packageMeaning, mainItems, diseaseScreening, desc_url from " + taocanInfo.getTableName();
			String str = toStr(taocanInfo);
			if (str != null && str.trim().length() > 0) {
				sql = sql + " where " + str;
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				int tcid = rs.getInt("tcid");
				String name = rs.getString("name");
				long count = rs.getLong("count");
				int evaluate = rs.getInt("evaluate");
				float price = rs.getFloat("price");
				String availability = rs.getString("availability");
				String packageMeaning = rs.getString("packageMeaning");
				String mainItems = rs.getString("mainItems");
				String diseaseScreening = rs.getString("diseaseScreening");
				String desc_url = rs.getString("desc_url");
				result.add(new TaocanInfo(id, tcid, name, count, evaluate, price, availability, packageMeaning, mainItems, diseaseScreening, desc_url));
			}
		} finally {
			dbUtil.closeResultSet(rs);
			dbUtil.closeStatement(ps);
		}
		return result;
	}

	/**
	 * 
	 * @param taocanInfo
	 * @throws SQLException
	 */
	public void add(TaocanInfo taocanInfo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "insert into " + taocanInfo.getTableName() + "(tcid, name, count, evaluate, price, availability, packageMeaning, mainItems, diseaseScreening, desc_url) values(?,?,?,?,?,?,?,?,?,?,)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, taocanInfo.getTcid());
			ps.setString(2, taocanInfo.getName());
			ps.setLong(3, taocanInfo.getCount());
			ps.setInt(4, taocanInfo.getEvaluate());
			ps.setFloat(5, taocanInfo.getPrice());
			ps.setString(6, taocanInfo.getAvailability());
			ps.setString(7, taocanInfo.getPackageMeaning());
			ps.setString(8, taocanInfo.getMainItems());
			ps.setString(9, taocanInfo.getDiseaseScreening());
			ps.setString(10, taocanInfo.getDesc_url());
			ps.executeUpdate();
		} finally {
			dbUtil.closeStatement(ps);
		}
	}

	/**
	 * 
	 * @param taocanInfo
	 * @throws SQLException
	 */
	public void update(TaocanInfo taocanInfo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "update " + taocanInfo.getTableName() + " set " + toStr(taocanInfo) + " where id=" + taocanInfo.getId();
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
	public void delete(TaocanInfo taocanInfo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "delete from " + taocanInfo.getTableName() + " where id=" + taocanInfo.getId();
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
		TaocanInfoHelper hh = new TaocanInfoHelper(dbUtil);
		List<TaocanInfo> list = hh.selectAll();
		for (TaocanInfo h : list) {
			System.out.println(h);
		}
		dbUtil.close();
	}

}
