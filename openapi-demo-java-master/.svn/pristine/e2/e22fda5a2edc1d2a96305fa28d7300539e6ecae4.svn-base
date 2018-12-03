package Hisign.controller.process;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Hisign.dao.ProcessDao;


@Controller("SearchPointMsgController")
public class SearchPointMsgController {
	
	/**
	 * 查询待办信息数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/PointMsg")
	public void searchTodoPointMsg(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		int msg=searchTodo("待办", name);
//		System.out.println(msg);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int  searchTodo(String searchkey,String name){
      //初始化容器
      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
      //获得bean
      ProcessDao processDao = ctx.getBean(ProcessDao.class);
      int process = processDao.searchPointMsg(searchkey,name);
	return process; 
	}
	
	
	/**
	 * 查询我借用的合同数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/MyContractPointMsg")
	public void searchMyContractM(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("name");
		int msg=MyContractMsgPoint(name);
//		System.out.println(msg);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int  MyContractMsgPoint(String name){
	      //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.MyContractMsgPoint(name);
		return process; 
		}
	
	/**
	 * 查询需要领取确认的快递信息数量
	 * @param request
	 * @param response
	 */
	
	@RequestMapping("/SearchPointMsg/CourierPointMsg")
	public void searchConfirmToreceiveCourier(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("name");
		int msg=ConfirmToreceiveCourier(name);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int  ConfirmToreceiveCourier(String name){
	      //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.ConfirmToreceiveCourierPointMsg(name);
		return process; 
		}
	
	
	/**
	 * 查询我的车辆借用信息数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/getMyCarPonintMsg")
	public void searchMyCarPointMsg(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("name");
		int msg=getMyCarPointMsg(name);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public int  getMyCarPointMsg(String name){
	      //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.getMyCarPointMsg(name);
		return process; 
		}
	
	
	/**
	 * 查询我的名片信息数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/getMyBusinessCardPointMsg")
	public void searchBusinessCardPointMsg(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("name");
		int msg=getMyBusinessCardPointMsg(name);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getMyBusinessCardPointMsg(String name){
		 //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.getMyBusinessCardPointMsg(name);
		return process; 
	}
	
	/**
	 * 查询需要制作的名片信息数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/getCreateCardPointMsg")
	public void searchCreateCard(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("name");
		int msg=getCreateCard(name);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int getCreateCard(String name){
		 //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.getCreateCardPointMsg(name);
		return process; 
	}
	
	
	/**
	 * 查询我的印章证照信息数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/getMyStampPointMsg")
	public void searchMyStampPointMsg(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("name");
		int msg=getMyStampPonitMsg(name);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getMyStampPonitMsg(String name){
		 //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.getMyStampPonitMsg(name);
		return process; 
	}
	
	
	/**
	 * 获取人力服务档案借用信息数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/getMyHrContractPointMsg")
	public void searchMyHrContractPointMsg(HttpServletRequest request,HttpServletResponse response){
		String userid=request.getParameter("userid");
		int msg=getMyHrContractPointMsg(userid);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getMyHrContractPointMsg(String userid){
		 //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.getMyHrContractPointMsg(userid);
		return process; 
	}
	
	/**
	 * 查询设备借用信息数量
	 * @param request
	 * @param response
	 */
	@RequestMapping("/SearchPointMsg/getMyEBorrowPointMsg")
	public void searchMyEBorrowPointMsg(HttpServletRequest request ,HttpServletResponse response){
		String userid=request.getParameter("userid");
		int msg=getMyEBorrowPointMsg(userid);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getMyEBorrowPointMsg(String userid){
		 //初始化容器
	      ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
	      //获得bean
	      ProcessDao processDao = ctx.getBean(ProcessDao.class);
	      int process = processDao.getMyEBorrowPointMsg(userid);
		return process; 
	}
	

}
