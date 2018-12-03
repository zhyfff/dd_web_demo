package Hisign.Service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Hisign.Service.ContractService;
import Hisign.dao.ContractDao;
import Hisign.entity.ContractInfor;


@Service
public class ContractServiceImpl implements ContractService{
	@Autowired
    private ContractDao contractDao;

	@Override
	public List<ContractInfor> Insert(ContractInfor contract) {
//		return null;
		// TODO Auto-generated method stub
		return contractDao.Insert(contract);
	}

	@Override
	public List<ContractInfor> search(String searchkey) {
//		return null;
		// TODO Auto-generated method stub
		return contractDao.search(searchkey);
	}

	@Override
	public List<ContractInfor> auditsearch(String searchkey) {
		// TODO Auto-generated method stub
		return contractDao.auditsearch(searchkey);
	}

	@Override
	public List<ContractInfor> audittobase(ContractInfor contract) {
		// TODO Auto-generated method stub
		return contractDao.audittobase(contract);
	}

	@Override
	public List<ContractInfor> applysearch(String searchkey) {
		// TODO Auto-generated method stub
		return contractDao.applysearch(searchkey);
	}

	@Override
	public List<ContractInfor> applytobase(ContractInfor contract) {
		// TODO Auto-generated method stub
		return contractDao.applytobase(contract);
	}

	@Override
	public List<ContractInfor> backsearch(String searchkey) {
		// TODO Auto-generated method stub
		return contractDao.backsearch(searchkey);
	}

	@Override
	public List<ContractInfor> backtobase(ContractInfor contract) {
		// TODO Auto-generated method stub
		return contractDao.backtobase(contract);
	}

	@Override
	public List<ContractInfor> finalsearch(String searchkey) {
		// TODO Auto-generated method stub
		return contractDao.finalsearch(searchkey);
	}

	@Override
	public List<ContractInfor> finaltobase(ContractInfor contract) {
		// TODO Auto-generated method stub
		return contractDao.finaltobase(contract);
	}


}
