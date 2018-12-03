package Hisign.controller.hrservices;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Hisign.controller.process.AesEncryptUtil;
import Hisign.dao.HrDao;
import Hisign.dao.ProcessDao;
import Hisign.entity.HrContractInfor;
import Hisign.entity.UserInfor;

@Controller("hrservicesController")
public class hrservicesController {
	
	ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	final  AesEncryptUtil aesEncryptUtil = new AesEncryptUtil();
	/**
	 * 跳转到人力中心首页
	 * @param request
	 * @return
	 */
	@RequestMapping("HrServices/hrservices")
	public ModelAndView tohrservices(HttpServletRequest request,ModelAndView mav){
		 
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject js = JSONObject.parseObject(userjson);
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/hrservices/hrservices");
		return mav;
	}
	
	
	/**
	 * 跳转到档案申请
	 * @param reqeust
	 * @return
	 */
	@RequestMapping("HrServices/Apply")
	public ModelAndView toApply(HttpServletRequest reqeust){
		return new ModelAndView("redirect:/dingdingweb/HUI/hrservices/apply.jsp");
	}
	
	/**
	 * 保存申请信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/HrServices/saveApply")
	public void getHrApplyInfor(HttpServletRequest request,HttpServletResponse response){
		String dcnumber="6"+String.valueOf(System.currentTimeMillis());
		String userId=request.getParameter("userId");
		String borrowid=request.getParameter("borrowid");
		String borrowname=request.getParameter("borrowname");
		String borrowde=request.getParameter("borrowde");
		String contractName=request.getParameter("contractName");
		String reason=request.getParameter("reason");
		String abacktime=request.getParameter("abacktime");
		String audit_name=request.getParameter("audit-name");
		if (audit_name.contains("(")) {
			audit_name= audit_name.substring(0, audit_name.indexOf("(")).trim();
		}
		String spid=request.getParameter("spid");
		HrContractInfor hrContractInfor =new HrContractInfor();
		hrContractInfor.setDcnumber(dcnumber);
		hrContractInfor.setUserId(userId);
		hrContractInfor.setBorrowid(borrowid);
		hrContractInfor.setBorrowname(borrowname);
		hrContractInfor.setBorrowde(borrowde);
		hrContractInfor.setContractName(contractName);
		hrContractInfor.setReason(reason);
		hrContractInfor.setAbacktime(abacktime);
		hrContractInfor.setAudit_name(audit_name);
		hrContractInfor.setSpid(spid);
		
		boolean ret =false;
		HrDao hrdao = ctx.getBean(HrDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);
		
		try {
			hrdao.insert(hrContractInfor);
		} catch (Exception e1) {
			try {			
				PrintWriter out = response.getWriter();
				out = response.getWriter();
				out.print("失败");
				out.flush();
				out.close();
//				response.getWriter().append("成功");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ret=true;
			e1.printStackTrace();
		}
		if (ret==false) {
			try {	
				processDao.insert2(dcnumber, borrowname, audit_name, "人力档案借用",userId,spid);
				PrintWriter out = response.getWriter();
				out = response.getWriter();
				out.print("成功");
				out.flush();
				out.close();
//				response.getWriter().append("成功");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 审批后保存
	 * @param request
	 * @return
	 */
	@RequestMapping("HrServices/auditToBase")
	public ModelAndView AuditToDataBase(HttpServletRequest request){
		String dcnumber = request.getParameter("dcnumber");
		String spopinions = request.getParameter("spopinions");
		String spdate = request.getParameter("spdate");
		String abdate = request.getParameter("abdate");
		String audittype = request.getParameter("radio");
		
		HrContractInfor hrContractInfor = new HrContractInfor();
		hrContractInfor.setDcnumber(dcnumber);
		hrContractInfor.setSpopinions(spopinions);
		hrContractInfor.setSpdate(spdate);
		hrContractInfor.setAbdate(abdate);
		hrContractInfor.setAudittype(audittype);
		HrDao hrDao = ctx.getBean(HrDao.class);
		hrDao.AuditToDataBase(hrContractInfor);
		
		return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
	}
	
	
	/**
	 * 评论后保存
	 * @param request
	 * @return
	 */
	@RequestMapping("HrServices/applyToBasse")
	public ModelAndView ApplyToDataBase(HttpServletRequest request){
		String dcnumber = request.getParameter("dcnumber");
		String evaluation = request.getParameter("evaluation");
		String note = request.getParameter("note");
		HrContractInfor hrContractInfor = new HrContractInfor();
		hrContractInfor.setDcnumber(dcnumber);
		hrContractInfor.setEvaluation(evaluation);
		hrContractInfor.setNote(note);
		
		HrDao hrDao = ctx.getBean(HrDao.class);
		hrDao.ApplyToDataBase(hrContractInfor);
		
		return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
	}
	
	
	/**
	 * 归还文件
	 * @param request
	 * @return
	 */
	@RequestMapping("HrServices/backToBase")
	public ModelAndView BackToDateBase(HttpServletRequest request){
		String dcnumber = request.getParameter("dcnumber");
		HrContractInfor hrContractInfor = new HrContractInfor();
		hrContractInfor.setDcnumber(dcnumber);
		HrDao hrDao = ctx.getBean(HrDao.class);
		hrDao.BackToDateBase(hrContractInfor);
		return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
	}
	
