package Hisign.controller.itservices;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Hisign.controller.process.AesEncryptUtil;
import Hisign.dao.ITDao;
import Hisign.dao.ProcessDao;
import Hisign.entity.ConsumableBorrowInfor;
import Hisign.entity.ConsumableListInfor;
import Hisign.entity.ConsumablePurInfor;
import Hisign.entity.EquipBorrowInfor;
import Hisign.entity.FixedAssetsInfor;
import Hisign.entity.UserInfor;

@Controller("itservicesController")
public class itservicesController {
	ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	final  AesEncryptUtil aesEncryptUtil = new AesEncryptUtil();
	/**
	 * 跳转到IT服务
	 * @param request
	 * @return
	 */
	@RequestMapping("ITService/toIT")
	public ModelAndView toITservices(HttpServletRequest request,ModelAndView mav){
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
		mav.setViewName("/dingdingweb/HUI/itservices/itservices");
		return mav;
		
	}
	
	
	/**
	 * 跳转到耗材采购主页
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/cou_pur")
	public ModelAndView toCou_pur(HttpServletRequest request,ModelAndView mav){
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}		JSONObject js = JSONObject.parseObject(userjson);
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/itservices/consumable_purchase/consumable_purchase");
		return mav;
	}
	
	
	/**
	 * 跳转到申请
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consuable_pur/apply")
	public ModelAndView toApply(HttpServletRequest request){
		return new ModelAndView("redirect:/dingdingweb/HUI/itservices/consumable_purchase/apply.jsp");
	}
	
	
	/**
	 * 保存耗材采购申请申请信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/consuable_pur/saveApplyInfo")
	public void getconsuablepurApplyInfor(HttpServletRequest request,HttpServletResponse response){
		String dcnumber="7"+String.valueOf(System.currentTimeMillis());
		String userId=request.getParameter("userId");
		String borrowid=request.getParameter("borrowid");
		String borrowname=request.getParameter("borrowname");
		String borrowde=request.getParameter("borrowde");
		String ptime=request.getParameter("ptime");
		String ptype=request.getParameter("ptype");
		String consumable_type=request.getParameter("consumable_type");
		String consumable_name=request.getParameter("consumable_name");
		String specifications=request.getParameter("specifications");
		String apply_num=request.getParameter("apply_num");
		String note=request.getParameter("note");
		String audit_name=request.getParameter("audit-name");
		if (audit_name.contains("(")) {
			audit_name= audit_name.substring(0, audit_name.indexOf("(")).trim();
		}
		String spid=request.getParameter("spid");
		
		ConsumablePurInfor cpi = new ConsumablePurInfor();
		cpi.setDcnumber(dcnumber);
		cpi.setUserId(userId);
		cpi.setBorrowid(borrowid);
		cpi.setBorrowname(borrowname);
		cpi.setBorrowde(borrowde);
		cpi.setPtime(ptime);
		cpi.setPtype(ptype);
		cpi.setConsumable_name(consumable_name);
		cpi.setConsumable_type(consumable_type);
		cpi.setSpecifications(specifications);
		cpi.setApply_num(apply_num);
		cpi.setNote(note);
		cpi.setAudit_name(audit_name);
		cpi.setSpid(spid);
		
		boolean ret =false;
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);	
		try {
			itdao.consu_insert(cpi);
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
			e1.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			try {	
				processDao.insert2(dcnumber, borrowname, audit_name, "耗材采购",userId,spid);
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
	 * 审批耗材采购
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consuable_pur/saveAuditInfor")
	public ModelAndView AuditInfor(HttpServletRequest request){
		String dcnumber=request.getParameter("dcnumber");
		String audit_type = request.getParameter("audit_type");
		String audit_opinion = request.getParameter("audit_opinion");
		String audit_time = request.getParameter("audit_time");
		
		ConsumablePurInfor cpi = new ConsumablePurInfor();
		cpi.setDcnumber(dcnumber);
		cpi.setAudit_type(audit_type);
		cpi.setAudit_opinion(audit_opinion);
		cpi.setAudit_time(audit_time);
		ITDao itdao = ctx.getBean(ITDao.class);
		boolean ret =false;
		ModelAndView mol = new ModelAndView();
		try {
			itdao.consu_audit(cpi);
		} catch (Exception e) {
			e.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			mol.setViewName("/dingdingweb/HUI/contract/AddSuccess");
		}
		return mol;
	}
	
	/**
	 * 到耗材仓库
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consuable_pur/shop")
	public ModelAndView toshop(HttpServletRequest request){
		return new ModelAndView("/dingdingweb/HUI/itservices/shop/shophome");
	}
	
	/**
	 * 到耗材列表
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consumableList")
	public ModelAndView ToConsumableList(HttpServletRequest request){
		ModelAndView mol = new ModelAndView();
		String c = request.getParameter("c");
		mol.addObject("c", c);
		mol.setViewName("/dingdingweb/HUI/itservices/shop/consumableList");
		return mol;
	}
	
	/**
	 * 到添加耗材种类
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/ToAddconsum")
	public ModelAndView ToAddConsum(HttpServletRequest request){
		String dcnumber=request.getParameter("dcnumber");
		String ptime=request.getParameter("ptime");
		String ptype=request.getParameter("ptype");
		String consumable_type=request.getParameter("consumable_type");
		String consumable_name=request.getParameter("consumable_name");
		String specifications=request.getParameter("specifications");
		String consumable_num=request.getParameter("consumable_num");
		String note=request.getParameter("note");
//		System.out.println("consumable_name："+consumable_name);
//		System.out.println("consumable_num:"+consumable_num);
//		System.out.println("note:"+note);
		ModelAndView mol = new ModelAndView();
		mol.addObject("dcnumber", dcnumber);
		mol.addObject("ptime", ptime);
		mol.addObject("ptype", ptype);
		mol.addObject("consumable_type", consumable_type);
		mol.addObject("consumable_name", consumable_name);
		mol.addObject("specifications", specifications);
		mol.addObject("consumable_num", consumable_num);
		mol.addObject("note", note);
		mol.setViewName("/dingdingweb/HUI/itservices/shop/addconsum");
		if (consumable_name==null&&consumable_num==null) {
			return new ModelAndView("/dingdingweb/HUI/itservices/shop/addconsum");
		}
		return mol;
	}
	
	
	/**
	 * 添加采购完的耗材
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/Addconsumable")
	public ModelAndView AddConsumable(HttpServletRequest request){
		ModelAndView mol = new ModelAndView();
		String dcnumber=request.getParameter("dcnumber");
		String ptime=request.getParameter("ptime");
		String ptype=request.getParameter("ptype");
		String recipients_number=null;
		String consumable_type=request.getParameter("consumable_type");
		String consumable_name=request.getParameter("consumable_name");
		String specifications=request.getParameter("specifications");
		String consumable_num=request.getParameter("consumable_num");
		String consum_uprice=request.getParameter("consum_uprice");
		String consum_tprice=request.getParameter("consum_tprice");
		String note=request.getParameter("note");
		int type_num=0;
		if (consumable_type.equals("打印耗材")) {
			type_num=1;
		}else if (consumable_type.equals("电脑耗材")) {
			type_num=2;
		}else if (consumable_type.equals("印刷耗材")) {
			type_num=3;
		}else if (consumable_type.equals("输出介质")) {
			type_num=4;
		}else if (consumable_type.equals("手机周边耗材")) {
			type_num=5;
		}
		recipients_number="c"+type_num+String.valueOf(System.currentTimeMillis());
		ConsumableListInfor cli = new ConsumableListInfor();
		cli.setDcnumber(dcnumber);
		cli.setPtime(ptime);
		cli.setPtype(ptype);
		cli.setRecipients_number(recipients_number);
		cli.setConsumable_type(consumable_type);
		cli.setConsumable_name(consumable_name);
		cli.setSpecifications(specifications);
		cli.setConsumable_num(consumable_num);
		cli.setConsum_uprice(consum_uprice);
		cli.setConsum_tprice(consum_tprice);
		cli.setNote(note);
		cli.setType_num(type_num);
		
		
		
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);
		boolean ret = false;
		try {
			itdao.addNewCon(cli);
		} catch (Exception e1) {
			ret =true;
			mol.setViewName("");
		}
		if (ret==false) {	
			processDao.updateState(dcnumber);
			itdao.EndApplyConsu(dcnumber);
			mol.setViewName("/dingdingweb/HUI/itservices/shop/AddSuccess");
		}
		return mol;
	}
	
	/**
	 * 获取耗材列表信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/getConsumable")
	public void getConsumableList(HttpServletRequest request,HttpServletResponse response){
		String type_num = request.getParameter("type_num");
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<ConsumableListInfor> bList = getConsumableInfor(type_num);
		PageInfo<ConsumableListInfor> pageInfo = new PageInfo<ConsumableListInfor>(bList);
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
	
	public List<ConsumableListInfor> getConsumableInfor(String type_num){
		ITDao itDao = ctx.getBean(ITDao.class);
		List<ConsumableListInfor> clist = itDao.getConsumableInfor(type_num);
		return clist;
	}
	
	/**
	 * 更新耗材信息
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/UpdateConsumableInfor")
	public ModelAndView UpdateConsumableInfor(HttpServletRequest request){
		String consumable_num=request.getParameter("consumable_num");
		String consum_uprice=request.getParameter("consum_uprice");
		String consum_tprice=request.getParameter("consum_tprice");
		String available=request.getParameter("available");
		ConsumableListInfor cli=new ConsumableListInfor();
		cli.setConsumable_num(consumable_num);
		cli.setConsum_uprice(consum_uprice);
		cli.setConsum_tprice(consum_tprice);
		cli.setAvailable(available);
		ITDao itDao = ctx.getBean(ITDao.class);
		itDao.UpdateConsumableInfor(cli);
		return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
		
	}
	
	/**
	 * 到查询
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consuable_pur/tosearch")
	public ModelAndView toSearch(HttpServletRequest request){
		
		return new ModelAndView("/dingdingweb/HUI/itservices/consumable_purchase/search");	
	}
	
	/**
	 * 查询申请信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/getConsumableApplyInfor")
	public void getConsumableInfor(HttpServletRequest request,HttpServletResponse response){
		String searchkey = request.getParameter("searchkey");
		String pageNum=request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<ConsumablePurInfor> bList = searchConsumApply(searchkey);
		PageInfo<ConsumablePurInfor> pageInfo = new PageInfo<ConsumablePurInfor>(bList);
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
	
	public List<ConsumablePurInfor>  searchConsumApply(String searchkey){
//      System.out.println("start-------------------------");
      //获得bean
      ITDao itDao = ctx.getBean(ITDao.class);
      List<ConsumablePurInfor> consumablelist = itDao.searchConsumApply(searchkey);
     
		return consumablelist;
  }
	
	/****************************************************************************************************************************/
	
