package Hisign.Service;

import java.util.List;

import Hisign.entity.Rlfw;

public interface RlfwService {
	/**
	 * 新建借用
	 * @param rlfwadd
	 * @return
	 */
	public Rlfw add(Rlfw rlfwadd);
	
	/**
	 * 根据借用人、借用时间查询
	 * @param rlfw_use_peo_name
	 * 借用人
	 * @param rlfw_act_borr_time
	 * 借用时间
	 * @return
	 */
	public List<Rlfw> user_select(String rlfw_use_peo_name,String rlfw_act_borr_time);
	/**
	 * 审批人查看需要审批的内容
	 * @param rlfw_depar_id
	 * 部门id
	 * @return
	 */
	public List<Rlfw> shenpi_select(String rlfw_app_peo_name);
	
	public Rlfw shenpi_jieguo(Rlfw rlfw_shenpi_jieguo);
}
