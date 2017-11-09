package com.neu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.neu.dao.RecodeDao;
import com.neu.entity.RegisterCode;

@Controller
@SessionAttributes({ "CodeList" })
public class CodeController {
	@Autowired
	@Qualifier("RecodeDao")
	private RecodeDao RecodeDao;

	// Show all info
	@RequestMapping("jsp_backstage/showAllCode")
	public ModelAndView allGroupShow(ModelMap map, HttpServletRequest request,
			HttpServletResponse response) {
		List<RegisterCode> list = RecodeDao.getAllCode();
		request.setAttribute("list_size", list.size());
		map.addAttribute("CodeList", list);
		return new ModelAndView("jsp_backstage/code-list");
	}

	// select info by stu_number
	@RequestMapping("jsp_backstage/selectCode")
	public ModelAndView selectCodeByNo(ModelMap map,
			HttpServletRequest request, HttpServletResponse response) {
		String rc_no = request.getParameter("rc_no");
		List<RegisterCode> byno_list = RecodeDao.getCodeByNo(rc_no);
		if (byno_list.size() != 0) {
			request.setAttribute("list_size", byno_list.size());
			map.addAttribute("CodeList", byno_list);
			return new ModelAndView("jsp_backstage/code-list");
		}
		return new ModelAndView("jsp_backstage/code-list-none");
	}

	// 添加学生信息页面
	@RequestMapping("jsp_backstage/addCode")
	public ModelAndView showcodeadd(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		return new ModelAndView("jsp_backstage/code-add");
	}

	// 验证学号是否重复
	@RequestMapping("jsp_backstage/rc_notest")
	public void test(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String data;
		String rc_no = request.getParameter("rc_no");
		RegisterCode rcd = new RegisterCode();
		rcd.setRc_no(rc_no);
		if (RecodeDao.validateNo(rcd).size() == 0) {
			data = "";
		} else {
			data = "该学号已被登记";
		}
		// 设置返回的内容格式和编码方式
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(data);
	}

	// 验证注册码是否重复
	@RequestMapping("jsp_backstage/rc_codetest")
	public void test2(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String data;
		String rc_code = request.getParameter("rc_code");
		RegisterCode rcd = new RegisterCode();
		rcd.setRc_code(rc_code);
		if (RecodeDao.validateCode(rcd).size() == 0) {
			data = "";
		} else {
			data = "注册码重复";
		}
		// 设置返回的内容格式和编码方式
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(data);
	}

	// 添加信息
	@RequestMapping("jsp_backstage/insertCode")
	public ModelAndView insertGroup(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		// 获取自增id
		int rc_id = RecodeDao.selectID();

		String rc_name = request.getParameter("rc_name");
		String rc_no = request.getParameter("rc_no");
		String rc_code = request.getParameter("rc_code");
		String rc_college = request.getParameter("rc_college");
		RegisterCode rcd = new RegisterCode();
		rcd.setRc_id(rc_id);
		rcd.setRc_name(rc_name);
		rcd.setRc_no(rc_no);
		rcd.setRc_code(rc_code);
		rcd.setRc_college(rc_college);
		RecodeDao.insertCode(rcd);

		List<RegisterCode> list = RecodeDao.getAllCode();
		request.setAttribute("list_size", list.size());
		map.addAttribute("CodeList", list);
		return new ModelAndView("jsp_backstage/code-list");
	}

	// 删除
	@RequestMapping("jsp_backstage/deleteCodeById")
	public void deleteCode(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		String rc_no = request.getParameter("rc_no");
		RecodeDao.deleteCode(rc_no);
	}

	// 批量删除
	@RequestMapping("jsp_backstage/deleteCodeByID")
	public ModelAndView deleteGroup(HttpServletRequest request,
			HttpServletResponse response) {
		int rc_id = Integer.parseInt(request.getParameter("rc_id"));
		RecodeDao.deleteCodeByID(rc_id);
		return new ModelAndView("jsp_backstage/code-list");
	}

	// 更新
	@RequestMapping("jsp_backstage/updateCode")
	public ModelAndView showcodeupdate(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		String rc_no = request.getParameter("rc_noo");
		String rc_id = request.getParameter("rc_iid");
		request.setAttribute("rc_no", rc_no);
		request.setAttribute("rc_id", rc_id);
		return new ModelAndView("jsp_backstage/code-update");
	}
	@RequestMapping("jsp_backstage/updateCode2")
	public ModelAndView codeupdate(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		int rc_id = Integer.parseInt(request.getParameter("rc_id"));
		String rc_no = request.getParameter("rc_no");
		String rc_name = request.getParameter("rc_name");
		String rc_code = request.getParameter("rc_code");
		String rc_college = request.getParameter("rc_college");
		RegisterCode rcd = new RegisterCode();
		rcd.setRc_id(rc_id);
		rcd.setRc_no(rc_no);
		rcd.setRc_name(rc_name);
		rcd.setRc_code(rc_code);
		rcd.setRc_college(rc_college);
		RecodeDao.updateCodeInfo(rcd);

		List<RegisterCode> list = RecodeDao.getAllCode();
		request.setAttribute("list_size", list.size());
		map.addAttribute("CodeList", list);
		return new ModelAndView("jsp_backstage/code-list");
	}
}
