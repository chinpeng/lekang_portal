package com.hbhglekang.db.table;

/**
 * 专家
 * @author pengchen
 *
 */
public class Zhuanjia implements Table, Comparable<Zhuanjia>{

	public static final String tableName = "zhuanjia";
	
	private int id = 0;
	private String name;
	private String sex;
	private int age;
	private String title;
	private String introduction;
	/**
	 * 头像地址
	 */
	private String avatar_path;
	
	@Override
	public String toString() {
		return "id="+id+", name="+name+", sex="+sex+", age="+age+", title="+title+", introduction="+introduction+", avatar_path="+avatar_path;
	}
	
	public Zhuanjia(int id, String name, String sex, int age, String title, String introduction, String avatar_path) {
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.title = title;
		this.introduction = introduction;
		this.avatar_path = avatar_path;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public String getAvatar_path() { 
		return avatar_path;
	}

	public void setAvatar_path(String avatar_path) {
		this.avatar_path = avatar_path;
	}

	public static String getTablename() {
		return tableName;
	}

	public String getTableName() {
		return tableName;
	}

	public int compareTo(Zhuanjia o) {
		if(getId() > o.getId()){
			return 1;
		} else if(getId() < o.getId()){
			return -1;
		} else {
			return 0;
		}
	}

	
	
}
