package Hisign.Service;

import java.util.List;

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

public interface ProcessService {

	public List<ProcessInfo> seachTodoMessage(String auditname);
	public List<ProcessInfo> seachHavedealMessage(String auditname);
	public List<CourierInfor> getCourierMessageDetail(String dcnumber,String type);
	public List<ContractInfor> getContractMessageDetail(String dcnumber,String type);
	public List<ApplyCarInfor> getApplyCarMessageDetail(String dcnumber,String type);
	public List<BusinessCardInfor> getBusinessCardMessageDetail(String dcnumber,String type);
	public List<ApplyStampInfor> getApplyStampMessageDetail(String dcnumber,String type);
	public List<HrContractInfor> getApplyHrMessageDetail(String dcnumber,String type);
	public List<ConsumablePurInfor> getApplyConsumabkePurInforMessageDetail(String dcnumber,String type);
	public List<EquipBorrowInfor> getApplyEquipmentBorrowInforMessageDetail(String dcnumber,String type);
	public List<ConsumableBorrowInfor> getApplyConsumambBorrowInforMessageDetail(String dcnumber,String type);
	public String insert(String dcnumber,String name,String audit_name,String type);
	public String insert2(String dcnumber, String name, String audit_name, String type, String name_id,String spid);
	public String updateState(String dcnumber);
	public String updateManager(String dcnumber, String manager_id , String manager);
	public int searchPointMsg(String searchkey,String name);
	public int MyContractMsgPoint(String name);//查询我借用的合同数量
	public int ConfirmToreceiveCourierPointMsg(String name);//查询需要领取确认的快递信息数量
	public int getMyCarPointMsg(String name);//查询我的车辆借用信息数量
	public int getMyBusinessCardPointMsg(String name);//查询我的名片制作信息数量
	public int getCreateCardPointMsg(String name);//查询需要制作的名片信息数量
	public int getMyStampPonitMsg(String name);//查询我的印章证照信息数量
	public int getMyHrContractPointMsg(String userid);//查询人力服务档案借用信息数量
	public int getMyEBorrowPointMsg(String userid);//查询设备借用信息数量

}
