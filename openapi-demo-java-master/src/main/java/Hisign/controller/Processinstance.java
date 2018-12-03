package Hisign.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.dingtalk.openapi.demo.OApiException;
import com.alibaba.dingtalk.openapi.demo.auth.AuthHelper;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.SmartworkBpmsProcessSyncRequest;
import com.dingtalk.api.request.SmartworkBpmsProcessinstanceCreateRequest;
import com.dingtalk.api.request.SmartworkBpmsProcessinstanceCreateRequest.FormComponentValueVo;
import com.dingtalk.api.response.SmartworkBpmsProcessSyncResponse;
import com.dingtalk.api.response.SmartworkBpmsProcessinstanceCreateResponse;
import com.taobao.api.ApiException;

import Hisign.dao.OfficeDao;
import Hisign.entity.CourierInfor;

@Controller("ProcessinstanceController")
public class Processinstance {
	
	
	/**
	 * 发送快递领取通知
	 * @param request
	 * @param response
	 */
	@RequestMapping("/Office/Courier/Processinstance/sendCourierNotice")
	public void sendCourierNotice(HttpServletRequest request,HttpServletResponse response){
		String UserId=request.getParameter("UserId");
		String DeptId=request.getParameter("DeptId");
		String Approver=request.getParameter("Approver");
//		System.out.println("UserId:"+UserId);
//		System.out.println("DeptId:"+DeptId);
//		System.out.println("Approver:"+Approver);
		String dcnumber=String.valueOf(System.currentTimeMillis());
		String recipients=request.getParameter("recipients");
		String express_no=request.getParameter("express-no");
		String notice_time=request.getParameter("notice-time");
		String pay_type=request.getParameter("radio");
		String notice_word=request.getParameter("notice-word");
		String express=request.getParameter("express");
//		System.out.println("recipients:"+recipients);
//		System.out.println("express-no:"+express_no);
		DingTalkClient client = new DefaultDingTalkClient("https://eco.taobao.com/router/rest");
		SmartworkBpmsProcessinstanceCreateRequest req = new SmartworkBpmsProcessinstanceCreateRequest();
//		req.setAgentId(41605932L);//企业微应用标识(可选)
		req.setProcessCode("PROC-8KYJ2QBV-XR8Y5E5SRY7K82JEHNMG2-A80PFHLJ-2");//审批流的唯一码
		req.setOriginatorUserId(UserId);//审批实例发起人的userid
		req.setDeptId(Long.parseLong(DeptId));//发起人所在的部门
		req.setApprovers(Approver);//审批人userid列表
//		req.setCcList("zhangsan,lisi");//抄送人userid列表（可选）
		req.setCcPosition("START");//抄送时间,分为（START,FINISH,START_FINISH）
		List<FormComponentValueVo> list2 = new ArrayList<FormComponentValueVo>();
		FormComponentValueVo obj3 = new FormComponentValueVo();
		obj3.setName("领取人");//表单每一栏的名称
		obj3.setValue(recipients);//表单每一栏的值
		 
		FormComponentValueVo obj4 = new FormComponentValueVo();
		obj4.setName("快递单号");
		obj4.setValue(express_no);
		
		FormComponentValueVo obj5 = new FormComponentValueVo();
		obj5.setName("通知时间");
		obj5.setValue(notice_time);
		
		FormComponentValueVo obj6 = new FormComponentValueVo();
		obj6.setName("是否到付");
		obj6.setValue(pay_type);
		
		FormComponentValueVo obj7 = new FormComponentValueVo();
		obj7.setName("通知语");
		obj7.setValue(notice_word);
		
		FormComponentValueVo obj8 = new FormComponentValueVo();
		obj8.setName("快递公司");
		obj8.setValue(express);
 
//		FormComponentValueVo mingxi2 = new FormComponentValueVo();
//		mingxi2.setName("明细第一项");
//		mingxi2.setValue("用户输入啥就是啥");
//		 
//		FormComponentValueVo mingxi3 = new FormComponentValueVo();
//		mingxi3.setName("明细第二项");
//		mingxi3.setValue("用户输入啥就是啥");
//		 
//		FormComponentValueVo mingxi4 = new FormComponentValueVo();
//		mingxi4.setName("明细第一项");
//		mingxi4.setValue("用户输入啥就是啥");
//		 
//		FormComponentValueVo mingxi5 = new FormComponentValueVo();
//		mingxi5.setName("明细第二项");
//		mingxi5.setValue("用户输入啥就是啥");
//		FormComponentValueVo obj7 = new FormComponentValueVo();
//		obj7.setName("明细");
//		obj7.setValue(JSON.toJSONString(Arrays.asList(Arrays.asList(mingxi2, mingxi3), Arrays.asList(mingxi4, mingxi5))));
		 
		list2.add(obj3);
		list2.add(obj4);
		list2.add(obj5);
		list2.add(obj6);
		list2.add(obj7);
		list2.add(obj8);
//		list2.add(obj7);
		String access_token;
		try {
			access_token = AuthHelper.getAccessToken();
			req.setFormComponentValues(list2);
			SmartworkBpmsProcessinstanceCreateResponse rsp = client.execute(req, access_token);
			System.out.println("rsp:"+rsp.getBody());
			String is_success = null;
			JSONObject jrsp = JSONObject.parseObject(rsp.getBody());
			if (jrsp.containsKey("dingtalk_smartwork_bpms_processinstance_create_response")) {
				JSONObject dingCreate_reponse=jrsp.getJSONObject("dingtalk_smartwork_bpms_processinstance_create_response");
				JSONObject result = dingCreate_reponse.getJSONObject("result");
				is_success = result.getString("is_success");
			}else {
				JSONObject error_response=jrsp.getJSONObject("error_response");
				is_success = error_response.getString("sub_msg");
			}
			
			//保存信息
			CourierInfor courier = new CourierInfor();
			courier.setDcnumber(dcnumber);
			courier.setRecipients(recipients);
			courier.setExpress_no(express_no);
			courier.setNotice_time(notice_time);
			courier.setPay_type(pay_type);
			courier.setNotice_word(notice_word);
			courier.setExpress(express);
			ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
			// 获得bean
			OfficeDao officeDao = ctx.getBean(OfficeDao.class);
			officeDao.SaveCourierNotice(courier);
			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(is_success);
			out.flush();
			out.close();
		} catch (OApiException e) {
			
			e.printStackTrace();
		} catch (ApiException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	
	
	/**
	 * 登记领取人信息
	 * @param request
	 * @return
	 */
//	@RequestMapping("/Office/SaveRelq")
	public ModelAndView Courierconfirm(HttpServletRequest request){
		String UserId=request.getParameter("UserId");
		String DeptId=request.getParameter("DeptId");
		String Approver=request.getParameter("Approver");
		
		String dcnumber=request.getParameter("dcnumber");
		String recipients=request.getParameter("recipients");
		String express_no=request.getParameter("express-no");
		String notice_time=request.getParameter("notice-time");
		String pay_type=request.getParameter("radio");
		String notice_word=request.getParameter("notice-word");
		String lq=request.getParameter("lq");
		String express=request.getParameter("express");
//		String note = request.getParameter("note");
//		String evaluation = request.getParameter("evaluation");
		DingTalkClient client = new DefaultDingTalkClient("https://eco.taobao.com/router/rest");
		SmartworkBpmsProcessinstanceCreateRequest req = new SmartworkBpmsProcessinstanceCreateRequest();
//		req.setAgentId(41605932L);//企业微应用标识(可选)
		req.setProcessCode("PROC-0KYJJ80V-PRBY1LVHUC7OI3G6S8OZ2-6EAI2MLJ-9");//审批流的唯一码
		req.setOriginatorUserId(UserId);//审批实例发起人的userid
		req.setDeptId(Long.parseLong(DeptId));//发起人所在的部门
		req.setApprovers(Approver);//审批人userid列表
//		req.setCcList("zhangsan,lisi");//抄送人userid列表（可选）
		req.setCcPosition("START");//抄送时间,分为（START,FINISH,START_FINISH）
		List<FormComponentValueVo> list2 = new ArrayList<FormComponentValueVo>();
		FormComponentValueVo obj3 = new FormComponentValueVo();
		obj3.setName("领取人");//表单每一栏的名称
		obj3.setValue(recipients);//表单每一栏的值
		 
		FormComponentValueVo obj4 = new FormComponentValueVo();
		obj4.setName("快递单号");
		obj4.setValue(express_no);
		
		FormComponentValueVo obj5 = new FormComponentValueVo();
		obj5.setName("通知时间");
		obj5.setValue(notice_time);
		
		FormComponentValueVo obj6 = new FormComponentValueVo();
		obj6.setName("是否到付");
		obj6.setValue(pay_type);
		
		FormComponentValueVo obj7 = new FormComponentValueVo();
		obj7.setName("通知语");
		obj7.setValue(notice_word);
		
		FormComponentValueVo obj8 = new FormComponentValueVo();
		obj8.setName("快递公司");
		obj8.setValue(express);
		
		FormComponentValueVo obj9 = new FormComponentValueVo();
		obj9.setName("领取人");
		obj9.setValue(lq);
		
//		FormComponentValueVo obj10 = new FormComponentValueVo();
//		obj10.setName("备注");
//		obj10.setValue(note);
//		
//		FormComponentValueVo obj11 = new FormComponentValueVo();
//		obj11.setName("评论");
//		obj11.setValue(evaluation);
		
		
		list2.add(obj3);
		list2.add(obj4);
		list2.add(obj5);
		list2.add(obj6);
		list2.add(obj7);
		list2.add(obj8);
		list2.add(obj9);
//		list2.add(obj10);
//		list2.add(obj11);
	
		
		String access_token;
		CourierInfor courier = new CourierInfor();
		String is_success = null;
		try {
			access_token = AuthHelper.getAccessToken();
			req.setFormComponentValues(list2);
			SmartworkBpmsProcessinstanceCreateResponse rsp = client.execute(req, access_token);
			System.out.println("rsp:"+rsp.getBody());
			
			JSONObject jrsp = JSONObject.parseObject(rsp.getBody());
			if (jrsp.containsKey("dingtalk_smartwork_bpms_processinstance_create_response")) {
				JSONObject dingCreate_reponse=jrsp.getJSONObject("dingtalk_smartwork_bpms_processinstance_create_response");
				JSONObject result = dingCreate_reponse.getJSONObject("result");
				is_success = result.getString("is_success");
			}else {
				JSONObject error_response=jrsp.getJSONObject("error_response");
				is_success = error_response.getString("sub_msg");
			}
			
			//保存信息
			courier.setDcnumber(dcnumber);
			courier.setRecipients(recipients);
			courier.setExpress_no(express_no);
			courier.setNotice_time(notice_time);
			courier.setPay_type(pay_type);
			courier.setNotice_word(notice_word);
			courier.setExpress(express);
			courier.setLq(lq);
			
		} catch (OApiException e) {
			
			e.printStackTrace();
		} catch (ApiException e) {
			
			e.printStackTrace();
			
		} 
		if (is_success=="true") {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
			// 获得bean
			OfficeDao officeDao = ctx.getBean(OfficeDao.class);
			officeDao.SaverRelq(courier);
			return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
		}
		return new ModelAndView("/dingdingweb/HUI/err");
		
	}
	
	
	
	
	
	
	public ModelAndView confirmCourier(HttpServletRequest request){	
		
		String dcnumber=request.getParameter("dcnumber");
		String recipients=request.getParameter("recipients");
		String express_no=request.getParameter("express-no");
		String notice_time=request.getParameter("notice-time");
		String pay_type=request.getParameter("radio");
		String notice_word=request.getParameter("notice-word");
		String lq=request.getParameter("lq");
		String express=request.getParameter("express");
//		String note = request.getParameter("note");
//		String evaluation = request.getParameter("evaluation");
		DingTalkClient client = new DefaultDingTalkClient("https://eco.taobao.com/router/rest");
		SmartworkBpmsProcessSyncRequest req = new SmartworkBpmsProcessSyncRequest();
		req.setSrcProcessCode("PROC-8KYJ2QBV-XR8Y5E5SRY7K82JEHNMG2-A80PFHLJ-2");//源审批流的唯一码
		req.setTargetProcessCode("PROC-0KYJJ80V-PRBY1LVHUC7OI3G6S8OZ2-6EAI2MLJ-9");//目标审批流的唯一码
//		req.setBizCategoryId("fab.purchase");//业务分类标识（建议采用JAVA包名的命名方式,如:com.alibaba）
//		req.setProcessName("请假审批");//审批流名称
		
		List<FormComponentValueVo> list2 = new ArrayList<FormComponentValueVo>();
		FormComponentValueVo obj3 = new FormComponentValueVo();
		obj3.setName("领取人");//表单每一栏的名称
		obj3.setValue(recipients);//表单每一栏的值
		 
		FormComponentValueVo obj4 = new FormComponentValueVo();
		obj4.setName("快递单号");
		obj4.setValue(express_no);
		
		FormComponentValueVo obj5 = new FormComponentValueVo();
		obj5.setName("通知时间");
		obj5.setValue(notice_time);
		
		FormComponentValueVo obj6 = new FormComponentValueVo();
		obj6.setName("是否到付");
		obj6.setValue(pay_type);
		
		FormComponentValueVo obj7 = new FormComponentValueVo();
		obj7.setName("通知语");
		obj7.setValue(notice_word);
		
		FormComponentValueVo obj8 = new FormComponentValueVo();
		obj8.setName("快递公司");
		obj8.setValue(express);
		
		FormComponentValueVo obj9 = new FormComponentValueVo();
		obj9.setName("领取人");
		obj9.setValue(lq);
		
//		FormComponentValueVo obj10 = new FormComponentValueVo();
//		obj10.setName("备注");
//		obj10.setValue(note);
		
//		FormComponentValueVo obj11 = new FormComponentValueVo();
//		obj11.setName("评论");
//		obj11.setValue(evaluation);
		
		
		list2.add(obj3);
		list2.add(obj4);
		list2.add(obj5);
		list2.add(obj6);
		list2.add(obj7);
		list2.add(obj8);
		list2.add(obj9);
//		list2.add(obj10);
//		list2.add(obj11);
		
		String access_token;
		CourierInfor courier = new CourierInfor();
		String success=null;
		try {
			access_token = AuthHelper.getAccessToken();
			SmartworkBpmsProcessSyncResponse rsp = client.execute(req, access_token);
			System.out.println(rsp.getBody());
			
			JSONObject jrsp = JSONObject.parseObject(rsp.getBody());
			if (jrsp.containsKey("dingtalk_smartwork_bpms_process_sync_response")) {
				JSONObject result = jrsp.getJSONObject("dingtalk_smartwork_bpms_process_sync_response");
				success=result.getString("success");
			}else {
				JSONObject error_response=jrsp.getJSONObject("error_response");
				success=error_response.getString("msg");
			}
			
			//保存信息
			courier.setDcnumber(dcnumber);
			courier.setRecipients(recipients);
			courier.setExpress_no(express_no);
			courier.setNotice_time(notice_time);
			courier.setPay_type(pay_type);
			courier.setNotice_word(notice_word);
			courier.setExpress(express);
			courier.setLq(lq);
//			courier.setNote(note);
//			courier.setEvaluation(evaluation);
			
		} catch (OApiException e) {
			e.printStackTrace();
		} catch (ApiException e) {
			e.printStackTrace();
		}
		if (success=="true") {
			ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
			// 获得bean
			OfficeDao officeDao = ctx.getBean(OfficeDao.class);
			officeDao.SaverRelq(courier);
			
			return new ModelAndView("/dingdingweb/HUI/contract/AddSuccess");
		}else {
			return new ModelAndView("/dingdingweb/HUI/err");
		}
	}

}
//PROC-0KYJJ80V-PRBY1LVHUC7OI3G6S8OZ2-6EAI2MLJ-9





