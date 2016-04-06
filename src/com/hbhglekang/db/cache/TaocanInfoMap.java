package com.hbhglekang.db.cache;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hbhglekang.db.DbUtil;
import com.hbhglekang.db.table.TaocanInfo;
import com.hbhglekang.db.table.TaocanInfoHelper;

/**
 * 
 * @author pengchen
 *
 */
public class TaocanInfoMap{
	/**
	 * tcid -> List<TaocanInfo>
	 */
	public Map<Integer, List<TaocanInfo>> tcid2TaocanInfo = null;
	/**
	 * id->TaocanInfo
	 */
	public Map<Integer, TaocanInfo> id2TaocanInfo = null;
	
	public TaocanInfoHelper taocanInfoHelper = null;
	/**
	 * 
	 * @param dbUtil
	 * @throws SQLException
	 */
	public TaocanInfoMap(DbUtil dbUtil) throws SQLException {
		taocanInfoHelper = new TaocanInfoHelper(dbUtil);
		refresh();
	}
	/**
	 * @throws SQLException 
	 * 
	 */
	public void refresh() throws SQLException {
		Map<Integer, List<TaocanInfo>> _tcid2TaocanInfo = new HashMap<Integer, List<TaocanInfo>>();
		Map<Integer, TaocanInfo> _id2TaocanInfo = new HashMap<Integer, TaocanInfo>();
		List<TaocanInfo> list = taocanInfoHelper.selectAll();
		for(TaocanInfo temp : list){
			List<TaocanInfo> _ = _tcid2TaocanInfo.get(temp.getTcid());
			if(_ == null){
				_ = new ArrayList<TaocanInfo>();
				_tcid2TaocanInfo.put(temp.getTcid(), _);
			}
			_.add(temp);
			_id2TaocanInfo.put(temp.getId(), temp);
		}
		this.tcid2TaocanInfo = _tcid2TaocanInfo;
		this.id2TaocanInfo = _id2TaocanInfo;
	}
	
}
