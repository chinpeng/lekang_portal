package com.hbhglekang.db;

import java.sql.SQLException;
import java.util.List;

import com.hbhglekang.db.cache.ContentMap;
import com.hbhglekang.db.cache.HierarchyMap;
import com.hbhglekang.db.cache.TaocanInfoMap;
import com.hbhglekang.db.cache.TaocanMap;
import com.hbhglekang.db.cache.ZhuanjiaMap;
import com.hbhglekang.db.table.Content;
import com.hbhglekang.db.table.Hierarchy;
import com.hbhglekang.db.table.Taocan;
import com.hbhglekang.db.table.TaocanInfo;
import com.hbhglekang.db.table.Zhuanjia;

public class CacheMap {
	
	public HierarchyMap hierarchyMap;
	public ContentMap contentMap;
	public ZhuanjiaMap zhuanjiaMap;
	public TaocanInfoMap taocanInfoMap;
	public TaocanMap taocanMap;
	public RefreshThread refreshThread;

	public CacheMap(DbUtil dbUtil) throws SQLException {
		this.hierarchyMap = new HierarchyMap(dbUtil);
		this.contentMap = new ContentMap(dbUtil);
		this.zhuanjiaMap = new ZhuanjiaMap(dbUtil);
		this.taocanInfoMap = new TaocanInfoMap(dbUtil);
		this.taocanMap = new TaocanMap(dbUtil);
		this.refreshThread = new RefreshThread();
		this.refreshThread.setDaemon(true);
		this.refreshThread.start();
	}
	
	public Hierarchy getHierarchy(int hierarchy_id){
		return hierarchyMap.id2Hierarchy.get(hierarchyMap);
	}
	
	public List<Content> getContent(int hierarchy_id){
		return contentMap.hierarchy_id2Content.get(hierarchy_id);
	}
	
	public Zhuanjia getZhuanjia(int id){
		return zhuanjiaMap.id2Zhuanjia.get(id);
	}
	
	public TaocanInfo getTaocanInfo(int id){
		return taocanInfoMap.id2TaocanInfo.get(id);
	}
	
	public Taocan getTaocan(int id){
		return taocanMap.id2Taocan.get(id);
	}
	
	public void refresh() throws SQLException{
		this.hierarchyMap.refresh();
		this.contentMap.refresh();
		this.zhuanjiaMap.refresh();
		this.taocanInfoMap.refresh();
		this.taocanMap.refresh();
	}
	
	public class RefreshThread extends Thread{
		@Override
		public void run() {
			while(!Thread.currentThread().isInterrupted()){
				try{
					refresh();
					Thread.sleep(10*1000);
				}catch(Throwable t){
				}
			}
		}
	}
	
	/**
	 * 
	 * @param args
	 * @throws SQLException
	 */
	public static void main(String[] args) throws SQLException {
		CacheMap cacheMap = new CacheMap(DbManager.instance.dbUtil);
	}
	
}
