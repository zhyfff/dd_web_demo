package Hisign.controller.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dingtalk.openapi.demo.OApiException;
import com.alibaba.dingtalk.openapi.demo.auth.AuthHelper;
import com.alibaba.dingtalk.openapi.demo.department.DepartmentHelper;
import com.alibaba.dingtalk.openapi.demo.user.UserHelper;
import com.alibaba.fastjson.JSON;
import com.dingtalk.open.client.api.model.corp.CorpUserDetail;
import com.dingtalk.open.client.api.model.corp.CorpUserDetailList;
import com.dingtalk.open.client.api.model.corp.Department;
import com.dingtalk.open.client.api.model.corp.DepartmentDetail;
@Controller("userinforcontroller")
public class UserinforController {
	
	/**
	 * 
	 * 获取用户信息
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/Userinfor/getuserinfor")

	public void userinfor(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		String userJson=null;
		 // 获取免登授权码
        String code = request.getParameter("code");
        String corpId = request.getParameter("corpid");
        System.out.println("authCode:" + code + " corpid:" + corpId);
        try {

            String accessToken = AuthHelper.getAccessToken();
            System.out.println("access token:" + accessToken);
            CorpUserDetail user = UserHelper.getUser(accessToken, UserHelper.getUserInfo(accessToken, code).getUserid());

            userJson = JSON.toJSONString(user);
            request.getSession().setAttribute("isLogin", "yes"); 
             try {			
     			PrintWriter out = response.getWriter();
     			out = response.getWriter();
     			out.print(userJson);
     			out.flush();
     			out.close();
     		} catch (IOException e) {
     			e.printStackTrace();
     		}
//             response.getWriter().append(userJson);
            
//            System.out.println("controller===userjson:" + userJson);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}
	
	
	/**
	 * 获取部门列表
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/Department/getDepartmentlist")
	public void getDepartmentList(HttpServletRequest request ,HttpServletResponse response){
		String dlJson=null;
		try {
			String accessToken = AuthHelper.getAccessToken();
			List<Department> deptList = DepartmentHelper.listDepartments(accessToken, "1");
//			Iterator<Department> it = deptList.iterator();
//			while (it.hasNext()) {
//				Department dep = (Department)it.next();
//				System.out.println(dep.getName());
//				System.out.println(dep.getAutoAddUser());
//				System.out.println(dep.getCreateDeptGroup());
//				System.out.println(dep.getId());
//				System.out.println(dep.getParentid());	
//			}
			dlJson = JSON.toJSONString(deptList);
			response.getWriter().println(dlJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	/**
	 * 
	 * 获取部门详情
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/Department/getDepartmentdetail")
	public void getDepartment(HttpServletRequest request,HttpServletResponse response){
		String depJson=null;
		String DeptId = request.getParameter("DeptId");
		try {
			String accessToken = AuthHelper.getAccessToken();
			DepartmentDetail department = DepartmentHelper.detailDepartments(accessToken, DeptId);
			depJson = JSON.toJSONString(department);
			response.getWriter().append(depJson);
//			System.out.println("controller===depJson:" + depJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取部门成员详情
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/CorpUserdetailList/getCorpUserdetail")
	public void getCorpUserDetail(HttpServletRequest request,HttpServletResponse response){
		String corpUser =null;
		long departmentId= Long.parseLong(request.getParameter("departmentId"));
		Long offset = Long.parseLong(request.getParameter("offset"));
		Integer size= Integer.parseInt(request.getParameter("size"));
		String order= request.getParameter("order");
		try {
			String accessToken = AuthHelper.getAccessToken();
			CorpUserDetailList cudl = UserHelper.getUserDetails(accessToken, departmentId, offset, size, order);
			corpUser = JSON.toJSONString(cudl);
			response.getWriter().append(corpUser);
//			System.out.println("controller===corpUser:" + corpUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
