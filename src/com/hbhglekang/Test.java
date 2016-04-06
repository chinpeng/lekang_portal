package com.hbhglekang;

import java.util.List;

import com.hbhglekang.db.CacheMap;
import com.hbhglekang.db.DbManager;
import com.hbhglekang.db.table.TaocanInfo;

public class Test {

	public static void main(String[] args) {
		CacheMap cacheMap = DbManager.instance.getCacheMap();
		List<TaocanInfo> taocanInfos = cacheMap.taocanInfoMap.tcid2TaocanInfo.get(1);
		int breakFlag = 0;
		for(TaocanInfo ti : taocanInfos){
			System.out.println(ti.toString());
		}
	}
	
}
