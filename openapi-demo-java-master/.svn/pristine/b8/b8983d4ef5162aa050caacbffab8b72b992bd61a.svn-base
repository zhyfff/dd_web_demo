package Hisign.Service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Hisign.Service.HrService;
import Hisign.dao.HrDao;
import Hisign.entity.HrContractInfor;

@Service
public class HrServiceImpl implements HrService{
	@Autowired
	private HrDao hrDao;

	@Override
	public List<HrContractInfor> insert(HrContractInfor hrContractInfor) {
		return hrDao.insert(hrContractInfor);
	}

	@Override
	public List<HrContractInfor> AuditToDataBase(HrContractInfor hrContractInfor) {
		return hrDao.AuditToDataBase(hrContractInfor);
	}

	@Override
	public List<HrContractInfor> ApplyToDataBase(HrContractInfor hrContractInfor) {
		return hrDao.ApplyToDataBase(hrContractInfor);
	}

	@Override
	public List<HrContractInfor> BackToDateBase(HrContractInfor hrContractInfor) {
		return hrDao.BackToDateBase(hrContractInfor);
	}

	@Override
	public List<HrContractInfor> FinalToDateBase(HrContractInfor hrContractInfor) {
		return hrDao.FinalToDateBase(hrContractInfor);
	}

	@Override
	public List<HrContractInfor> searchNeedBack(String uesrid) {
		return hrDao.searchNeedBack(uesrid);
	}

	@Override
	public List<HrContractInfor> searchInfor(String searchkey) {
		return hrDao.searchInfor(searchkey);
	}

}
