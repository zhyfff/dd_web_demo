package Hisign.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import Hisign.entity.RepairInfor;
@Repository
public interface RepairDao {
	 public List<RepairInfor> Insert(RepairInfor repair);
	 public List<RepairInfor> Recive(String searchname);
	 public List<RepairInfor> Submitin(RepairInfor repair);
	 public List<RepairInfor> repairing(String searchname);
	 public List<RepairInfor> toEvaluation(RepairInfor repair);
	 public List<RepairInfor> Myrepairhis(String searchname);
	 public List<RepairInfor> SearchRepaired(String searchname);
	 public List<RepairInfor> nametime(RepairInfor repair);
	 public List<RepairInfor> namedate(RepairInfor repair);
	 public List<RepairInfor> fortime(String time);
	 public List<RepairInfor> fordate(RepairInfor repair);
}
