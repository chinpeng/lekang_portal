package com.hbhglekang.db.cache;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.hbhglekang.db.DbManager;
import com.hbhglekang.db.DbUtil;
import com.hbhglekang.db.table.Zhuanjia;
import com.hbhglekang.db.table.ZhuanjiaHelper;

/**
 * 
 * @author pengchen
 *
 */
public class ZhuanjiaMap{
	/**
	 * id -> List<Content>
	 */
	public Map<Integer, Zhuanjia> id2Zhuanjia = null;
	
	public ZhuanjiaHelper helper = null;
	/**
	 * 
	 * @param dbUtil
	 * @throws SQLException
	 */
	public ZhuanjiaMap(DbUtil dbUtil) throws SQLException {
		helper = new ZhuanjiaHelper(dbUtil);
		refresh();
	}
	/**
	 * @throws SQLException 
	 * 
	 */
	public void refresh() throws SQLException {
		Map<Integer, Zhuanjia> _id2Zhuanjia = new HashMap<Integer, Zhuanjia>();
		List<Zhuanjia> list = helper.selectAll();
		for(Zhuanjia temp : list){
			_id2Zhuanjia.put(temp.getId(), temp);
		}
		this.id2Zhuanjia = _id2Zhuanjia;
	}
	
	public static void main(String[] args) throws SQLException {
		ZhuanjiaMap zhuanjiaMap = new ZhuanjiaMap(DbManager.instance.dbUtil);
		Set<Entry<Integer, Zhuanjia>> zhuanjias = zhuanjiaMap.id2Zhuanjia.entrySet();
		for(Entry<Integer, Zhuanjia> entry: zhuanjias){
			Zhuanjia zhuanjia = entry.getValue();
			System.out.println(zhuanjia.getName());
		}
	}
}
