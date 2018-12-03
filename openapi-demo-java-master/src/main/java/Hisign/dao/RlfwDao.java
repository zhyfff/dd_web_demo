package Hisign.dao;

import java.util.List;

import Hisign.entity.Rlfw;

public interface RlfwDao {
	public void add(Rlfw rlfwadd);   
	/**
	 * 根据借用人、借用时间查询
	 * @param rlfw_use_peo_name
	 * 借用人
	 * @param rlfw_act_borr_time
	 * 借用时间
	 * @return
	 */
	public List<Rlfw> user_select(String rlfw_use_peo_name,String rlfw_act_borr_time);
	
	public List<Rlfw> shenpi_select(String rlfw_app_peo_name);
	
	public void shenpi_jieguo(Rlfw rlfw_shenpi_jieguo);   
}
