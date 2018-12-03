package Hisign.entity;
/**
 * 耗材仓库耗材列表
 * @author Administrator
 *
 */
public class ConsumableListInfor {
	private String dcnumber;//申请耗材采购的订单号
	private String ptype;
	private String Recipients_number;
	private String consumable_type;
	private String consumable_name;
	private String specifications;
	private String ptime;
	private String consumable_num;
	private String consum_uprice;
	private String consum_tprice;
	private String note;
	private String available;
	private int type_num;
	private String add_date;
	
	
	
	public String getDcnumber() {
		return dcnumber;
	}
	public void setDcnumber(String dcnumber) {
		this.dcnumber = dcnumber;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getRecipients_number() {
		return Recipients_number;
	}
	public void setRecipients_number(String recipients_number) {
		Recipients_number = recipients_number;
	}
	public String getConsumable_type() {
		return consumable_type;
	}
	public void setConsumable_type(String consumable_type) {
		this.consumable_type = consumable_type;
	}
	public String getConsumable_name() {
		return consumable_name;
	}
	public void setConsumable_name(String consumable_name) {
		this.consumable_name = consumable_name;
	}
	public String getSpecifications() {
		return specifications;
	}
	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}
	public String getPtime() {
		return ptime;
	}
	public void setPtime(String ptime) {
		this.ptime = ptime;
	}
	public String getConsumable_num() {
		return consumable_num;
	}
	public void setConsumable_num(String consumable_num) {
		this.consumable_num = consumable_num;
	}
	public String getConsum_uprice() {
		return consum_uprice;
	}
	public void setConsum_uprice(String consum_uprice) {
		this.consum_uprice = consum_uprice;
	}
	public String getConsum_tprice() {
		return consum_tprice;
	}
	public void setConsum_tprice(String consum_tprice) {
		this.consum_tprice = consum_tprice;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public int getType_num() {
		return type_num;
	}
	public void setType_num(int type_num2) {
		this.type_num = type_num2;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	
	

}
