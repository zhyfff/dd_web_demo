package com.qixinbao.download;

public class Nearbybean {
	
	private String address = "";//��ַ
	private String credit_no = "";//ͳһ���ô���
	private String distance = "";//����
	private String domain = "";//������ҵ
	private String id = "";//��˾id
	private String latitude = "";//γ��
	private String longitude = "";//����
	private String name = "";//��ҵ����
	private String oper_name = "";//����������
	private String org_no = "";//��֯��������
	private String reg_capi = "";//ע���ʱ�
	private String reg_no = "";//ע���
	private String start_date = "";//��������
	private String status = "";//��Ӫ״̬
	private String tag = "";//����
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCredit_no() {
		return credit_no;
	}
	public void setCredit_no(String credit_no) {
		this.credit_no = credit_no;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOper_name() {
		return oper_name;
	}
	public void setOper_name(String oper_name) {
		this.oper_name = oper_name;
	}
	public String getOrg_no() {
		return org_no;
	}
	public void setOrg_no(String org_no) {
		this.org_no = org_no;
	}
	public String getReg_capi() {
		return reg_capi;
	}
	public void setReg_capi(String reg_capi) {
		this.reg_capi = reg_capi;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	@Override
	public String toString() {
		String str = address+"\n"+
		credit_no+"\n"+
		distance+"\n"+
		domain+"\n"+
		id+"\n"+
		latitude+"\n"+
		longitude+"\n"+
		name+"\n"+
		oper_name+"\n"+
		org_no+"\n"+
		reg_capi+"\n"+
		reg_no+"\n"+
		start_date+"\n"+
		status+"\n"+
		tag+"\n"+
		"-------------------";	

//		Log.i("qxb", str);
		return str;
	}

}
