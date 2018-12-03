package Hisign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import Hisign.entity.ContractInfor;
/**
 * 合同借用
 * @author Administrator
 *
 */
@Repository
public interface ContractDao {
    public List<ContractInfor> Insert(ContractInfor contract);//提交申请
    public List<ContractInfor> search(@Param("searchkey")String searchkey);//查询申请
    public List<ContractInfor> auditsearch(@Param("searchkey")String searchkey);//我的审批
    public List<ContractInfor> audittobase(ContractInfor contract);//提交审批入库
    public List<ContractInfor> applysearch(@Param("searchkey")String searchkey);//我的申请
    public List<ContractInfor> applytobase(ContractInfor contract);//评价申请入库
    public List<ContractInfor> backsearch(@Param("searchkey")String searchkey);//查看未归还合同
    public List<ContractInfor> backtobase(ContractInfor contract);//归还合同入库
    public List<ContractInfor> finalsearch(@Param("searchkey")String searchkey);//查看归还合同
    public List<ContractInfor> finaltobase(ContractInfor contract);//归还合同最终入库
    
}
