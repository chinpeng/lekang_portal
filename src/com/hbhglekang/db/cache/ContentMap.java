package com.hbhglekang.db.cache;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hbhglekang.db.DbUtil;
import com.hbhglekang.db.table.Content;
import com.hbhglekang.db.table.ContentHelper;

/**
 * 
 * @author pengchen
 *
 */
public class ContentMap{
	/**
	 * hierarchy_id -> List<Content>
	 */
	public Map<Integer, List<Content>> hierarchy_id2Content = null;
	/**
	 * id->Content
	 */
	public Map<Long, Content> id2Content = null;
	
	public ContentHelper contentHelper = null;
	/**
	 * 
	 * @param dbUtil
	 * @throws SQLException
	 */
	public ContentMap(DbUtil dbUtil) throws SQLException {
		contentHelper = new ContentHelper(dbUtil);
		refresh();
	}
	/**
	 * @throws SQLException 
	 * 
	 */
	public void refresh() throws SQLException {
		Map<Integer, List<Content>> _hierarchy_id2Content = new HashMap<Integer, List<Content>>();
		Map<Long, Content> _id2Content = new HashMap<Long, Content>();
		List<Content> list = contentHelper.selectAll();
		for(Content temp : list){
			List<Content> _ = _hierarchy_id2Content.get(temp.getHierarchy_id());
			if(_ == null){
				_ = new ArrayList<Content>();
				_hierarchy_id2Content.put(temp.getHierarchy_id(), _);
			}
			_.add(temp);
			_id2Content.put(temp.getId(), temp);
		}
		this.hierarchy_id2Content = _hierarchy_id2Content;
		this.id2Content = _id2Content;
	}
	
}
