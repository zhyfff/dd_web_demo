package Hisign.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import Hisign.dao.FeedbackDao;
import Hisign.entity.FeedbackInfor;
@Controller("feedfindController")
public class feedfindController {
	 final Logger logger = LoggerFactory.getLogger(this.getClass());
	   @RequestMapping(value = "/Feedback/toSelect",method = RequestMethod.POST)
	   	public ModelAndView toFind(HttpServletRequest request){
 		    String searchname = request.getParameter("searchname");

	   	    ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	 		FeedbackDao feedbackDao = ctx.getBean(FeedbackDao.class);
	 		List<FeedbackInfor> feedlist = feedbackDao.Find(searchname);
//	 		System.out.println(feedlist.get(0).getDctid());
	   
	   		ModelAndView mav = new ModelAndView();
	   		mav.addObject("feedlist", feedlist);
	   		mav.setViewName("/dingdingweb/HUI/feedback/select");
	   		return mav;
	   	}

}
