package Hisign.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
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

import Hisign.dao.RepairDao;
import Hisign.entity.DepartmentDe;
import Hisign.entity.RepairInfor;
import Hisign.entity.StandbyInfor;
import Hisign.entity.UserInfor;
@Controller("RepairController")
public class RepairController {
	   final Logger logger = LoggerFactory.getLogger(this.getClass());
	   
	   
	   /**
		 * 跳转到行政报修
		 * @param request
		 * @return
		 */
		@RequestMapping(value="/Repair/torepair")
public ModelAndView toRepair(HttpServletRequest request){
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
			mav.setViewName("/dingdingweb/HUI/repair/repair");
			return mav;
		}
		
		
		
		/**
		 * 提交申请
		 * @param request
		 * @return
		 */
	          @RequestMapping(value = "/Repair/toaplyRepair",method = RequestMethod.POST)
	          public ModelAndView applyStandBy(@ModelAttribute("StandbyInfor") StandbyInfor standbyInfor,HttpServletRequest request) throws Exception {
	           	   
	          
	           String dctid = String.valueOf(System.currentTimeMillis()) ;  
	       	   String repair_jobnum = request.getParameter("repair_jobnum");
	       	   String repair_people = request.getParameter("repair_people");
	       	   String people_depart= request.getParameter("borrowde2");
	       	   String repair_location=request.getParameter("follow");
	       	   String location = request.getParameter("location");
	       	   String repair_content = request.getParameter("repair_content");
	       	   String repair_repairer = request.getParameter("repairer");
	  
	       	   	   
	       	   RepairInfor rpi = new RepairInfor();
	       	   rpi.setDctid(dctid);
	       	   rpi.setRepair_people(repair_people);
	       	   rpi.setRepair_jobnum(repair_jobnum);
	       	   rpi.setPeople_depart(people_depart);
	       	   rpi.setRepair_content(repair_content);
	       	   rpi.setRepair_location(repair_location+"层"+location+"侧");
	       	   rpi.setRepair_content(repair_content);
	       	   rpi.setRepair_repairer(repair_repairer);	
	           long time = System.currentTimeMillis();
      		   Date date = new Date(time);
      		   SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      		   String repair_time=dateformat.format(date);
      		   SimpleDateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
      		   String search_time=dateF.format(date);
      		   rpi.setSearch_time(search_time);
	       	   rpi.setRepair_time(repair_time);
	       	   ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");  
	              //获得bean
	              RepairDao repair = ctx.getBean(RepairDao.class);
	              repair.Insert(rpi);
	              ModelAndView mav = new ModelAndView();
	              mav.setViewName("/dingdingweb/HUI/contract/AddSuccess");
	              mav.addObject("opmsg", "提交成功!");
	              return mav;
	       	
	              }
	          /**
	  		 * ；跳转到报修申请
	  		 * @param request
	  		 * @return
	  		 */
	      
