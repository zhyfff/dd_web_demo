package Hisign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import Hisign.entity.UserInfor;

public interface SaveUserIDao {
	
	public List<UserInfor> saveinfor(UserInfor userinfor);//保存用户信息
	public List<UserInfor> updatepwd(@Param("borrowid") String borrowid,@Param("borrowname") String borrowname,@Param("pwd") String pwd);//注册添加密码
	public String searchpwd(@Param("gh") String gh, @Param("name") String name);//查询是否注册
	public List<UserInfor> searchpwdLogin(@Param("gh") String gh);//网页登录
}
