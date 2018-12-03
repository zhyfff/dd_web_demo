package Hisign.Service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Hisign.dao.ITDao;
import Hisign.entity.ConsumableBorrowInfor;
import Hisign.entity.ConsumableListInfor;
import Hisign.entity.ConsumablePurInfor;
import Hisign.entity.EquipBorrowInfor;
import Hisign.entity.FixedAssetsInfor;
@Service
public class ITServiceImpl implements ITDao{
	@Autowired
	private ITDao itDao;

	@Override
	public List<ConsumablePurInfor> consu_insert(ConsumablePurInfor consumablePurInfor) {
		return itDao.consu_insert(consumablePurInfor);
	}

	@Override
	public List<ConsumablePurInfor> consu_audit(ConsumablePurInfor consumablePurInfor) {
		return itDao.consu_audit(consumablePurInfor);
	}

	@Override
	public List<ConsumableListInfor> addNewCon(ConsumableListInfor consumableListInfor) {
		return itDao.addNewCon(consumableListInfor);
	}

	@Override
	public List<ConsumableListInfor> getConsumableInfor(String type_num) {
		return itDao.getConsumableInfor(type_num);
	}

	@Override
	public List<ConsumableListInfor> UpdateConsumableInfor(ConsumableListInfor consumableListInfor) {
		return itDao.UpdateConsumableInfor(consumableListInfor);
	}

	@Override
	public List<ConsumableListInfor> EndApplyConsu(String dcnumber) {
		return itDao.EndApplyConsu(dcnumber);
	}

	@Override
	public List<ConsumablePurInfor> searchConsumApply(String searchkey) {
		return itDao.searchConsumApply(searchkey);
	}

	/*******************************************************************************************///TODO
	@Override
	public List<EquipBorrowInfor> eborrow_insert(EquipBorrowInfor equipBorrowInfor) {
		return itDao.eborrow_insert(equipBorrowInfor);
	}

	@Override
	public List<EquipBorrowInfor> eborrow_audit(EquipBorrowInfor equipBorrowInfor) {
		return itDao.eborrow_audit(equipBorrowInfor);
	}

	@Override
	public List<EquipBorrowInfor> getMyEboroowInfor(String userid) {
		return itDao.getMyEboroowInfor(userid);
	}

	@Override
	public List<EquipBorrowInfor> eborrow_return(EquipBorrowInfor equipBorrowInfor) {
		return itDao.eborrow_return(equipBorrowInfor);
	}

	@Override
	public List<EquipBorrowInfor> eborrow_setEva(EquipBorrowInfor equipBorrowInfor) {
		return itDao.eborrow_setEva(equipBorrowInfor);
	}

	@Override
	public List<EquipBorrowInfor> searchEBorrowApply(String searchkey) {
		return itDao.searchEBorrowApply(searchkey);
	}

	
	/***********************************************************************************************///TODO
	@Override
	public List<ConsumableBorrowInfor> Cborrow_insert(ConsumableBorrowInfor consumableBorrowInfor) {
		return itDao.Cborrow_insert(consumableBorrowInfor);
	}

	@Override
	public List<ConsumableBorrowInfor> ConsuBorrowAudit(ConsumableBorrowInfor consumableBorrowInfor) {
		return itDao.ConsuBorrowAudit(consumableBorrowInfor);
	}

	@Override
	public List<ConsumableBorrowInfor> ConsuBorrowIssu(ConsumableBorrowInfor consumableBorrowInfor) {
		return itDao.ConsuBorrowIssu(consumableBorrowInfor);
	}

	@Override
	public List<ConsumableBorrowInfor> ConsuEva(ConsumableBorrowInfor consumableBorrowInfor) {
		return itDao.ConsuEva(consumableBorrowInfor);
	}

	@Override
	public List<ConsumableListInfor> getgetConsumableNumList(String recipients_number) {
		return itDao.getgetConsumableNumList(recipients_number);
	}

	@Override
	public List<ConsumableListInfor> ChangeConsumableNumAndP(String recipients_number, String l_cnum, String l_tup) {
		return itDao.ChangeConsumableNumAndP(recipients_number, l_cnum, l_tup);
	}

	/**********************************************************************************///TODO
	@Override
	public List<FixedAssetsInfor> FixedAssets_insert(FixedAssetsInfor fixedAssetsInfor) {
		return itDao.FixedAssets_insert(fixedAssetsInfor);
	}

}