	      	@RequestMapping(value = "/Repair/tonewRepair",method = RequestMethod.GET)
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
	      		mav.setViewName("/dingdingweb/HUI/repair/newrepair");
	      		return mav;
	      	}
	      	
	      	///////
	      	///////////////recive   部门ID
	      	////////////////////////////
	      	/////////////////////////////////////////////////////
	        /**
	  		 * ；收到报修申请
	  		 * @param request
	  		 * @return
	  		 */
	      	@RequestMapping(value = "/Repair/toMyRepair",method = RequestMethod.GET)
	      	public ModelAndView toReciveRepair(HttpServletRequest request){
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
	      		  ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	    		  //获得bean
	    		RepairDao repairDao = ctx.getBean(RepairDao.class);
	    		String searchname=request.getParameter("borrowde2");
	    		List<RepairInfor> repairlist = repairDao.Recive("");
	    		System.out.println(repairlist.size());
	      		List<UserInfor> userinfoList = new ArrayList<>();
	      		userinfoList.add(usi);
	      		ModelAndView mav = new ModelAndView();
	      		mav.addObject("repairlist", repairlist);
	      		mav.addObject("userinfoList", userinfoList);
	      		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
	      		mav.addObject("departList", departList);
	    		mav.setViewName("/dingdingweb/HUI/repair/reciveRepair");
	      		return mav;
	      	}
	      	/**
	  		 *  处理完成提交处理信息
	  		 * @param request
	  		 * @return
	  		 */
	    	@RequestMapping(value = "/Repair/tosubmitin",method = RequestMethod.POST)
	      	public ModelAndView tosubmitinfo(HttpServletRequest request){
	      	
	      
//	      		List<DepartmentDe> departList = new ArrayList<>();

	    		String dctid = request.getParameter("dctid");
	      		String process_people=request.getParameter("process_people");
	      		String process_jobnum=request.getParameter("process_jobnum");
	      		String process_depart=request.getParameter("borrowde1");
	      		RepairInfor rpi = new RepairInfor();
	      		rpi.setProcess_jobnum(process_jobnum);
	      		rpi.setProcess_people(process_people);
	      		rpi.setDctid(dctid);
	      		rpi.setProcess_depart(process_depart);
	      		long time = System.currentTimeMillis();
	      		Date date = new Date(time);
	      		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      		String donetime=dateformat.format(date);
	      		rpi.setProcess_donetime(donetime);
	      		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");  
	              //获得bean
	              RepairDao repair = ctx.getBean(RepairDao.class);
	              repair.Submitin(rpi);
	              ModelAndView mav = new ModelAndView();
	              mav.setViewName("/dingdingweb/HUI/contract/AddSuccess");
	              mav.addObject("opmsg", "提交成功!");
	      		return mav;
	      	}
	      	
	      	
	      	
	      	@RequestMapping(value = "/Repair/toRepairing")//,method = RequestMethod.POST)
	      	public ModelAndView toRepairing(HttpServletRequest request){
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
	    		RepairDao repairDao = ctx.getBean(RepairDao.class);	
	    		List<RepairInfor> repairlist = repairDao.repairing(searchname); 
	    		mav.addObject("repairlist", repairlist);// 传入集合
	    		mav.addObject("userinfoList", userinfoList);
	    		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
	    		mav.setViewName("/dingdingweb/HUI/repair/myRepair");
	      		return mav;
	      	}
	      	
	      	@RequestMapping(value = "/Repair/toEvaluation")
	      	public ModelAndView toEvaluation(HttpServletRequest request){
	    		String dctid = request.getParameter("dctid");
	      		String repair_evaluation=request.getParameter("repair_evaluation");
	      		RepairInfor rpi = new RepairInfor();
	      		rpi.setDctid(dctid);
	      		rpi.setRepair_evaluation(repair_evaluation);
	      		long time = System.currentTimeMillis();
	      		Date date = new Date(time);
	      		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      		String end_time=dateformat.format(date);
	      		rpi.setEnd_time(end_time);
	      		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");  
	              //获得bean
	              RepairDao repair = ctx.getBean(RepairDao.class);
	              repair.toEvaluation(rpi);
	              ModelAndView mav = new ModelAndView();
	              mav.setViewName("/dingdingweb/HUI/contract/AddSuccess");
	              mav.addObject("opmsg", "提交成功!");
	      		return mav;
	      	}	   
	      	
	      	
	    	@RequestMapping(value = "/Repair/tomyRepairhis")
	      	public ModelAndView toRepairhis(HttpServletRequest request){
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
	    		RepairDao repairDao = ctx.getBean(RepairDao.class);	
	    		List<RepairInfor> repairlist = repairDao.repairing(searchname); 
	    		mav.addObject("repairlist", repairlist);// 传入集合
	    		mav.addObject("userinfoList", userinfoList);
	    		mav.addObject("userjson", userjson.replaceAll("\"", "'"));
	    		mav.setViewName("/dingdingweb/HUI/repair/RepairHis");
	      		return mav;
	      	} 	
	    	/**
	    	 * 跳转到查询界面
	    	 * @param request
	    	 * @return
	    	 */
	    	@RequestMapping(value = "/Repair/toselect",method = RequestMethod.GET)
	      	public ModelAndView toRepairfind(HttpServletRequest request){
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
	    		mav.setViewName("/dingdingweb/HUI/repair/selectRe");
	      		return mav;
	      	} 	
	    	
	    	/**
	    	 * 查询
	    	 * @param request
	    	 * @return
	    	 */
	    	@RequestMapping(value = "/Repair/tofind",method = RequestMethod.POST)
	      	public ModelAndView toselect(HttpServletRequest request){
	      		String userjson = request.getParameter("info");
	      		String searchname = request.getParameter("searchname");
//	      		String repair_time=request.getParameter("repair_time1");
//	      		String repair_time2=request.getParameter("repair_time2");      		
	      	//	if(repair_time2!=null){}
	    		List<UserInfor> userinfoList = new ArrayList<>();
	    		RepairInfor repair = new RepairInfor();
	    		repair.setRepair_people(searchname);
	    		//repair.setRepair_time(repair_time);
	    		//repair.setRepair_time2(repair_time2);
	    		
	    		ModelAndView mav = new ModelAndView();
	    	    ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	    		RepairDao repairDao = ctx.getBean(RepairDao.class);	
	    		//if(repair_people!=null&&repair_time.equals(null)){
	    		List<RepairInfor> repairlist = repairDao.SearchRepaired(searchname); 
	    		System.out.println(repairlist.get(0).getDctid());
	    		mav.addObject("repairlist", repairlist);  //}// 传入集合
	    		/*if(repair_people!=null&&repair_time!=null&&repair_time2==null){
	    			List<RepairInfor> repairlist = repairDao.nametime(repair); 
		    		mav.addObject("repairlist", repairlist);  	
	    		}
	    		if(repair_people!=null&&repair_time!=null&&repair_time2!=null){
	    			List<RepairInfor> repairlist = repairDao.namedate(repair); 
		    		mav.addObject("repairlist", repairlist);  	
	    		}
	    		if(repair_people==null&&repair_time!=null&&repair_time2==null){
	    			List<RepairInfor> repairlist = repairDao.fortime(repair_time); 
		    		mav.addObject("repairlist", repairlist); 
		    		System.out.println(repairlist.size());
	    		}
	    		if(repair_people==null&&repair_time!=null&&repair_time2!=null){
	    			List<RepairInfor> repairlist = repairDao.fordate(repair); 
		    		mav.addObject("repairlist", repairlist); 
	    		}
	    		System.out.println("  啊啊啊啊啊啊  ");*/
	    		mav.addObject("userinfoList", userinfoList);
	    		//mav.addObject("userjson", userjson.replaceAll("\"", "'"));
	    		mav.setViewName("/dingdingweb/HUI/repair/selectRe");
	    		
	      		return mav;
	    	

}    }
