package Hisign.entity;

public class StandbyInfor {
  private String dctid;//单据号
  private String job_number;//工号
  private String standby_people;//申请人
  private String standby_department;//申请人部门
  private String standby_firstdate;//申请时间
  private String process_jobnum; 
  private String process_time;//处理时间
  private String process_people;//处理人
  private String process_result;//审批结果
  private String complete_time;//完成时间
  private String standby_note;//备注
  private String  evaluation;//服务评价
  private String donetime;
  private String test_time;
  
  
  public String getTest_time() {
	return test_time;
}
public void setTest_time(String test_time) {
	this.test_time = test_time;
}
public String getDonetime() {
	return donetime;
}
public void setDonetime(String donetime) {
	this.donetime = donetime;
}
public String getProcess_result() {
	return process_result;
}
public void setProcess_result(String process_result) {
	this.process_result = process_result;
}
public String getProcess_jobnum() {
	return process_jobnum;
}
public void setProcess_jobnum(String process_jobnum) {
	this.process_jobnum = process_jobnum;
}
public String getDctid() {
	return dctid;
}
public void setDctid(String dctid) {
	this.dctid = dctid;
}
public String getJob_number() {
	return job_number;
}
public void setJob_number(String job_number) {
	this.job_number = job_number;
}
public String getStandby_people() {
	return standby_people;
}
public void setStandby_people(String standby_people) {
	this.standby_people = standby_people;
}
public String getStandby_department() {
	return standby_department;
}
public void setStandby_department(String standby_department) {
	this.standby_department = standby_department;
}
public String getStandby_firstdate() {
	return standby_firstdate;
}
public void setStandby_firstdate(String standby_firstdate) {
	this.standby_firstdate = standby_firstdate;
}
public String getProcess_time() {
	return process_time;
}
public void setProcess_time(String process_time) {
	this.process_time = process_time;
}
public String getProcess_people() {
	return process_people;
}
public void setProcess_people(String process_people) {
	this.process_people = process_people;
}
/*public String getProcess_result() {
	return process_result;
}
public void setProcess_result(String process_result) {
	this.process_result = process_result;
}*/
public String getComplete_time() {
	return complete_time;
}
public void setComplete_time(String complete_time) {
	this.complete_time = complete_time;
}
public String getStandby_note() {
	return standby_note;
}
public void setStandby_note(String standby_note) {
	this.standby_note = standby_note;
}
public String getEvaluation() {
	return evaluation;  
}
public void setEvaluation(String evaluation) {
	this.evaluation = evaluation;
}
  
}