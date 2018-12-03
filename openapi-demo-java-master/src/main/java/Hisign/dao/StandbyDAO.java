package Hisign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import Hisign.entity.StandbyInfor;

@Repository
public interface StandbyDAO {
	 public List<StandbyInfor> Insert(StandbyInfor standby);
	 public List<StandbyInfor> search(String selectdate);
	 public List<StandbyInfor> searchmysp(String searchname);
	 public List<StandbyInfor> toresult(StandbyInfor stanby);
	 public List<StandbyInfor> searchsphis(String searchname);
	 public List<StandbyInfor> searchmyapling(String searchname);
	 public List<StandbyInfor> toeva(StandbyInfor standby);
	 public List <StandbyInfor> todone(StandbyInfor standby);
     public List <StandbyInfor> searchaplhis(String searchname);
     
}
