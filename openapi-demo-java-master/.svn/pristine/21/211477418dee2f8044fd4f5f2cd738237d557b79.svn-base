package Hisign.controller;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import Hisign.dao.StandbyDAO;
import Hisign.entity.DepartmentDe;
import Hisign.entity.StandbyInfor;
import Hisign.entity.UserInfor;

       @Controller("StandByController")

public class StandByController {   
	   final Logger logger = LoggerFactory.getLogger(this.getClass());	   
       @RequestMapping(value = "/Service/StandBy",method = RequestMethod.POST)
   public ModelAndView applyStandBy(@ModelAttribute("StandbyInfor") StandbyInfor standbyInfor,HttpServletRequest request) throws Exception {
    	   
    	   
       String dctid = String.valueOf(System.currentTimeMillis()) ;  
	   String job_number = request.getParameter("job_number");
	   String standby_people = request.getParameter("standby_people");
	   String standby_department= request.getParameter("borrowde2");
	   String process_jobnum = request.getParameter("link_spid");	  	   
	   String process_time = request.getParameter("process_time");
	   String standby_note= request.getParameter("standby_note");  
	   String process_people= request.getParameter("link_spname"); 
	   	   
	   StandbyInfor sti = new StandbyInfor();
	   long time = System.currentTimeMillis();
		   Date date = new Date(time);
		   SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   String complaint_time=dateformat.format(date);
		   System.out.println(complaint_time);
		   SimpleDateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
		   String test_time=dateF.format(date);	   
	   sti.setDctid(dctid);
	   sti.setProcess_time(process_time);
	   sti.setJob_number(job_number);
	   sti.setStandby_people(standby_people);
	   sti.setStandby_department(standby_department);
	   sti.setStandby_firstdate(complaint_time);
	   sti.setProcess_people(process_people);
	   sti.setProcess_jobnum(process_jobnum);		 
	   sti.setStandby_note(standby_note);	
	   sti.setTest_time(test_time);
	   System.out.println(test_time);
	   ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");  
       //获得bean
       StandbyDAO stand = ctx.getBean(StandbyDAO.class);
       stand.Insert(sti);
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/dingdingweb/HUI/contract/AddSuccess");
       mav.addObject("opmsg", "提交成功!");
       return mav;
	
       }
       
	
   	
   	
   	/**
	 * 跳转到new And search
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Service/tocenter",method = RequestMethod.GET)
	public ModelAndView tocontract(HttpServletRequest request){
		String userjson = request.getParameter("info");
		JSONObject js = JSONObject.parseObject(userjson);
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/service/center");
		return mav;
	}
	/**
	 * 
	 * 跳转到新服务申请
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Service/toStandBy",method = RequestMethod.GET)
	public ModelAndView tonewadd(HttpServletRequest request){
		String userjson = request.getParameter("info");
		JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setJobnumber(js.getString("jobnumber"));
		JSONArray depart = js.getJSONArray("department");
		List<DepartmentDe> departList = new ArrayList<>();
		String fid = depart.getString(0);
		String zid = depart.getString(0);
			DepartmentDe dpd = new DepartmentDe();
			dpd.setFid(fid);
			dpd.setZid(zid);
			departList.add(dpd);
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.addObject("departList", departList);
		mav.setViewName("/dingdingweb/HUI/service/StandByServer");
		return mav;
	}
	/**
	 * 跳转到查询
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Service/toFind",method = RequestMethod.GET)
	public ModelAndView tonewfind(HttpServletRequest request){
		String userjson = request.getParameter("info");
		JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/service/finded");
		return mav;
	}

	/**
	 * 
	 * 跳转到我的审批
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Service/toMyspde")
	public ModelAndView tomyspde(HttpServletRequest request){	
		String userjson = request.getParameter("info");
		JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		ModelAndView mav = new ModelAndView();
		String searchname= js.getString("name");
	    ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
		  //获得bean
		StandbyDAO standbyDao = ctx.getBean(StandbyDAO.class);	
		List<StandbyInfor> standbylist = standbyDao.searchmysp(searchname);
		System.out.println(standbylist);
		mav.addObject("standbylist", standbylist);// 传入集合
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/service/Mysp");
		return mav;
	}
	/**
	 * 审批完成
	 * @param request
	 */
	@RequestMapping(value="/Service/toCompletesp")
	public ModelAndView updateproresu(HttpServletRequest request){
		String dctid = request.getParameter("dctid");
		 long time = System.currentTimeMillis();
		   Date date = new Date(time);
		   SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   String complete_time=dateformat.format(date);
		String process_time=request.getParameter("process_time");
		String process_result=request.getParameter("radio");		
		String donetime=dateformat.format(date);
		System.out.println(process_result);
	    StandbyInfor standby =new StandbyInfor();
	    ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	    StandbyDAO standbyDAO = ctx.getBean(StandbyDAO.class);
            
	  if(process_result==null){
        standby.setDctid(dctid);
        standby.setDonetime(donetime);
        standbyDAO.todone(standby);}
	  else{	
        standby.setDctid(dctid);
	    standby.setComplete_time(complete_time);
	    standby.setProcess_time(process_time);
	    standby.setProcess_result(process_result);
	    standbyDAO.toresult(standby);}

		return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
		
	    
	}