	/**
	 * 到设备借用
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/ToEBorrowing")
	public ModelAndView ToEBorrowing(HttpServletRequest request,ModelAndView mav){
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}		JSONObject js = JSONObject.parseObject(userjson);
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/itservices/equipment_borrowing/equipment_borrowing");
		return mav;
		
	}
	
	/**
	 * 到设备借用申请
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/eborrowing/toApply")
	public ModelAndView ToEBorrowingApply(HttpServletRequest request){
		return new ModelAndView("redirect:/dingdingweb/HUI/itservices/equipment_borrowing/apply.jsp");

	}
	
	/**
	 * 保存设备借用申请信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/eborrowing/appyInfor")
	public void getEquipmentBorrowingApplyInfor(HttpServletRequest request,HttpServletResponse response){
		String dcnumber="x"+String.valueOf(System.currentTimeMillis());
		String userId=request.getParameter("userId");
		String borrowid=request.getParameter("borrowid");
		String borrowname=request.getParameter("borrowname");
		String borrowde=request.getParameter("borrowde");
		String equipment=request.getParameter("equipment");
		String model=request.getParameter("model");
		String num=request.getParameter("num");
		String ptime=request.getParameter("ptime");
		String ebtime=request.getParameter("ebtime");
		String audit_name=request.getParameter("audit-name");
		if (audit_name.contains("(")) {
			audit_name= audit_name.substring(0, audit_name.indexOf("(")).trim();
		}
		String spid=request.getParameter("spid");
		String note=request.getParameter("note");

		EquipBorrowInfor epi = new EquipBorrowInfor();
		epi.setDcnumber(dcnumber);
		epi.setUserId(userId);
		epi.setBorrowid(borrowid);
		epi.setBorrowname(borrowname);
		epi.setBorrowde(borrowde);
		epi.setEquipment(equipment);
		epi.setModel(model);
		epi.setNum(num);
		epi.setPtime(ptime);
		epi.setEbtime(ebtime);
		epi.setNote(note);
		epi.setAudit_name(audit_name);
		epi.setSpid(spid);
		
		boolean ret =false;
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);	
		try {
			itdao.eborrow_insert(epi);
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
			e1.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			try {	
				processDao.insert2(dcnumber, borrowname, audit_name, "设备借用",userId,spid);
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
	 * 审批设备借用
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/eborrowing/saveAuditInfor")
	public ModelAndView auditEBorrow(HttpServletRequest request){
		String dcnumber=request.getParameter("dcnumber");
		String audit_type=request.getParameter("audit_type");
		String has_get=request.getParameter("has_get");
		String return_type=request.getParameter("return_type");
		
		EquipBorrowInfor epi = new EquipBorrowInfor();
		epi.setDcnumber(dcnumber);
		epi.setAudit_type(audit_type);
		epi.setHas_get(has_get);
		epi.setReturn_type(return_type);
		ITDao itdao = ctx.getBean(ITDao.class);
		boolean ret =false;
		ModelAndView mol = new ModelAndView();
		try {
			itdao.eborrow_audit(epi);
		} catch (Exception e) {
			e.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			mol.setViewName("/dingdingweb/HUI/contract/AddSuccess");
		}
		return mol;
		
	}
	
	
	/**
	 * 到我的设备借用
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/myeborrowing")
	public ModelAndView ToMyEborrow(HttpServletRequest request,ModelAndView mav){
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
		mav.setViewName("/dingdingweb/HUI/itservices/equipment_borrowing/myeborrowing");
		return mav;
	}
	
	
	/**
	 * 获取我的设备借用信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/getBackEborrow")
	public void getMyEboroowInfor(HttpServletRequest request,HttpServletResponse response){
		String userid = request.getParameter("userid");
		String pageNum=request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<EquipBorrowInfor> bList = getMyEboroowInfor(userid);
		PageInfo<EquipBorrowInfor> pageInfo = new PageInfo<EquipBorrowInfor>(bList);
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
	
	public List<EquipBorrowInfor>  getMyEboroowInfor(String userid){
//      System.out.println("start-------------------------");
      //获得bean
      ITDao itDao = ctx.getBean(ITDao.class);
      List<EquipBorrowInfor> eqlist = itDao.getMyEboroowInfor(userid);
     
	return eqlist;
  }
	
	/**
	 * 归还设备
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("ITServices/eborrowing/backToBase")
	public ModelAndView backEb(HttpServletRequest request,HttpServletResponse response){
		String dcnumber=request.getParameter("dcnumber");
		
		EquipBorrowInfor epi = new EquipBorrowInfor();
		epi.setDcnumber(dcnumber);
		ITDao itdao = ctx.getBean(ITDao.class);
		boolean ret =false;
		ModelAndView mol = new ModelAndView();
		try {
			itdao.eborrow_return(epi);
		} catch (Exception e) {
			e.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			mol.setViewName("/dingdingweb/HUI/contract/AddSuccess");
		}
		return mol;
		
	}
	
	/**
	 * 确认归还评论反馈
	 * @return
	 */
	@RequestMapping("ITServices/eborrowing/setEva")
	public ModelAndView Evaluate(HttpServletRequest request){
		String dcnumber=request.getParameter("dcnumber");
		String evaluate=request.getParameter("evaluate");
		
		EquipBorrowInfor epi = new EquipBorrowInfor();
		epi.setDcnumber(dcnumber);
		epi.setEvaluate(evaluate);
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);
		boolean ret =false;
		ModelAndView mol = new ModelAndView();
		try {
			itdao.eborrow_setEva(epi);
		} catch (Exception e) {
			e.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			processDao.updateState(dcnumber);
			mol.setViewName("/dingdingweb/HUI/contract/AddSuccess");
		}
		return mol;
	}
	
	/**
	 * 到查询
	 * @return
	 */
	@RequestMapping("ITServices/eborrowing/ToSearch")
	public ModelAndView ToSearch(){
		return new ModelAndView("/dingdingweb/HUI/itservices/equipment_borrowing/search");
		
	}
	
	/**
	 * 得到设备借用查询信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/eborrowing/getEBorrowInfor")
	public void getEBorrowInfo(HttpServletRequest request,HttpServletResponse response){
		String searchkey = request.getParameter("searchkey");
		String pageNum=request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<EquipBorrowInfor> bList = searchEBorrowApply(searchkey);
		PageInfo<EquipBorrowInfor> pageInfo = new PageInfo<EquipBorrowInfor>(bList);
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
	
	public List<EquipBorrowInfor>  searchEBorrowApply(String searchkey){
//      System.out.println("start-------------------------");
      //获得bean
      ITDao itDao = ctx.getBean(ITDao.class);
      List<EquipBorrowInfor> eborowlist = itDao.searchEBorrowApply(searchkey);
     
		return eborowlist;
  }
	/********************************************************************************************/
	
	/**
	 * 到耗材领用
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/ToConsumableBorrow")
	public ModelAndView ToConsumableBorrow(HttpServletRequest request,ModelAndView mav){
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
		mav.setViewName("/dingdingweb/HUI/itservices/consumable_borrowing/consumable_borrowing");
		return mav;
		
	}
	
	/**
	 * 到耗材列表（耗材领用申请）
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consumable_borrowing/shophome")
	public ModelAndView ToCBorrwingshophome(HttpServletRequest request){
		return new ModelAndView("/dingdingweb/HUI/itservices/consumable_borrowing/shophome");
	}
	
	/**
	 * 到申领耗材选择列表
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consumable_borrowing/consumableList")
	public ModelAndView ToCBorrowingList(HttpServletRequest request){
		ModelAndView mol = new ModelAndView();
		String c = request.getParameter("c");
		mol.addObject("c", c);
		mol.setViewName("/dingdingweb/HUI/itservices/consumable_borrowing/consumableList");
		return mol;
	}
	
	/**
	 * 到耗材申领
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consumable_borrowing/apply")
	public String ToCBorrwingApply(RedirectAttributes attributes,HttpServletRequest request){
		String Recipients_number=request.getParameter("Recipients_number");
		String ptype=request.getParameter("ptype");
		String consumable_type=request.getParameter("consumable_type");
		String consumable_name=request.getParameter("consumable_name");
		String specifications=request.getParameter("specifications");
		String consum_uprice=request.getParameter("consum_uprice");
		String num=request.getParameter("num");

		attributes.addFlashAttribute("Recipients_number", Recipients_number);
		attributes.addFlashAttribute("ptype", ptype);
		attributes.addFlashAttribute("consumable_type",consumable_type);
		attributes.addFlashAttribute("consumable_name", consumable_name);
		attributes.addFlashAttribute("specifications", specifications);
		attributes.addFlashAttribute("consum_uprice", consum_uprice);
		attributes.addFlashAttribute("num", num);
//		System.out.println("consum_uprice:"+consum_uprice);
//		System.out.println("consumable_name:"+consumable_name);
		return "redirect:/dingdingweb/HUI/itservices/consumable_borrowing/apply.jsp";

	}
	
	/**
	 * 保存耗材申领信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("ITServices/consumable_borrowing/getApplyInfor")
	public void saveConsuBorrow(HttpServletRequest request,HttpServletResponse response){
		String dcnumber="y"+String.valueOf(System.currentTimeMillis());
		String userId=request.getParameter("userId");
		String borrowid=request.getParameter("borrowid");
		String borrowname=request.getParameter("borrowname");
		String borrowde=request.getParameter("borrowde");
		String Recipients_number=request.getParameter("Recipients_number");
		String ptype=request.getParameter("ptype");
		String ptime=request.getParameter("ptime");
		String consumable_type=request.getParameter("consumable_type");
		String consumable_name=request.getParameter("consumable_name");
		String specifications=request.getParameter("specifications");
		String consumable_num=request.getParameter("consumable_num");
		String consum_uprice=request.getParameter("consum_uprice");
		String consum_tprice=request.getParameter("consum_tprice");
		String note=request.getParameter("note");
		String audit_name=request.getParameter("audit-name");
		String spid=request.getParameter("spid");
		
		ConsumableBorrowInfor cbi = new ConsumableBorrowInfor();
		cbi.setDcnumber(dcnumber);
		cbi.setUserId(userId);
		cbi.setBorrowid(borrowid);
		cbi.setBorrowname(borrowname);
		cbi.setBorrowde(borrowde);
		cbi.setRecipients_number(Recipients_number);
		cbi.setPtype(ptype);
		cbi.setPtime(ptime);
		cbi.setConsumable_type(consumable_type);
		cbi.setConsumable_name(consumable_name);
		cbi.setSpecifications(specifications);
		cbi.setConsumable_num(consumable_num);
		cbi.setConsum_uprice(consum_uprice);
		cbi.setConsum_tprice(consum_tprice);
		cbi.setNote(note);
		cbi.setAudit_name(audit_name);
		cbi.setSpid(spid);
		
		boolean ret =false;
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);	
		try {
			itdao.Cborrow_insert(cbi);
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
			e1.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			try {	
				processDao.insert2(dcnumber, borrowname, audit_name, "耗材领用",userId,spid);
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
	 * 审批耗材申领
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("ITServices/consumable_borrowing/audit")
	public ModelAndView ConsuBorrowAudit(ModelAndView mav,HttpServletRequest request,HttpServletResponse response){
		String dcnumber=request.getParameter("dcnumber");
		String audit_type=request.getParameter("audit_type");
		String audit_opinion=request.getParameter("audit_opinion");
		String audit_time=request.getParameter("audit_time");
		String admins_id=request.getParameter("admins_id");
		String admins=request.getParameter("admins");
		
		ConsumableBorrowInfor cbi = new ConsumableBorrowInfor();
		cbi.setDcnumber(dcnumber);
		cbi.setAudit_type(audit_type);
		cbi.setAudit_opinion(audit_opinion);
		cbi.setAudit_time(audit_time);
		cbi.setAdmins_id(admins_id);
		cbi.setAdmins(admins);
		boolean ret =false;
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);
		try {
			itdao.ConsuBorrowAudit(cbi);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret=true;
			mav.setViewName("error/404");
		}
		if (ret==false) {
			processDao.updateManager(dcnumber, admins_id, admins);
			mav.setViewName("/dingdingweb/HUI/contract/AddSuccess");
		}
		
		return mav;
	}
	
	/**
	 * 耗材发放
	 * @param mav
	 * @param request
	 * @return
	 */
	@RequestMapping("ITServices/consumable_borrowing/issue")
	public ModelAndView ConsuBorrowIssue(ModelAndView mav ,HttpServletRequest request){
		String dcnumber=request.getParameter("dcnumber");
		String recipients_number=request.getParameter("Recipients_number");
		String l_cnum=request.getParameter("l_cnum");
		String l_tup=request.getParameter("l_tup");
		String issue_type=request.getParameter("issue_type");
		ConsumableBorrowInfor cbi = new ConsumableBorrowInfor();
		cbi.setDcnumber(dcnumber);
		cbi.setIssue_type(issue_type);
		boolean ret =false;
		ITDao itdao = ctx.getBean(ITDao.class);
		try {
			itdao.ConsuBorrowIssu(cbi);
			itdao.ChangeConsumableNumAndP(recipients_number,l_cnum,l_tup);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mav.setViewName("error/404");
			ret=true;
		}
		if (ret==false) {
			mav.setViewName("/dingdingweb/HUI/contract/AddSuccess");
		}
		return mav;
		
	}
	
	/**
	 * 获取耗材数量
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("ITServices/consumable_borrowing/getConNum")
	public void getConsumableNum(HttpServletRequest request,HttpServletResponse response){
		String recipients_number=request.getParameter("Recipients_number");
		ITDao itdao = ctx.getBean(ITDao.class);
		List <ConsumableListInfor>conlist =itdao.getgetConsumableNumList(recipients_number);
		JSONObject re = new JSONObject();
		re.put("conlist", conlist);
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
	 * 评价耗材申领服务
	 * @param mav
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("ITServices/consumable_borrowing/eva")
	public ModelAndView ConsuEva(ModelAndView mav,HttpServletRequest request,HttpServletResponse response){
		String dcnumber=request.getParameter("dcnumber");
		String evaluate=request.getParameter("evaluate");
		ConsumableBorrowInfor cbi = new ConsumableBorrowInfor();
		cbi.setDcnumber(dcnumber);
		cbi.setEvaluate(evaluate);
		boolean ret =false;
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);
		try {
			itdao.ConsuEva(cbi);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			mav.setViewName("error/404");
			ret=true;
		}
		if (ret==false) {
			processDao.updateState(dcnumber);
			mav.setViewName("/dingdingweb/HUI/contract/AddSuccess");
		}
		return mav;
		
	}
	/*********************************************************************************************************/
	@RequestMapping("ITServices/Fixedassets/ToFixedassets")
	public ModelAndView ToFixedassets(HttpServletRequest request,ModelAndView mav){
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
		mav.setViewName("/dingdingweb/HUI/itservices/fixedassets/fixedasset");
		return mav;
	}
	
	/**
	 * 到固定资产申请
	 * @param request
	 * @param mav
	 * @return
	 */
	@RequestMapping("ITServices/Fixedassets/toApply")
	public ModelAndView ToFixedassetsApply(HttpServletRequest request,ModelAndView mav){
		mav.setViewName("redirect:/dingdingweb/HUI/itservices/fixedassets/apply.jsp");
		return mav;
	}
	
	
	@RequestMapping("ITServices/Fixedassets/Apply")
	public void FixedAssetsApply(HttpServletRequest request,HttpServletResponse response){
		String dcnumber="z"+String.valueOf(System.currentTimeMillis());
		String userId=request.getParameter("userId");
		String borrowid=request.getParameter("borrowid");
		String borrowname=request.getParameter("borrowname");
		String borrowde=request.getParameter("borrowde");
		String apply_time=request.getParameter("apply_time");
		String use_id=request.getParameter("use_id");
		String use_name=request.getParameter("use_name");
		String ues_borrowde=request.getParameter("ues_borrowde");
		String equipment=request.getParameter("equipment");
		String a_num=request.getParameter("a_num");
		String e_use=request.getParameter("e_use");
		String cost=request.getParameter("cost");
		String a_reason=request.getParameter("a_reason");
		String esr=request.getParameter("esr");
		String straight_head=request.getParameter("audit-name");
		String audit_name=straight_head;
		if (audit_name.contains("(")) {
			audit_name= audit_name.substring(0, audit_name.indexOf("(")).trim();
		}
		String sh_id=request.getParameter("sh_id");

		FixedAssetsInfor fixedAssetsInfor = new FixedAssetsInfor();
		fixedAssetsInfor.setDcnumber(dcnumber);
		fixedAssetsInfor.setUserId(userId);
		fixedAssetsInfor.setBorrowid(borrowid);
		fixedAssetsInfor.setBorrowname(borrowname);
		fixedAssetsInfor.setBorrowde(ues_borrowde);
		fixedAssetsInfor.setApply_time(apply_time);
		fixedAssetsInfor.setUse_id(use_id);
		fixedAssetsInfor.setUse_name(use_name);
		fixedAssetsInfor.setUes_borrowde(ues_borrowde);
		fixedAssetsInfor.setEquipment(equipment);
		fixedAssetsInfor.setA_num(a_num);
		fixedAssetsInfor.setE_use(e_use);
		fixedAssetsInfor.setCost(cost);
		fixedAssetsInfor.setA_reason(a_reason);
		fixedAssetsInfor.setEsr(esr);
		fixedAssetsInfor.setStraight_head(straight_head);
		
		boolean ret =false;
		ITDao itdao = ctx.getBean(ITDao.class);
		ProcessDao processDao = ctx.getBean(ProcessDao.class);	
		try {
			itdao.FixedAssets_insert(fixedAssetsInfor);
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
			e1.printStackTrace();
			ret=true;
		}
		if (ret==false) {
			try {	
				processDao.insert2(dcnumber, borrowname, audit_name, "固定资产申请",userId,sh_id);
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
	
}
