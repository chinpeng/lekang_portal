package com.hbhglekang.db.table;

/**
 * 层级结构
 * @author pengchen
 *
 */
public class Hierarchy implements Table{

	public static final String tableName = "hierarchy";
	
	private int id = -2;
	private String name;
	private int parent_id;
	private String path;
	private String miaoshu;
	/**
	 * type=0表示无法编辑
	 * type=1表示内容通过编辑得来
	 * type=2表示内容展现格式固定，读数据库显示
	 */
	private int type;
	
	@Override
	public String toString() {
		return "id="+id+", name="+name+", parent_id="+parent_id+", path="+path+", miaoshu="+miaoshu+", type="+type;
	}
	
	public Hierarchy(int id, String name, int parent_id, String path, String miaoshu, int type) {
		this.id = id;
		this.name = name;
		this.parent_id = parent_id;
		this.path = path;
		this.miaoshu = miaoshu;
		this.type = type;
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

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getMiaoshu() {
		return miaoshu;
	}

	public void setMiaoshu(String miaoshu) {
		this.miaoshu = miaoshu;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	public String getTableName() {
		return tableName;
	}

	
	
}
