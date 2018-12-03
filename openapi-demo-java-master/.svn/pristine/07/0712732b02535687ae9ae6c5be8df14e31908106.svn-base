package Hisign.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Hisign.Service.LoginService;
import Hisign.controller.util.SessionHelper;
import Hisign.entity.User;


@Controller("loginController")
@RequestMapping(value="/login")
public class LoginController {

	final Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private LoginService LoginService;
    
	@RequestMapping(value="/loginJurisdiction", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user")User user, String validcode, HttpSession session) throws Exception {
		System.out.println(user.getLoginName());
		ModelAndView mav = new ModelAndView();
		List i=LoginService.managerSearch(user.getLoginName(), user.getPassWord());
		if(i.size()>0){
			session.setAttribute(SessionHelper.UserHandler, user);
			mav.setViewName("redirect:/mg/userIndex.jsp");
			mav.addObject("opmsg", "登录成功!");
			logger.info("登录成功!");
		}else{
			mav.setViewName("redirect:/login.jsp");
		}
		return mav;
	}
	

}
