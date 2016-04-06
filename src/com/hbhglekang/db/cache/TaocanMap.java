package com.hbhglekang.db.cache;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hbhglekang.db.DbUtil;
import com.hbhglekang.db.table.Taocan;
import com.hbhglekang.db.table.TaocanHelper;

/**
 * 
 * @author pengchen
 *
 */
public class TaocanMap{
	/**
	 * type -> List<Taocan>
	 */
	public Map<String, List<Taocan>> type2Taocan = null;
	/**
	 * id->Taocan
	 */
	public Map<Integer, Taocan> id2Taocan = null;
	public TaocanHelper taocanHelper;
	/**
	 * 
	 * @param dbUtil
	 * @throws SQLException
	 */
	public TaocanMap(DbUtil dbUtil) throws SQLException {
		taocanHelper = new TaocanHelper(dbUtil);
		refresh();
	}
	/**
	 * 
	 * @throws SQLException
	 */
	public void refresh() throws SQLException {
		Map<String, List<Taocan>> _type2Taocan = new HashMap<String, List<Taocan>>();
		Map<Integer, Taocan> _id2Taocan = new HashMap<Integer, Taocan>();
		List<Taocan> list = taocanHelper.selectAll();
		for(Taocan temp : list){
			List<Taocan> _ = _type2Taocan.get(temp.getType());
			if(_ == null){
				_ = new ArrayList<Taocan>();
				_type2Taocan.put(temp.getType(), _);
			}
			_.add(temp);
			_id2Taocan.put(temp.getId(), temp);
		}
		type2Taocan = _type2Taocan;
		id2Taocan = _id2Taocan;
	}
	
	
	
}
