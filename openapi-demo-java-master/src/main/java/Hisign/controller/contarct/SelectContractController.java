package Hisign.controller.contarct;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Hisign.dao.ContractDao;
import Hisign.entity.ContractInfor;
import Hisign.entity.UserInfor;

/**
 * 
 * 查询合同借用
 * @author Administrator
 *
 */
@Controller("selectContractcontroller")
public class SelectContractController {
	
	final Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 跳转到合同查询
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/Contract/SelectList")
	public ModelAndView selectContract(HttpServletRequest request) throws Exception {
		String searchkey = request.getParameter("searchkey");
		String message = "result";
		String userjson = request.getParameter("info");
		ModelAndView mad = new ModelAndView();

		List<ContractInfor> contractlist = selectContracter(searchkey);
		mad.addObject("message", message);
		mad.addObject("contractlist", contractlist);// 传入集合
		mad.setViewName("/dingdingweb/HUI/contract/newselect");
 
		if (userjson.equals("undefined")){
			mad.setViewName("/dingdingweb/HUI/err");
		}else {
			JSONObject js = JSONObject.parseObject(userjson);
			UserInfor usi = new UserInfor();
			usi.setAvatar(js.getString("avatar"));
			usi.setName(js.getString("name"));
			usi.setUserid(js.getString("userid"));
			usi.setDepartment(js.getString("department"));
			List<UserInfor> userinfoList = new ArrayList<>();
			userinfoList.add(usi);
	//		System.out.println("serachkey:"+searchkey);
			// 将数据存入modelMap
			mad.addObject("message", message);
			// mad.addObject(user);//传入实体类默认为类名的首字母小写
			mad.addObject("contractlist", contractlist);// 传入集合
			mad.addObject("userinfoList", userinfoList);
			mad.addObject("userjson", userjson.replaceAll("\"", "'"));
			mad.setViewName("/dingdingweb/HUI/contract/newselect");
		}

		return mad;

	}
	
	
	/**
	 * 搜索合同借用申请
	 * @param request
	 * @param response
	 */
	@RequestMapping("/Contract/getContractApplyinfor")
	public void getContractApply(HttpServletRequest request,HttpServletResponse response){
		String searchkey = request.getParameter("searchkey");
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 12);
		List<ContractInfor> bList = selectContracter(searchkey);
		PageInfo<ContractInfor> pageInfo = new PageInfo<ContractInfor>(bList);
//		for (ContractInfor contractInfor : bList) {
//			System.out.println("chaxu："+contractInfor.getBorrowname());
//		}
		JSONObject re = new JSONObject();
		re.put("blist", pageInfo.getList());
		re.put("pageInfo", pageInfo);
		try {			
			PrintWriter out = response.getWriter();
			out = response.getWriter();
			out.print(re);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	public List<ContractInfor>  selectContracter(String searchkey){
//        System.out.println("start-------------------------");
        //初始化容器
        ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
        //获得bean
        ContractDao contractDao = ctx.getBean(ContractDao.class);
        List<ContractInfor> contractlist = contractDao.search(searchkey);
        
		return contractlist;
        
    }

}