	/**
	 * 确认归还
	 * @param request
	 * @return
	 */
	@RequestMapping("HrServices/finalToBase")
	public ModelAndView FinalToDateBase(HttpServletRequest request){
		String dcnumber = request.getParameter("dcnumber");
		HrContractInfor hrContractInfor = new HrContractInfor();
		hrContractInfor.setDcnumber(dcnumber);
		HrDao hrDao = ctx.getBean(HrDao.class);
		hrDao.FinalToDateBase(hrContractInfor);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);
		processDao.updateState(dcnumber);
		return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
	}
	
	
	/**
	 * 跳转到我的人力合同借用
	 * @param request
	 * @return
	 */
	@RequestMapping("HrServices/myContract")
	public ModelAndView ToMyContract(HttpServletRequest request,ModelAndView mav){
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject js = JSONObject.parseObject(userjson);
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/hrservices/mycontract");
		return mav;
	}
	
	
	/**
	 * 获取需要归还的合同信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/HrServices/getBackContract")
	public void getBackContractInfor(HttpServletRequest request ,HttpServletResponse response){
		String userid = request.getParameter("userid");
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<HrContractInfor> bList = searchNeedBack(userid);
		PageInfo<HrContractInfor> pageInfo = new PageInfo<HrContractInfor>(bList);
		JSONObject re = new JSONObject();
		re.put("blist", pageInfo.getList());
		re.put("pageInfo", pageInfo);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(re);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
     * 查询未归还合同
     * 
     * @param searchkey
     * @return
     */
	public List<HrContractInfor> searchNeedBack(String userid){
	    //获得bean
	    HrDao hrDao = ctx.getBean(HrDao.class);
	    List<HrContractInfor> contractlist = hrDao.searchNeedBack(userid);
		return contractlist;
	}

	/**
	 * 跳转到搜索页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/HrServices/toSearch")
	public ModelAndView ToSearch(HttpServletRequest request ,HttpServletResponse response,ModelAndView mav){
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject js = JSONObject.parseObject(userjson);
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/hrservices/searchcontract");
		return mav;
		
	}
	
	/**
	 * 查询数据
	 * @param request
	 * @param response
	 */
	@RequestMapping("/HrServices/getContractApplyinfor")
	public void getHrContractInfor(HttpServletRequest request ,HttpServletResponse response){
		String searchkey = request.getParameter("searchkey");
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<HrContractInfor> bList = searchInfor(searchkey);
		PageInfo<HrContractInfor> pageInfo = new PageInfo<HrContractInfor>(bList);
		JSONObject re = new JSONObject();
		re.put("blist", pageInfo.getList());
		re.put("pageInfo", pageInfo);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(re);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<HrContractInfor> searchInfor(String searchkey){
	    //获得bean
	    HrDao hrDao = ctx.getBean(HrDao.class);
	    List<HrContractInfor> contractlist = hrDao.searchInfor(searchkey);
		return contractlist;
	}

}
