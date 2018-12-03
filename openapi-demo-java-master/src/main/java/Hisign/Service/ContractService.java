package Hisign.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import Hisign.entity.ContractInfor;

public interface ContractService {
	public List<ContractInfor> Insert(ContractInfor contract);
    public List<ContractInfor> search(String searchkey);
    public List<ContractInfor> auditsearch(String searchkey);
    public List<ContractInfor> audittobase(ContractInfor contract);//提交审批入库
    public List<ContractInfor> applysearch(String searchkey);//我的申请
    public List<ContractInfor> applytobase(ContractInfor contract);//评价申请服务入库
    public List<ContractInfor> backsearch(String searchkey);//查看未归还合同
    public List<ContractInfor> backtobase(ContractInfor contract);//归还合同入库
    public List<ContractInfor> finalsearch(String searchkey);//查看归还合同
    public List<ContractInfor> finaltobase(ContractInfor contract);//归还合同最终入库

}
