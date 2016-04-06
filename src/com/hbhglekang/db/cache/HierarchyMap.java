package com.hbhglekang.db.cache;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hbhglekang.db.DbUtil;
import com.hbhglekang.db.table.Hierarchy;
import com.hbhglekang.db.table.HierarchyHelper;

/**
 * 
 * @author pengchen
 *
 */
public class HierarchyMap{
	/**
	 * parent_id -> List<Hierarchy>
	 */
	public Map<Integer, List<Hierarchy>> parent_id2Hierarchy = null;
	/**
	 * id->Hierarchy
	 */
	public Map<Integer, Hierarchy> id2Hierarchy = null;
	public HierarchyHelper hierarchyHelper;
	/**
	 * 
	 * @param dbUtil
	 * @throws SQLException
	 */
	public HierarchyMap(DbUtil dbUtil) throws SQLException {
		hierarchyHelper = new HierarchyHelper(dbUtil);
		refresh();
	}
	/**
	 * 
	 * @throws SQLException
	 */
	public void refresh() throws SQLException {
		Map<Integer, List<Hierarchy>> _parent_id2Hierarchy = new HashMap<Integer, List<Hierarchy>>();
		Map<Integer, Hierarchy> _id2Hierarchy = new HashMap<Integer, Hierarchy>();
		List<Hierarchy> list = hierarchyHelper.selectAll();
		for(Hierarchy temp : list){
			List<Hierarchy> _ = _parent_id2Hierarchy.get(temp.getParent_id());
			if(_ == null){
				_ = new ArrayList<Hierarchy>();
				_parent_id2Hierarchy.put(temp.getParent_id(), _);
			}
			_.add(temp);
			_id2Hierarchy.put(temp.getId(), temp);
		}
		parent_id2Hierarchy = _parent_id2Hierarchy;
		id2Hierarchy = _id2Hierarchy;
	}
	
	
	
}
