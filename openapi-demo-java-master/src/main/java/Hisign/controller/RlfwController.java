package Hisign.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import Hisign.Service.RlfwService;
import Hisign.dao.ContractDao;
import Hisign.entity.ContractInfor;
import Hisign.entity.DepartmentDe;
import Hisign.entity.Rlfw;
import Hisign.entity.UserInfor;


@Controller("RlfwController")
@RequestMapping(value="/rlfw")
public class RlfwController {
	
	
	@Autowired
	private RlfwService rlfwaddservice;
	final Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 跳转到人力服务页面
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/torlfw" , method=RequestMethod.GET)
	public ModelAndView torlfw(HttpServletRequest request) throws Exception {
		String userjson = request.getParameter("info");
//		System.out.println("torlfwjson--"+userjson);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/dingdingweb/HUI/rlfw/rlfw.jsp");
		return mav;
	}
	/**
	 * 跳转到人力服务添加页面
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/torlfw_add", method=RequestMethod.GET)
	public ModelAndView torlfw_add(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String userjson = request.getParameter("info");
//		System.out.println("addJson--"+userjson);
//		System.out.println("userjson,length---"+userjson.length());
		if(userjson.length()>10){
			JSONObject js = JSONObject.parseObject(userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			usi.setJobnumber(js.getString("jobnumber"));
			JSONArray depart = js.getJSONArray("department");
			String fid = depart.getString(0);
			String zid = depart.getString(1);
			DepartmentDe dpd = new DepartmentDe();
			dpd.setFid(fid);
			dpd.setZid(zid);
			mav.addObject("userinfoList", usi);
			mav.addObject("department", dpd);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.setViewName("/dingdingweb/HUI/rlfw/rlfw_add");
		}else{
			mav.setViewName("/dingdingweb/HUI/rlfw/rlfw_add");
		}
		return mav;
	}
	/**
	 * 跳转到人力服务查询输入页面
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/select_before", method=RequestMethod.GET)
	public ModelAndView select_before(HttpServletRequest request) throws Exception {
		String userjson = request.getParameter("info");
//		System.out.println("BeforeJson--"+userjson);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/dingdingweb/HUI/rlfw/rlfw_select_before.jsp");
		return mav;
	}
	/**
	 * 人力服务添加入库
	 * @param rlfwadd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView add(Rlfw rlfwadd) throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");// 设置日期格式
		String danhao = df.format(new Date());
		danhao = danhao+rlfwadd.getRlfw_use_peo_num().substring(rlfwadd.getRlfw_use_peo_num().length()-4);
		rlfwadd.setRlfw_doc_num(danhao);
		rlfwadd.setRlfw_doc_state("待审批");
		System.out.println("审批人姓名--"+rlfwadd.getRlfw_app_peo_name());
		rlfwaddservice.add(rlfwadd);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/dingdingweb/HUI/rlfw/rlfw.jsp");
		return mav;
	}
	/**
	 * 人力服务查询功能
	 * @param rlfw_use_peo_name
	 * 借阅人
	 * @param rlfw_act_borr_time
	 * 借阅时间
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/rlfw_select", method=RequestMethod.POST)
	public ModelAndView rlfw_select(String rlfw_use_peo_name,String rlfw_act_borr_time) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/dingdingweb/HUI/rlfw/rlfw_select");
		mav.addObject("s", rlfwaddservice.user_select(rlfw_use_peo_name,rlfw_act_borr_time));
		return mav;
	}
	@RequestMapping(value="/rlfw_shenpi", method=RequestMethod.GET)
	public ModelAndView rlfw_shenpi(HttpServletRequest request) throws Exception {
		String userjson = request.getParameter("info");
		JSONObject js = JSONObject.parseObject(userjson);
		JSONArray depart = js.getJSONArray("department");
		String rlfw_depar_id = depart.getString(1);
		rlfwaddservice.shenpi_select(rlfw_depar_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dingdingweb/HUI/rlfw/rlfw_shenpi");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到我的审批
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/tomyaudit")
	public ModelAndView tomyaudit(HttpServletRequest request){	
		String userjson = request.getParameter("info");
		JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
//		System.out.println("tonewselect"+userjson);
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		ModelAndView mav = new ModelAndView();
		String searchname= js.getString("name");
//		System.out.println("searchname:"+searchname);
		if (searchname.equals("")) {
			System.out.println("呵呵");
		}else {
			List<Rlfw> shenpi_list =rlfwaddservice.shenpi_select(searchname);
			mav.addObject("shenpi_list", shenpi_list);// 传入集合
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.setViewName("/dingdingweb/HUI/rlfw/rlfw_shenpi");
		}
		return mav;
	}
	
	/**
	 * 审批完成（同意或拒绝）保存到数据库
	 * @param request
	 */
	@RequestMapping(value="shenpijieguo")
	public ModelAndView audittoBase(HttpServletRequest request){
		String rlfw_doc_num=request.getParameter("rlfw_doc_num");
		String rlfw_app_peo_num=request.getParameter("rlfw_app_peo_num");
		String rlfw_app_peo_name=request.getParameter("rlfw_app_peo_name");
		String rlfw_app_desc=request.getParameter("rlfw_app_desc");
		String rlfw_app_time=request.getParameter("rlfw_app_time");
		String rlfw_act_borr_time=request.getParameter("rlfw_act_borr_time");
		String rlfw_doc_state=request.getParameter("rlfw_doc_state");
		Rlfw rlfw = new Rlfw();
		rlfw.setRlfw_doc_num(rlfw_doc_num);
		rlfw.setRlfw_app_peo_num(rlfw_app_peo_num);
		rlfw.setRlfw_app_peo_name(rlfw_app_peo_name);
		rlfw.setRlfw_app_desc(rlfw_app_desc);
		rlfw.setRlfw_app_time(rlfw_app_time);
		rlfw.setRlfw_act_borr_time(rlfw_act_borr_time);
		rlfw.setRlfw_doc_state(rlfw_doc_state);
		
		rlfwaddservice.shenpi_jieguo(rlfw);
	    
	    
		return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
       
	    
	}
}
