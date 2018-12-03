package Hisign.Service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Hisign.Service.RepairService;
import Hisign.dao.RepairDao;
import Hisign.entity.RepairInfor;
@Service
public class RepairServiceImpl implements RepairService{
    @Autowired
	private RepairDao repairDao;
	@Override
	public List<RepairInfor> Insert(RepairInfor repair) {
		// TODO Auto-generated method stub
		return repairDao.Insert(repair);
	}
	@Override
	public List<RepairInfor> Recive(String searchname) {
		// TODO Auto-generated method stub
		return repairDao.Recive(searchname);
	}
	@Override
	public List<RepairInfor> Submitin(RepairInfor repair) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<RepairInfor> repairing(String searchname) {
		// TODO Auto-generated method stub
		return repairDao.repairing(searchname);
	}
	@Override
	public List<RepairInfor> toEvaluation(RepairInfor repair) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<RepairInfor> Myrepairhis(String searchname) {
		// TODO Auto-generated method stub
		return repairDao.Myrepairhis(searchname);
	}
	@Override
	public List<RepairInfor> SearchRepaired(String searchname) {
		// TODO Auto-generated method stub
		return repairDao.SearchRepaired(searchname);
	}

	@Override
	public List<RepairInfor> fortime(String time) {
		// TODO Auto-generated method stub
		return repairDao.fortime(time);
	}
	@Override
	public List<RepairInfor> nametime(RepairInfor repair) {
		// TODO Auto-generated method stub
		return repairDao.nametime(repair);
	}
	@Override
	public List<RepairInfor> namedate(RepairInfor repair) {
		// TODO Auto-generated method stub
		return repairDao.namedate(repair);
	}
	@Override
	public List<RepairInfor> fordate(RepairInfor repair) {
		// TODO Auto-generated method stub
		return repairDao.fordate(repair);
	}


}
