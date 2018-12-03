package Hisign.Service.serviceImpl;

import java.util.List;

import Hisign.dao.ProcessDao;
import Hisign.entity.ApplyCarInfor;
import Hisign.entity.ApplyStampInfor;
import Hisign.entity.BusinessCardInfor;
import Hisign.entity.ConsumableBorrowInfor;
import Hisign.entity.ConsumablePurInfor;
import Hisign.entity.ContractInfor;
import Hisign.entity.CourierInfor;
import Hisign.entity.EquipBorrowInfor;
import Hisign.entity.HrContractInfor;
import Hisign.entity.ProcessInfo;

public class ProcessServiceImpl implements ProcessDao{
	
	private ProcessDao processDao;

	@Override
	public List<ProcessInfo> seachTodoMessage(String auditname) {
		return processDao.seachTodoMessage(auditname);
	}

	@Override
	public List<ProcessInfo> seachHavedealMessage(String auditname) {
		return processDao.seachHavedealMessage(auditname);
	}

	@Override
	public List<CourierInfor> getCourierMessageDetail(String dcnumber, String type) {
		return processDao.getCourierMessageDetail(dcnumber, type);
	}

	@Override
	public String updateState(String dcnumber) {
		return processDao.updateState(dcnumber);
	}

	@Override
	public String insert(String dcnumber, String name, String audit_name, String type) {
		return processDao.insert(dcnumber, name, audit_name, type);
	}

	@Override
	public int searchPointMsg(String searchkey,String name) {
		return processDao.searchPointMsg(searchkey,name);
	}

	@Override
	public int ConfirmToreceiveCourierPointMsg(String name) {
		return processDao.ConfirmToreceiveCourierPointMsg(name);
	}

	@Override
	public List<ContractInfor> getContractMessageDetail(String dcnumber, String type) {
		return processDao.getContractMessageDetail(dcnumber, type);
	}

	@Override
	public int MyContractMsgPoint(String name) {
		return processDao.MyContractMsgPoint(name);
	}

	@Override
	public List<ApplyCarInfor> getApplyCarMessageDetail(String dcnumber, String type) {
		return processDao.getApplyCarMessageDetail(dcnumber, type);
	}

	@Override
	public int getMyCarPointMsg(String name) {
		return processDao.getMyCarPointMsg(name);
	}

	@Override
	public List<BusinessCardInfor> getBusinessCardMessageDetail(String dcnumber, String type) {
		return processDao.getBusinessCardMessageDetail(dcnumber, type);
	}

	@Override
	public int getMyBusinessCardPointMsg(String name) {
		return processDao.getMyBusinessCardPointMsg(name);
	}

	@Override
	public int getCreateCardPointMsg(String name) {
		return processDao.getCreateCardPointMsg(name);
	}

	@Override
	public List<ApplyStampInfor> getApplyStampMessageDetail(String dcnumber, String type) {
		return processDao.getApplyStampMessageDetail(dcnumber, type);
	}
	
	@Override
	public List<ConsumablePurInfor> getApplyConsumabkePurInforMessageDetail(String dcnumber, String type) {
		return processDao.getApplyConsumabkePurInforMessageDetail(dcnumber, type);
	}
	
	@Override
	public List<EquipBorrowInfor> getApplyEquipmentBorrowInforMessageDetail(String dcnumber, String type) {
		return processDao.getApplyEquipmentBorrowInforMessageDetail(dcnumber, type);
	}

	@Override
	public List<ConsumableBorrowInfor> getApplyConsumambBorrowInforMessageDetail(String dcnumber, String type) {
		return processDao.getApplyConsumambBorrowInforMessageDetail(dcnumber, type);
	}
	
	@Override
	public int getMyStampPonitMsg(String name) {
		return processDao.getMyStampPonitMsg(name);
	}

	@Override
	public String updateManager(String dcnumber, String admins_id,String manager) {
		return processDao.updateManager(dcnumber,admins_id, manager);
	}

	@Override
	public String insert2(String dcnumber, String name, String audit_name, String type, String name_id,String spid) {
		return processDao.insert2(dcnumber, name, audit_name, type, name_id,spid);
	}

	@Override
	public List<HrContractInfor> getApplyHrMessageDetail(String dcnumber, String type) {
		return processDao.getApplyHrMessageDetail(dcnumber, type);
	}

	@Override
	public int getMyHrContractPointMsg(String userid) {
		return processDao.getMyHrContractPointMsg(userid);
	}

	@Override
	public int getMyEBorrowPointMsg(String userid) {
		return processDao.getMyEBorrowPointMsg(userid);
	}

	

	

	

	

}
