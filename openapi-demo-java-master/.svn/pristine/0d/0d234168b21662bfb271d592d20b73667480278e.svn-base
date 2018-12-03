package Hisign.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Hisign.controller.util.SessionHelper;
import Hisign.entity.User;


@Controller("MoneyController")
@RequestMapping(value="/money")
public class MoneyController {

	final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * @param sentence
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login.spr", method=RequestMethod.GET)
	public ModelAndView login(@ModelAttribute("user")User user, String validcode, HttpSession session) throws Exception {
		System.out.println(user.getLoginName());
		ModelAndView mav = new ModelAndView();
		session.setAttribute(SessionHelper.UserHandler, user);
		mav.setViewName("redirect:/mg/userIndex.jsp");
		mav.addObject("opmsg", "登录成功!");
		logger.info("登录成功!");
		return mav;
	}
	

}
