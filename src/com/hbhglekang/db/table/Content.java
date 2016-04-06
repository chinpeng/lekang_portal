package com.hbhglekang.db.table;

/**
 * 内容
 * @author pengchen
 *
 */
public class Content implements Table, Comparable<Content>{

	public static final String tableName = "content";
	
	private long id = -2;
	private String name;
	private int hierarchy_id;
	private String data;
	private long timestamp;
	
	@Override
	public String toString() {
		return "id="+id+", name="+name+", hierarchy_id="+hierarchy_id+", data="+data+", timestamp="+timestamp;
	}
	
	public Content(int id, String name, int hierarchy_id, String data, long timestamp) {
		this.id = id;
		this.name = name;
		this.hierarchy_id = hierarchy_id;
		this.data = data;
		this.timestamp = timestamp;
	}

	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getHierarchy_id() {
		return hierarchy_id;
	}

	public void setHierarchy_id(int hierarchy_id) {
		this.hierarchy_id = hierarchy_id;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public static String getTablename() {
		return tableName;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public String getTableName() {
		return tableName;
	}

	public int compareTo(Content o) {
		if(getTimestamp() > o.getTimestamp()){
			return 1;
		} else if(getTimestamp() < o.getTimestamp()){
			return -1;
		} else {
			return 0;
		}
	}

	
	
}
