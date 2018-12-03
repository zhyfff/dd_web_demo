package Hisign.controller.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import Hisign.dao.ContractDao;
import Hisign.dao.SaveUserIDao;
import Hisign.entity.ContractInfor;
import Hisign.entity.UserInfor;

@Controller("userfulcontroller")
public class UsefulController {
	final ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");

	final  AesEncryptUtil aesEncryptUtil = new AesEncryptUtil();
	/**
	 * 返回主页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Home")
	public String toHome(HttpServletRequest request,RedirectAttributes attributes,ModelAndView mav){
		String info=request.getParameter("info");
//		System.out.println(info);
		if (info==null) {
			return "redirect:/dingdingweb/HUI/home.jsp";
		}else {
			try {
				info=aesEncryptUtil.desEncrypt(info);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JSONObject usJson=JSONObject.parseObject(info);
			String name=usJson.getString("name");
			String userid=usJson.getString("userid");
			String avatar=usJson.getString("avatar");
//			System.out.println(name+","+userid+","+usJson);
			attributes.addFlashAttribute("name", name);
			attributes.addFlashAttribute("userid",userid);
			attributes.addFlashAttribute("avatar",avatar);
			attributes.addFlashAttribute("usJson", usJson.toString().replaceAll("\"", "'"));
//			mav.addObject("name", name);
//			mav.addObject("userid",userid);
//			mav.addObject("avatar",avatar);
//			mav.addObject("usJson", usJson.toString().replaceAll("\"", "'"));
//			mav.setViewName("/dingdingweb/HUI/home");
			
//			return mav;
			return "redirect:/dingdingweb/HUI/home.jsp";
		}
	}
	/**
	 * 跳转到消息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Message")
	public ModelAndView toMessage(HttpServletRequest request,RedirectAttributes attributes,ModelAndView mav){	
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		System.out.println(userjson);
		if (userjson.equals("undefined")) {
			
			return new ModelAndView("/dingdingweb/HUI/err");
		}else {
			JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
//			System.out.println("tonewselect"+userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			usi.setIsAdmin(js.getString("isAdmin"));
			List<UserInfor> userinfoList = new ArrayList<>();
			userinfoList.add(usi);
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.setViewName("/dingdingweb/HUI/useful/message");
//			attributes.addFlashAttribute("userinfoList", userinfoList);
//			attributes.addFlashAttribute("userjson", userjson.replaceAll("\"", "'"));
		}
		
//		return "redirect:/dingdingweb/HUI/useful/message.js";
		return mav;
	}
	
	
	
	/**
	 * 跳转到我的
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/My")
	public ModelAndView toMy(HttpServletRequest request,RedirectAttributes attributes,ModelAndView mav){
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (userjson.equals("undefined")) {
			return new ModelAndView("/dingdingweb/HUI/err");
		}else {
			JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
//			System.out.println("toMy"+userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			List<UserInfor> userinfoList = new ArrayList<>();
			userinfoList.add(usi);
//			attributes.addFlashAttribute("userinfoList", userinfoList);
//			attributes.addFlashAttribute("userjson", userjson.replaceAll("\"", "'"));
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.setViewName("/dingdingweb/HUI/useful/my");
		}
		
		return mav;	
	}
	
	
	/**
	 * 
	 * 保存个人信息
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/saveUserInfor")
	public void saveUserInfor(HttpServletRequest request,HttpServletResponse response){
		String userjson = request.getParameter("info").replaceAll("'", "\"");
//		System.out.println("saveUserInfor:" + userjson);
		if (userjson.equals("undefined")) {
			
		}else {
			JSONObject usj = JSONObject.parseObject(userjson);
			String active = usj.getString("active");
			String avatar = usj.getString("avatar");
			String department = usj.getString("department");
			String dingId = usj.getString("dingId");
			String email = usj.getString("email");
			String isAdmin = usj.getString("isAdmin");
			String isBoss = usj.getString("isBoss");
			String isHide = usj.getString("isHide");
			String isLeaderInDepts = usj.getString("isLeaderInDepts");
			String jobnumber = usj.getString("jobnumber");
			String mobile = usj.getString("mobile");
			String name = usj.getString("name");
			String orderInDepts = usj.getString("orderInDepts");
			String position = usj.getString("position");
			String remark = usj.getString("remark");
			String senior = usj.getString("senior");
			String tel = usj.getString("tel");
			String userid = usj.getString("userid");
			String workPlace = usj.getString("workPlace");
			UserInfor userinfor = new UserInfor();
			userinfor.setActive(active);
			userinfor.setAvatar(avatar);
			userinfor.setDepartment(department);
			userinfor.setDingId(dingId);
			userinfor.setEmail(email);
			userinfor.setIsAdmin(isAdmin);
			userinfor.setIsBoss(isBoss);
			userinfor.setIsHide(isHide);
			userinfor.setIsLeaderInDepts(isLeaderInDepts);
			userinfor.setJobnumber(jobnumber);
			userinfor.setMobile(mobile);
			userinfor.setName(name);
			userinfor.setOrderInDepts(orderInDepts);
			userinfor.setPosition(position);
			userinfor.setRemark(remark);
			userinfor.setSenior(senior);
			userinfor.setTel(tel);
			userinfor.setUserid(userid);
			userinfor.setWorkPlace(workPlace);
			
			ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
			SaveUserIDao saveUserIDao = ctx.getBean(SaveUserIDao.class);
			saveUserIDao.saveinfor(userinfor);
			
			try {			
				PrintWriter out = response.getWriter();
				out = response.getWriter();
				out.print("成功");
				out.flush();
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	 * 注册
	 * @param request
	 */
	@RequestMapping("/saveUserInfor/pwd")
	public String  savePwd(HttpServletRequest request ,HttpServletResponse response){
		String borrowid = request.getParameter("borrowid");
		String borrowname = request.getParameter("borrowname");
		String pwd = request.getParameter("pwd");
//		System.out.println(borrowid+","+borrowname+","+pwd);
		String result=null;
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		SaveUserIDao saveUserIDao = ctx.getBean(SaveUserIDao.class);
		try {
			pwd = getHmacMD5String(pwd,"fgdfgdaa");
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<UserInfor> u = saveUserIDao.updatepwd(borrowid, borrowname, pwd);
		Iterator<UserInfor> iterator = u.iterator();
		while (iterator.hasNext()) {
			UserInfor userInfor = (UserInfor) iterator.next();
			result = userInfor.getPwd();
		}
		return result;
		
		
	}
	
	private final static String KEY_MAC = "HmacMD5";
	private final static String UTF_8_CHARSET = "UTF-8";
	 
	public static String getHmacMD5String(String plainText, String salt) throws NoSuchAlgorithmException, InvalidKeyException, IOException {
	        String sEncodedString = null;
	        SecretKey key = new SecretKeySpec(salt.getBytes(UTF_8_CHARSET), KEY_MAC);
	        Mac mac = Mac.getInstance(KEY_MAC);
	        mac.init(key);
	         
	        byte[] bytes = mac.doFinal(plainText.getBytes(UTF_8_CHARSET));
	        StringBuffer hash = new StringBuffer();
	 
	        for (int i = 0, len = bytes.length; i < len; i++) {
	            String hex = Integer.toHexString(0xFF &  bytes[i]);
	            if (hex.length() == 1) {
	                hash.append('0');
	            }
	            hash.append(hex);
	        }
	        sEncodedString = hash.toString();
	        return sEncodedString;
	    }
	
	
	/**
	 * 
	 * 查询是否注册
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findUser")
	public void findUserpwd(HttpServletRequest request,HttpServletResponse response){
		String gh= request.getParameter("gh");
		String name = request.getParameter("name");
		SaveUserIDao saveUserIDao = ctx.getBean(SaveUserIDao.class);
		String pwd = saveUserIDao.searchpwd(gh, name);
//		System.out.println(pwd);
		String message=null;
		if (pwd==null) {
			message="未注册";
		}else {
			message = "已注册";
		}
		try {
			response.getWriter().append(message);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 到网页登录jsp
	 * @param request
	 * @param response
	 * @param mav
	 * @return
	 */
	@RequestMapping("/WebLogin/tolongin")
	public ModelAndView toLogin(HttpServletRequest request,ModelAndView mav){
		mav.setViewName("/dingdingweb/HUI/Login");
		return mav;
		
	}
	
	/**
	 * 网页登录
	 * @param request
	 * @param response
	 * @param session
	 */
	@RequestMapping("/WebLogin/longin")
	public void Login(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		String gh=request.getParameter("borrowid");
		String p=request.getParameter("pwd");
		try {
			 p= getHmacMD5String(p,"fgdfgdaa");
//			 System.out.println("p:"+p);
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pwd = null;
		String name=null;
		String userid=null;
		String avatar=null;
		SaveUserIDao saveUserIDao = ctx.getBean(SaveUserIDao.class);
		List<UserInfor> uList=saveUserIDao.searchpwdLogin(gh);
		for (UserInfor userInfor : uList) {
			pwd=userInfor.getPwd();
			name=userInfor.getName();
			userid=userInfor.getUserid();
			avatar=userInfor.getAvatar();
		}
		JSONObject useJson = new JSONObject();
		useJson.put("name",name);
		useJson.put("userid", userid);
		useJson.put("avatar", avatar);
		
//		System.err.println("pwd:"+pwd);
		session.setAttribute("useJson", useJson);
		String re=null;
		if (p.equals(pwd)) {
			request.getSession().setAttribute("isLogin", "yes");
			useJson.put("sta", "登陆成功！");
			re=useJson.toString();
		}else {
			re="帐号或密码错误";
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
	
	/**
	 * 跳转到我的账号管理
	 * @param request
	 * @return
	 */
	@RequestMapping("/Account")
	public ModelAndView toAccount(ModelAndView mav,HttpServletRequest request){
		
		String userjson=null;
		try {
			userjson = aesEncryptUtil.desEncrypt(request.getParameter("info"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (userjson.equals("undefined")) {
			mav.setViewName("/dingdingweb/HUI/err");
		}else {
			JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
//			System.out.println("toMy"+userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			usi.setJobnumber(js.getString("jobnumber"));
			List<UserInfor> userinfoList = new ArrayList<>();
			userinfoList.add(usi);
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.setViewName("/dingdingweb/HUI/useful/account");
		}
		
		return mav;	
		
	}
	
	
	/**
	 * 跳转到联系人
	 * @param request
	 * @return
	 */
	@RequestMapping("/Organization")
	public void toorganization(HttpServletRequest request,HttpServletResponse response){
//		ModelAndView mav = new ModelAndView();
//		System.out.println("Organization");
//		mav.setViewName("/dingdingweb/HUI/useful/organization");
//		System.out.println("Organization"+request.getRequestURL());
//		return mav;
		
	
		 try {
			 RequestDispatcher dispatcher = request.getRequestDispatcher("/dingdingweb/HUI/useful/organization.jsp");

			 dispatcher .forward(request, response);
		 }
		 catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
	}
	
	
	/**
	 * 跳转到我发出的
	 * @param request
	 * @return
	 */
	@RequestMapping("/Office/Useful/toMySend")
	public ModelAndView  toMySend(HttpServletRequest request){
		String userjson = request.getParameter("info");
		ModelAndView mav = new ModelAndView();
		if (userjson.equals("undefined")) {
			mav.setViewName("/dingdingweb/HUI/err");
		}else {
			JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
//			System.out.println("toMy"+userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			usi.setJobnumber(js.getString("jobnumber"));
			List<UserInfor> userinfoList = new ArrayList<>();
			userinfoList.add(usi);
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.setViewName("/dingdingweb/HUI/useful/mysend");
		}
		
		return mav;	
	}
	
	/**
	 * 跳转到我的审批
	 * @param request
	 * @return
	 */
	@RequestMapping("/Office/Useful/toMyAudit")
	public ModelAndView toMyAudit(HttpServletRequest request){
		String userjson = request.getParameter("info");
		ModelAndView mav = new ModelAndView();
		if (userjson.equals("undefined")) {
			mav.setViewName("/dingdingweb/HUI/err");
		}else {
			JSONObject js = JSONObject.parseObject(userjson.replaceAll("'", "\""));
//			System.out.println("toMy"+userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			usi.setJobnumber(js.getString("jobnumber"));
			List<UserInfor> userinfoList = new ArrayList<>();
			userinfoList.add(usi);
			mav.addObject("userinfoList", userinfoList);
			mav.addObject("userjson", userjson.replaceAll("\"", "'"));
			mav.setViewName("/dingdingweb/HUI/useful/myaudit");
		}
		
		return mav;	
	}
	
	
	
	
	
	
	
	
	/**
	 * 跳转到获取部门成员详情
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/Userlist")
	public ModelAndView toCorpUserDetail(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String did= request.getParameter("did");
		mav.addObject("departmentid", did);
		mav.setViewName("/dingdingweb/HUI/useful/userlist");
		return mav;
	}
	
	
	
	@RequestMapping(value="/searchMessageNum")
	public void searchMessageNum(HttpServletRequest request ,HttpServletResponse response) {
		
		try {
			response.getWriter().append("");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 跳转到反馈
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Feedback")
	public ModelAndView toFeedback(HttpServletRequest request){	
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
		mav.setViewName("/dingdingweb/HUI/useful/feedback");
		return mav;
	}
	
	
	public List<ContractInfor>  selectContracter(String searchkey){
//      System.out.println("start-------------------------");
      //初始化容器
      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
      //获得bean
      ContractDao contractDao = ctx.getBean(ContractDao.class);
      List<ContractInfor> contractlist = contractDao.search(searchkey);
      for(ContractInfor i: contractlist){
      }
	return contractlist;
      
  }


}
