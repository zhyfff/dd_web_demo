package Hisign.authority;


/**
 * 建立权限枚举类型, 用于描述权限的种类, 包含了权限的名称. 每个枚举值中包含了权限中文名称和权限索引值(即权限位)
 */
public enum AuthorityType{

	IT_Order_Find("查看总裁办IT信息部", 0), 
	IT_Order_Audit("审批总裁办IT信息部", 1), 
	Dept_Order_Find("查看总裁办行政部", 2),
	Dept_Order_Audit("审批总裁办行政部", 3),
	Pact_Order_Find("查看总裁办合同管理部", 4),
	Pact_Order_Audit("审批总裁办合同管理部", 5),
	HR_Order_Find("查看人力资源中心", 6),
	HR_Order_Audit("审批人力资源中心", 7),
	
	;
	private String name;
	private int index;

	private AuthorityType(String name, int index) {
		this.name = name;
		this.index = index;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

}