	/**
	 * 
	 * 我的审批历史
	 * @param request
	 * @return  
	 */
	@RequestMapping(value="/Service/toSphis")
	public ModelAndView tosphis(HttpServletRequest request){	
		String userjson = request.getParameter("info");
	 //   String process_result = request.getParameter("process_result");
		JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		ModelAndView mav = new ModelAndView();
		String searchname= js.getString("name");

	    ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
		  //获得bean
		StandbyDAO standbyDao = ctx.getBean(StandbyDAO.class);
		List<StandbyInfor> standbylist = standbyDao.searchsphis(searchname);
		System.out.println(standbylist);
		mav.addObject("standbylist", standbylist);// 传入集合
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.setViewName("/dingdingweb/HUI/service/sphisty");
		return mav;
	}
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
	/**
	 * 
	 * 跳转到我提交的申请页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Service/toMySubmit")
	public ModelAndView toMyapply(HttpServletRequest request){
		String userjson = request.getParameter("info");
		JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
		UserInfor usi = new UserInfor();
		usi.setAvatar(js.getString("avatar"));
		usi.setName(js.getString("name"));
		usi.setUserid(js.getString("userid"));
		usi.setDepartment(js.getString("department"));
		List<UserInfor> userinfoList = new ArrayList<>();
		userinfoList.add(usi);
		
		String searchname= js.getString("name");
		System.out.println(searchname);
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	    //获得bean
		StandbyDAO standbydao = ctx.getBean(StandbyDAO.class);
			List<StandbyInfor> standbylist = standbydao.searchmyapling(searchname);
		    
			ModelAndView mav = new ModelAndView();
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.addObject("standbylist", standbylist);// 传入集合
			mav.setViewName("/dingdingweb/HUI/service/searchmyapling");
	
		
		return mav;
	
	}


/**
 * 提交评价
 * @param request
 * @return
 */
@RequestMapping(value="/Service/toevaluation")
public ModelAndView applyToeva(HttpServletRequest request){

	String evaluation=request.getParameter("evaluation");
	String dctid = request.getParameter("dctid");
    StandbyInfor stand =new StandbyInfor();
      stand.setDctid(dctid);
      stand.setEvaluation(evaluation);
     
    //初始化容器
    ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
    //获得bean
    StandbyDAO standbydao = ctx.getBean(StandbyDAO.class);
    standbydao.toeva(stand);
	return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
}





/**
 * 
 * 跳转到我提交的申请页面
 * @param request
 * @return
 */
@RequestMapping(value="/Service/toAply")
public ModelAndView toaplhis(HttpServletRequest request){
	String userjson = request.getParameter("info");
	JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
	UserInfor usi = new UserInfor();
	usi.setAvatar(js.getString("avatar"));
	usi.setName(js.getString("name"));
	usi.setUserid(js.getString("userid"));
	usi.setDepartment(js.getString("department"));
	List<UserInfor> userinfoList = new ArrayList<>();
	userinfoList.add(usi);
	
	String searchname= js.getString("name");
	System.out.println(searchname);
	ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
    //获得bean
	StandbyDAO standbydao = ctx.getBean(StandbyDAO.class);
		List<StandbyInfor> standbylist = standbydao.searchaplhis(searchname);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userinfoList", userinfoList);
		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
		mav.addObject("standbylist", standbylist);// 传入集合
		mav.setViewName("/dingdingweb/HUI/service/applyHis");

	return mav;

}


      }
