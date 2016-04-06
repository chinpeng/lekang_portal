package com.hbhglekang.db.table;

/**
 * 套餐信息
 * @author pengchen
 *
 */
public class TaocanInfo implements Table, Comparable<TaocanInfo>{

	public static final String tableName = "taocanInfo";
	
	private int id = 0;
	private int tcid;
	private String name;
	private long count;
	private int evaluate;
	private float price;
	private String availability;
	private String packageMeaning;
	private String mainItems;
	private String diseaseScreening;
	private String desc_url;
	
	@Override
	public String toString() {
		return "id="+id+", tcid="+tcid+", name="+name+", count="+count+", evaluate="+evaluate
				+", price="+price+", availability="+availability+", packageMeaning="+packageMeaning+", mainItems="+mainItems
				+", diseaseScreening="+diseaseScreening+", desc_url="+desc_url;
	}
	
	public TaocanInfo(int id, int tcid, String name, long count, 
			int evaluate, float price, String availability, String packageMeaning, 
			String mainItems, String diseaseScreening, String desc_url) {
		this.id = id;
		this.tcid = tcid;
		this.name = name;
		this.count = count;
		this.evaluate = evaluate;
		this.price = price;
		this.availability = availability;
		this.packageMeaning = packageMeaning;
		this.mainItems = mainItems;
		this.diseaseScreening = diseaseScreening;
		this.desc_url = desc_url;
	}

	public static String getTablename() {
		return tableName;
	}

	public String getTableName() {
		return tableName;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTcid() {
		return tcid;
	}

	public void setTcid(int tcid) {
		this.tcid = tcid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public int getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(int evaluate) {
		this.evaluate = evaluate;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getPackageMeaning() {
		return packageMeaning;
	}

	public void setPackageMeaning(String packageMeaning) {
		this.packageMeaning = packageMeaning;
	}

	public String getMainItems() {
		return mainItems;
	}

	public void setMainItems(String mainItems) {
		this.mainItems = mainItems;
	}

	public String getDiseaseScreening() {
		return diseaseScreening;
	}

	public void setDiseaseScreening(String diseaseScreening) {
		this.diseaseScreening = diseaseScreening;
	}

	public String getDesc_url() {
		return desc_url;
	}

	public void setDesc_url(String desc_url) {
		this.desc_url = desc_url;
	}

	public int compareTo(TaocanInfo o) {
		if(getId() > o.getId()){
			return 1;
		} else if(getId() < o.getId()){
			return -1;
		} else {
			return 0;
		}
	}

	
	
}
