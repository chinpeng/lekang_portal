package com.hbhglekang.db;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import com.hbhglekang.db.table.Hierarchy;
import com.hbhglekang.db.table.HierarchyHelper;

/**
 * 
 * @author pengchen
 *
 */
public class DbManager {

	private static final String config = "dbconfig.properties";
	public DbUtil dbUtil;
	public Properties dbConfig = new Properties();

	public static final DbManager instance = new DbManager();
	
	public CacheMap cacheMap;
	
	/**
	 * 
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private DbManager() {
		try {
			Enumeration<URL> e = ClassLoader.getSystemResources(config);
			InputStream inputStream = null;
			if(e.hasMoreElements()){
				URL url = e.nextElement();
				inputStream = new FileInputStream(url.getFile());
			}
			if(inputStream == null){
				inputStream = ClassLoader.getSystemResourceAsStream(config);
			}
			if(inputStream != null){
				dbConfig.load(inputStream);
			} else {
				System.err.println("Can not find "+config);
			}
			////////////////////////////
			String host = dbConfig.getProperty("host", "localhost");
			int port = Integer.parseInt(dbConfig.getProperty("port", "3306"));
			String db = dbConfig.getProperty("db", "lekang_portal_db");
			String username = dbConfig.getProperty("username", "root");
			String password = dbConfig.getProperty("password", "baeeq0122");
			this.dbUtil = new DbUtil(host, port, db, username, password);
			this.cacheMap = new CacheMap(this.dbUtil);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("db init error : " +e.getMessage());
		}
	}

	public final CacheMap getCacheMap() {
		return cacheMap;
	}
	
	/**
	 * 
	 * @param args
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ClassNotFoundException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, IOException, SQLException {
		HierarchyHelper hh = new HierarchyHelper(instance.dbUtil);
		List<Hierarchy> list = hh.selectAll();
		for (Hierarchy h : list) {
			System.out.println(h);
		}
		instance.dbUtil.close();
	}
	
	
	
}
