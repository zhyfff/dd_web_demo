package Hisign.Service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Hisign.Service.RlfwService;
import Hisign.dao.RlfwDao;
import Hisign.entity.Rlfw;




@Service
public class RlfwServiceImpl implements RlfwService{
	@Autowired
    private RlfwDao rlfwdao;

	@Override
	public Rlfw add(Rlfw rlfwadd) {
		rlfwdao.add(rlfwadd);
		return null;
	}

	@Override
	public List<Rlfw> user_select(String rlfw_use_peo_name,String rlfw_act_borr_time) {
//		Rlfw a =rlfwdao.select(rlfw_use_peo_name,rlfw_act_borr_time);
		return rlfwdao.user_select(rlfw_use_peo_name,rlfw_act_borr_time);
	}

	@Override
	public List<Rlfw> shenpi_select(String rlfw_app_peo_name) {
		return rlfwdao.shenpi_select(rlfw_app_peo_name);
	}

	@Override
	public Rlfw shenpi_jieguo(Rlfw rlfw_shenpi_jieguo) {
		rlfwdao.shenpi_jieguo(rlfw_shenpi_jieguo);
		return null;
	}
}
