package Hisign.controller.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Hisign.dao.ProcessDao;
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
import Hisign.entity.StampCertificateInfor;
import Hisign.entity.UserInfor;

/**
 * 流程controller
 * @author Administrator
 *
 */
@Controller("ProcessController")
public class ProcessController {
	final  AesEncryptUtil aesEncryptUtil = new AesEncryptUtil();
    //初始化容器
    ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	/**
	 * 获取待办信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/Message/getMessageTodo")
	public void getmessage_todo(HttpServletRequest request,HttpServletResponse response){
		
		String auditname = request.getParameter("auditname").replace("欢迎您 : ", "");
		String pageNum=request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<ProcessInfo> bList = seachMessage_todo(auditname);
		PageInfo<ProcessInfo> pageInfo = new PageInfo<ProcessInfo>(bList);
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
			e.printStackTrace();
		}
		
	}
	
	public List<ProcessInfo>  seachMessage_todo(String auditname){
      //获得bean
      ProcessDao processdao = ctx.getBean(ProcessDao.class);
      List<ProcessInfo> Processlist = processdao.seachTodoMessage(auditname);
//      for (ProcessInfo processInfo : Processlist) {
//		System.out.println("dcnumber"+processInfo.getDcnumber());
//	}

		return Processlist; 
	}
	
	
	/**
	 * 获取已处理信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/Message/getMessagehavedeal")
	public void getmessage_havedeal(HttpServletRequest request,HttpServletResponse response){
		String auditname = request.getParameter("auditname").replace("欢迎您 : ", "");
		String pageNum=request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<ProcessInfo> bList = seachMessage_havedeal(auditname);
		PageInfo<ProcessInfo> pageInfo = new PageInfo<ProcessInfo>(bList);
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
			e.printStackTrace();
		}
	}
	
	
	public List<ProcessInfo>  seachMessage_havedeal(String auditname){
	      //获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<ProcessInfo> Processlist = processdao.seachHavedealMessage(auditname);
	      
		return Processlist; 
	}
	
	
	/**
	 * 跳转到信息详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/Message/toDetailMessage")
	public ModelAndView toDetailMessage(HttpServletRequest request,RedirectAttributes attributes){
		String dcnumber=request.getParameter("dcnumber");
		String name=request.getParameter("name");//发起人
		String audit_name=request.getParameter("audit_name");//审批人
		String type=request.getParameter("type");
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(userjson);
		ModelAndView mav = new ModelAndView();
		if (userjson.equals("undefined")) {	
			return new ModelAndView("/dingdingweb/HUI/err");
		}else {
			JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
//			System.out.println("toDetailMessage"+userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			List<UserInfor> userinfoList = new ArrayList<>();
			userinfoList.add(usi);
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.addObject("dcnumber", dcnumber);
			mav.addObject("name",name);
			mav.addObject("audit_name",audit_name);
			mav.addObject("type",type);
			
			attributes.addFlashAttribute("userinfoList", userinfoList);
			attributes.addFlashAttribute("userjson", userjson.replaceAll("\"", "'"));
			attributes.addFlashAttribute("dcnumber", dcnumber);
			attributes.addFlashAttribute("name",name);
			attributes.addFlashAttribute("audit_name",audit_name);
			attributes.addFlashAttribute("type",type);
			
			mav.setViewName("/dingdingweb/HUI/useful/messageDetail/messDetail");
		}
		return mav;
	}
	
	/**
	 * 获取详细信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/Message/getDetailMessage")
	public void getDetailMessage(HttpServletRequest request,HttpServletResponse response){
		String dcnumber=request.getParameter("dcnumber");
		String type=request.getParameter("type");
		JSONObject re = new JSONObject();
		if (type.equals("合同借用")) {
			List<ContractInfor> bList = getContractMessageDetail(dcnumber,type);
			re.put("blist", bList);		
		}else if (type.equals("快递发放")) {
			List<CourierInfor> bList = getCourierMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}else if (type.equals("车量申请")) {
			List<ApplyCarInfor> bList = getApplyCarMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}else if (type.equals("名片制作")) {
			List<BusinessCardInfor> bList = getBusinessCardMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}else if (type.equals("印章证照")) {
			List<ApplyStampInfor> bList = getApplyStampMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}else if (type.equals("人力档案借用")) {
			List<HrContractInfor> bList = getApplyHrMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}else if(type.equals("耗材采购")){
			List<ConsumablePurInfor> bList = getApplyConsumabkePurInforMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}else if (type.equals("设备借用")) {
			List<EquipBorrowInfor> bList = getApplyEquipmentBorrowInforMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}else if (type.equals("耗材领用")) {
			List<ConsumableBorrowInfor> bList = getApplyConsumambBorrowInforMessageDetail(dcnumber,type);
			re.put("blist", bList);
		}
		
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(re);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<ContractInfor> getContractMessageDetail(String dcnumber,String type){
	      //获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<ContractInfor> list = processdao.getContractMessageDetail(dcnumber,type);
		return list; 
	}
	public List<CourierInfor>  getCourierMessageDetail(String dcnumber,String type){
	
	      //获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<CourierInfor> list = processdao.getCourierMessageDetail(dcnumber,type);
		return list; 
	}
	public List<ApplyCarInfor> getApplyCarMessageDetail(String dcnumber,String type){
		 //获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<ApplyCarInfor> list = processdao.getApplyCarMessageDetail(dcnumber,type);
		return list; 
	}
	public List<BusinessCardInfor> getBusinessCardMessageDetail(String dcnumber,String type){
		 //获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<BusinessCardInfor> list = processdao.getBusinessCardMessageDetail(dcnumber,type);
		return list; 
	}
	public List<ApplyStampInfor> getApplyStampMessageDetail(String dcnumber,String type){
		//获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<ApplyStampInfor> list = processdao.getApplyStampMessageDetail(dcnumber,type);
		return list;
	}
	public List<HrContractInfor> getApplyHrMessageDetail(String dcnumber,String type){
		//获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<HrContractInfor> list = processdao.getApplyHrMessageDetail(dcnumber,type);
		return list;
	}
	public List<ConsumablePurInfor> getApplyConsumabkePurInforMessageDetail(String dcnumber,String type){
		//获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<ConsumablePurInfor> list = processdao.getApplyConsumabkePurInforMessageDetail(dcnumber,type);
		return list;
	}
	
	public List<EquipBorrowInfor> getApplyEquipmentBorrowInforMessageDetail(String dcnumber,String type){
		//获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<EquipBorrowInfor> list = processdao.getApplyEquipmentBorrowInforMessageDetail(dcnumber,type);
	   return list;
	}

	public List<ConsumableBorrowInfor> getApplyConsumambBorrowInforMessageDetail(String dcnumber,String type){
		//获得bean
	      ProcessDao processdao = ctx.getBean(ProcessDao.class);
	      List<ConsumableBorrowInfor> list = processdao.getApplyConsumambBorrowInforMessageDetail(dcnumber,type);
	   return list;
	}
	
}
