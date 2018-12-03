package Hisign.Service.serviceImpl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import Hisign.Service.OfficeService;
import Hisign.dao.OfficeDao;
import Hisign.entity.ApplyCarInfor;
import Hisign.entity.ApplyStampInfor;
import Hisign.entity.BusinessCardInfor;
import Hisign.entity.CourierInfor;
import Hisign.entity.StampCertificateInfor;
import Hisign.entity.Car;

public class OfficeServiceImpl implements OfficeService{

	@Autowired
	private OfficeDao officeDao;
	
	@Override
	public List<CourierInfor> SaveCourierNotice(CourierInfor courier) {
		// TODO Auto-generated method stub
		return officeDao.SaveCourierNotice(courier);
	}

	@Override
	public List<CourierInfor> SelectCourierNotice(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.SelectCourierNotice(searchkey);
	}

	@Override
	public List<CourierInfor> MyCourier(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.MyCourier(searchkey);
	}

	@Override
	public List<CourierInfor> SaveMyCourier(CourierInfor courier) {
		// TODO Auto-generated method stub
		return officeDao.SaveMyCourier(courier);
	}

	@Override
	public List<CourierInfor> SearchRelq() {
		// TODO Auto-generated method stub
		return officeDao.SearchRelq();
	}

	@Override
	public List<CourierInfor> SaverRelq(CourierInfor courier) {
		// TODO Auto-generated method stub
		return officeDao.SaverRelq(courier);
	}

	
	/*********************************************************/
	
	@Override
	public List<Car> getcarlist() {
		// TODO Auto-generated method stub
		return officeDao.getcarlist();
	}
	
	@Override
	public List<Car> updateCar(String state,String license_plate) {
		// TODO Auto-generated method stub
		return officeDao.updateCar( state,license_plate);
	}
	
	@Override
	public List<ApplyCarInfor> SaveApplyCar(ApplyCarInfor applyCarInfor) {
		// TODO Auto-generated method stub
		return officeDao.SaveApplyCar(applyCarInfor);
	}

	@Override
	public List<ApplyCarInfor> selectApplyCar(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.selectApplyCar(searchkey);
	}

	@Override
	public List<ApplyCarInfor> SaveApplyCarAudit(ApplyCarInfor applyCarInfor) {
		// TODO Auto-generated method stub
		return officeDao.SaveApplyCarAudit(applyCarInfor);
	}

	@Override
	public List<ApplyCarInfor> selectMyApplyCar(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.selectMyApplyCar(searchkey);
	}

	@Override
	public List<ApplyCarInfor> SaveApplyCarAfterEv(ApplyCarInfor applyCarInfor) {
		// TODO Auto-generated method stub
		return officeDao.SaveApplyCarAfterEv(applyCarInfor);
	}

	@Override
	public List<ApplyCarInfor> selectMyCar(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.selectMyCar(searchkey);
	}

	@Override
	public List<ApplyCarInfor> sureBackApplyCar(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.sureBackApplyCar(searchkey);
	}

	@Override
	public List<ApplyCarInfor> SaveApplyCarBack(ApplyCarInfor applyCarInfor) {
		// TODO Auto-generated method stub
		return officeDao.SaveApplyCarBack(applyCarInfor);
	}

	@Override
	public List<ApplyCarInfor> SelectApplyCarList(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.SelectApplyCarList(searchkey);
	}

	@Override
	public List<ApplyCarInfor> selectApplyCardetail(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.selectApplyCardetail(searchkey);
	}

	/*********************************************************************/
	@Override
	public List<BusinessCardInfor> SaveApplyBusinessCard(BusinessCardInfor businessCardInfor) {
		// TODO Auto-generated method stub
		return officeDao.SaveApplyBusinessCard(businessCardInfor);
	}

	@Override
	public List<BusinessCardInfor> selectMyAuditBusinessCard(String audit_name) {
		// TODO Auto-generated method stub
		return officeDao.selectMyAuditBusinessCard(audit_name);
	}

