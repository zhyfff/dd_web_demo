package Hisign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

@Repository
public interface ProcessDao {

	public List<ProcessInfo> seachTodoMessage(@Param("auditname") String auditname);
	public List<ProcessInfo> seachHavedealMessage(@Param("auditname") String auditname);
	public List<CourierInfor> getCourierMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<ContractInfor> getContractMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<ApplyCarInfor> getApplyCarMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<BusinessCardInfor> getBusinessCardMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<ApplyStampInfor> getApplyStampMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<HrContractInfor> getApplyHrMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<ConsumablePurInfor> getApplyConsumabkePurInforMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<EquipBorrowInfor> getApplyEquipmentBorrowInforMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public List<ConsumableBorrowInfor> getApplyConsumambBorrowInforMessageDetail(@Param("dcnumber") String dcnumber,@Param("type") String type);
	public String insert(@Param("dcnumber") String dcnumber,@Param("name") String name,@Param("audit_name") String audit_name,@Param("type") String type);
	public String insert2(@Param("dcnumber") String dcnumber,@Param("name") String name,@Param("audit_name") String audit_name,@Param("type") String type,@Param("name_id") String name_id,@Param("spid") String spid);
	public String updateState(@Param("dcnumber") String dcnumber);
	public String updateManager(@Param("dcnumber")String dcnumber,@Param("manager_id") String manager_id ,@Param("manager") String manager);
	public int searchPointMsg(@Param("searchkey") String searchkey,@Param("name")String name);//查询待办的信息数量
	public int MyContractMsgPoint(@Param("name") String name);//查询我借用的合同数量
	public int ConfirmToreceiveCourierPointMsg(@Param("name") String name);//查询需要领取确认的快递信息数量
	public int getMyCarPointMsg(@Param("name") String name);//查询我的车辆借用信息数量
	public int getMyBusinessCardPointMsg(@Param("name") String name);//查询我的名片制作信息数量
	public int getCreateCardPointMsg(@Param("name") String name);//查询需要制作的名片信息数量
	public int getMyStampPonitMsg(@Param("name") String name);//查询我的印章证照信息数量
	public int getMyHrContractPointMsg(@Param("userid") String userid);//查询人力服务档案借用信息数量
	public int getMyEBorrowPointMsg(@Param("userid") String userid);//查询设备借用信息数量
	
}
