package Hisign.entity;

public class StampCertificateInfor {
	private String stamp_id;//证章id
	private String stamp_name;//印章、证照名
	private String manager;//管理人员
	private String state;//当前状态
	private String stamp_company;//所属公司
	private String stamp_type;//证章类型
	
	public String getStamp_id() {
		return stamp_id;
	}
	public void setStamp_id(String stamp_id) {
		this.stamp_id = stamp_id;
	}
	public String getStamp_name() {
		return stamp_name;
	}
	public void setStamp_name(String stamp_name) {
		this.stamp_name = stamp_name;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStamp_company() {
		return stamp_company;
	}
	public void setStamp_company(String stamp_company) {
		this.stamp_company = stamp_company;
	}
	public String getStamp_type() {
		return stamp_type;
	}
	public void setStamp_type(String stamp_type) {
		this.stamp_type = stamp_type;
	}
	
	

}
