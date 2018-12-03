package Hisign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import Hisign.entity.HrContractInfor;

/**
 * 人力服务
 * @author Administrator
 *
 */
@Repository
public interface HrDao {

	public List<HrContractInfor> insert(HrContractInfor hrContractInfor);//保存申请
	public List<HrContractInfor> AuditToDataBase(HrContractInfor hrContractInfor);//审核完毕保存
	public List<HrContractInfor> ApplyToDataBase(HrContractInfor hrContractInfor);//评论完保存
	public List<HrContractInfor> BackToDateBase(HrContractInfor hrContractInfor);//归还文件
	public List<HrContractInfor> FinalToDateBase(HrContractInfor hrContractInfor);//确认归还
	public List<HrContractInfor> searchNeedBack(@Param("userid") String uesrid);//查询我已借用的档案数据
	public List<HrContractInfor> searchInfor(@Param("searchkey") String searchkey);//查询数据
 
}
