package Hisign.controller;


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


import Hisign.dao.StandbyDAO;

import Hisign.entity.StandbyInfor;
@Controller("StandbyFindController")
public class StandbyFindController {
	 final Logger logger = LoggerFactory.getLogger(this.getClass());	    
     @RequestMapping(value = "/Service/FindList",method = RequestMethod.POST)
public ModelAndView findStandBy(@ModelAttribute("StandbyInfor") StandbyInfor standbyInfor,HttpServletRequest request) throws Exception{
    	 
  	   String find_firstdate= request.getParameter("selectdate"); 	   
  	   ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
        StandbyDAO stand = ctx.getBean(StandbyDAO.class);
        List<StandbyInfor> findlist = stand.search(find_firstdate);
       ModelAndView mad = new ModelAndView();
       mad.addObject("findlist", findlist);// 传入集合
       mad.setViewName("/dingdingweb/HUI/service/finded");

  	   return mad;
     }
}
	