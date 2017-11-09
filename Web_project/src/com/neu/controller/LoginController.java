package com.neu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.neu.dao.HRDao;
import com.neu.dao.LoginDao;
import com.neu.entity.HrInfo;
import com.neu.entity.InformationInfo;
import com.neu.entity.RecommendInfo;
import com.neu.entity.TagInfo;

@Controller
@SessionAttributes({ "TagList","recommendList","informationList" })
public class LoginController {
	@Autowired
	private LoginDao loginDao;

	// 前台学生登录
	@RequestMapping("frontpage/f_login")
	public ModelAndView handleRequest(ModelMap map,HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		String stu_id = arg0.getParameter("email");
		String stu_password = arg0.getParameter("password");
		if (loginDao.validate(stu_id, stu_password)) {
			HttpSession session = arg0.getSession();
			session.setAttribute("username", stu_id);
			session.setAttribute("status", "student");
			session.getAttribute("username");
			List<RecommendInfo> list = loginDao.selectAllRec();
			map.addAttribute("RecommendList",list);
			List<InformationInfo> list1 = loginDao.selectAllInf();
			map.addAttribute("InformationList",list1);
			
			
			return new ModelAndView("frontpage/index");
		}
		arg0.setAttribute("error", "请检查您的学号和密码是否正确");
		return new ModelAndView("frontpage/stu_login");
	}
	// 验证学生密码
		@RequestMapping("frontpage/teststu_pass")
		public void teststu_pass(HttpServletRequest arg0,
				HttpServletResponse arg1) throws Exception {
			String data;
			String stu_id = arg0.getParameter("id");
			String stu_password = arg0.getParameter("pass");
			if (loginDao.validate(stu_id, stu_password)) {
				data = "请输入新密码";
			}else{
				data = "密码错误";
			}
			arg1.setContentType("text/xml;charset=UTF-8");
			arg1.setHeader("Cache-Control", "no-cache");
			arg1.getWriter().write(data);
		}

	// 前台HR登录
	@RequestMapping("frontpage/hr_login")
	public ModelAndView hr_login(HrInfo hif,HttpServletRequest arg0,
			HttpServletResponse arg1,TagInfo tif,ModelMap map) throws Exception {
		String h_email = arg0.getParameter("email");
		String h_password = arg0.getParameter("password");
		if (loginDao.Hr_validate(h_email, h_password)) {
			HttpSession session = arg0.getSession();
			session.setAttribute("username", h_email);
			session.setAttribute("status", "hr");
			session.getAttribute("username");
			HrInfo hif1 = new HrInfo();
			hif1.setH_email(h_email);
			hif = loginDao.selectInfoByNo(hif1);
			String auth = hif.getAuth();
			session.setAttribute("auth", auth);
			tif.setCtag_id(h_email);
			List<TagInfo> tif1 = loginDao.selectTag(tif);
			map.addAttribute("TagList", tif1);
			session.setAttribute("hr_info", hif);
			
			return new ModelAndView("frontpage/myhome");
		}
		arg0.setAttribute("error", "请检查您的邮箱和密码是否正确");
		return new ModelAndView("frontpage/hr_login");
	}
	// 验证学生密码
			@RequestMapping("frontpage/testhr_pass")
			public void testhr_pass(HttpServletRequest arg0,
					HttpServletResponse arg1) throws Exception {
				String data;
				String h_email = arg0.getParameter("h_email");
				String h_password = arg0.getParameter("pass");
				if (loginDao.Hr_validate(h_email, h_password)) {
					data = "请输入新密码";
				}else{
					data = "密码错误";
				}
				arg1.setContentType("text/xml;charset=UTF-8");
				arg1.setHeader("Cache-Control", "no-cache");
				arg1.getWriter().write(data);
			}

	// 验证码
	@RequestMapping("frontpage/testtestt")
	public void test(HttpServletRequest arg0, HttpServletResponse response,
			HttpSession httpSession) throws IOException {
		String randd = (String) httpSession.getAttribute("rand");
		String rand = arg0.getParameter("group_id");
		String data;
		if (randd.equals(rand)) {
			data = "请点击确定";
		} else {
			data = "验证码错误";
		}
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(data);
	}

	// 注销
	@RequestMapping("frontpage/cancel")
	public ModelAndView cancel(HttpServletRequest arg0, HttpServletResponse arg1) {
		HttpSession session = arg0.getSession();
		session.setAttribute("username", null);
		session.setAttribute("status", null);
		return new ModelAndView("frontpage/index");
	}

	// 后台用户登录
	@RequestMapping("jsp_backstage/b_login")
	public ModelAndView b_login(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		String username = arg0.getParameter("username");
		String password = arg0.getParameter("password");
		if (loginDao.b_validate(username, password)) {
			String status = loginDao.b_val_status(username, password);
			HttpSession session = arg0.getSession();
			session.setAttribute("bstatus", status);
			session.setAttribute("busername", username);
			return new ModelAndView("jsp_backstage/index");
		}
		arg0.setAttribute("b_error", "请检查您的用户名和密码是否正确");
		return new ModelAndView("jsp_backstage/login");
	}
	
	// 注销
		@RequestMapping("jsp_backstage/b_cancel")
		public ModelAndView b_cancel(HttpServletRequest arg0, HttpServletResponse arg1) {
			HttpSession session = arg0.getSession();
			session.setAttribute("busername", null);
			session.setAttribute("bstatus", null);
			return new ModelAndView("jsp_backstage/login");
		}
		// indexshow
		@RequestMapping("frontpage/indexshow")
		public ModelAndView indexshow(ModelMap map,HttpServletRequest arg0,
				HttpServletResponse arg1) throws Exception {
				List<RecommendInfo> list = loginDao.selectAllRec();
				map.addAttribute("RecommendList",list);
				List<InformationInfo> list1 = loginDao.selectAllInf();
				map.addAttribute("InformationList",list1);
				
				return new ModelAndView("frontpage/index");
			
		}
}