	@Override
	public List<BusinessCardInfor> send2DeskBusinessCard(BusinessCardInfor businessCardInfor) {
		// TODO Auto-generated method stub
		return officeDao.send2DeskBusinessCard(businessCardInfor);
	}

	@Override
	public List<BusinessCardInfor> selectNeedCreateBusinessCard(String desk) {
		// TODO Auto-generated method stub
		return officeDao.selectNeedCreateBusinessCard(desk);
	}

	@Override
	public List<BusinessCardInfor> sendCreateMessage(BusinessCardInfor businessCardInfor) {
		// TODO Auto-generated method stub
		return officeDao.sendCreateMessage(businessCardInfor);
	}

	@Override
	public List<BusinessCardInfor> selectMyBusinessCard(String myname) {
		// TODO Auto-generated method stub
		return officeDao.selectMyBusinessCard(myname);
	}

	@Override
	public List<BusinessCardInfor> saveBEvBcard(BusinessCardInfor businessCardInfor) {
		// TODO Auto-generated method stub
		return officeDao.saveBEvBcard(businessCardInfor);
	}

	@Override
	public List<BusinessCardInfor> selectBusinessCard(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.selectBusinessCard(searchkey);
	}

	/**********************************************************/
	@Override
	public List<StampCertificateInfor> selectAllstamp() {
		// TODO Auto-generated method stub
		return officeDao.selectAllstamp();
	}

	@Override
	public List<StampCertificateInfor> UpdateStamp(StampCertificateInfor stampCertificateInfor) {
		// TODO Auto-generated method stub
		return officeDao.UpdateStamp(stampCertificateInfor);
	}

	@Override
	public List<ApplyStampInfor> saveApplyStamp(ApplyStampInfor applyStampInfor) {
		// TODO Auto-generated method stub
		return officeDao.saveApplyStamp(applyStampInfor);
	}

	@Override
	public List<ApplyStampInfor> selectNeedAdutistamp(String audit_name) {
		// TODO Auto-generated method stub
		return officeDao.selectNeedAdutistamp(audit_name);
	}

	@Override
	public List<ApplyStampInfor> toManger(ApplyStampInfor applyStampInfor) {
		// TODO Auto-generated method stub
		return officeDao.toManger(applyStampInfor);
	}

	@Override
	public List<ApplyStampInfor> selectAuditedApplyStamp(String manager) {
		// TODO Auto-generated method stub
		return officeDao.selectAuditedApplyStamp(manager);
	}

	@Override
	public List<ApplyStampInfor> toIssue(ApplyStampInfor applyStampInfor) {
		// TODO Auto-generated method stub
		return officeDao.toIssue(applyStampInfor);
	}

	@Override
	public List<StampCertificateInfor> changeStampState(StampCertificateInfor stampCertificateInfor) {
		// TODO Auto-generated method stub
		return officeDao.changeStampState(stampCertificateInfor);
	}

	@Override
	public List<ApplyStampInfor> selectMyStamp(String userName) {
		// TODO Auto-generated method stub
		return officeDao.selectMyStamp(userName);
	}

	@Override
	public List<ApplyStampInfor> toReturnStamp(ApplyStampInfor applyStampInfor) {
		// TODO Auto-generated method stub
		return officeDao.toReturnStamp(applyStampInfor);
	}

	@Override
	public List<ApplyStampInfor> selectAllStampI() {
		// TODO Auto-generated method stub
		return officeDao.selectAllStampI();
	}

	@Override
	public List<ApplyStampInfor> SureReturnStampApply(ApplyStampInfor applyStampInfor) {
		// TODO Auto-generated method stub
		return officeDao.SureReturnStampApply(applyStampInfor);
	}

	@Override
	public List<ApplyStampInfor> searchStampApplyI(String searchkey) {
		// TODO Auto-generated method stub
		return officeDao.searchStampApplyI(searchkey);
	}

	

	
	
	

}
