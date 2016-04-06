package com.hbhglekang.db.table;

/**
 * 套餐结构
 * @author pengchen
 *
 */
public class Taocan implements Table{

	public static final String tableName = "taocan";
	
	private int id = 0;
	private String name;
	private String type;
	private String pic_path;
	
	@Override
	public String toString() {
		return "id="+id+", name="+name+", type="+type+", pic_path="+pic_path;
	}
	
	public Taocan(int id, String name, String type, String pic_path) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.pic_path = pic_path;
	}

	public int getId() {
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}

	public static String getTablename() {
		return tableName;
	}

	public String getTableName() {
		return tableName;
	}

	
	
}
