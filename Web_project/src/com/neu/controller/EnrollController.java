package com.neu.controller;

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

import com.neu.dao.EnrollDao;
import com.neu.entity.EnrollInfo;
import com.neu.entity.InformationInfo;
import com.neu.entity.RecommendInfo;

@Controller
@SessionAttributes({ "EnrollList","EnrollList1","RecommendList","InformationList" })
public class EnrollController {
	@Autowired
	@Qualifier("EnrollDao")
	private EnrollDao EnrollDao;
//后台
	// 显示所有信息
	@RequestMapping("jsp_backstage/showAllEnroll")
	public ModelAndView allEnrollShow(ModelMap map, HttpServletRequest request,
			HttpServletResponse response) {
		List<EnrollInfo> list = EnrollDao.getAllEnroll();
		request.setAttribute("list_size", list.size());
		map.addAttribute("EnrollList", list);
		return new ModelAndView("jsp_backstage/enroll-list");
	}

	// 按学号查询信息
	@RequestMapping("jsp_backstage/selectEnroll")
	public ModelAndView selectCodeByNo(ModelMap map,
			HttpServletRequest request, HttpServletResponse response) {
		String stu_id = request.getParameter("stu_id");
		List<EnrollInfo> enroll_list = EnrollDao.getEnrollByNo(stu_id);
		if (enroll_list.size() != 0) {
			request.setAttribute("list_size", enroll_list.size());
			map.addAttribute("EnrollList", enroll_list);
			return new ModelAndView("jsp_backstage/enroll-list");
		}
		return new ModelAndView("jsp_backstage/enroll-list-none");
	}

	// 删除
	@RequestMapping("jsp_backstage/deleteEnrollByNo")
	public void deleteCode(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		String stu_id = request.getParameter("stu_id");
		EnrollDao.deleteEnroll(stu_id);
	}
	
	//openExcel
	@RequestMapping("jsp_backstage/openExcel")
	public ModelAndView openExcel(ModelMap map, HttpServletRequest request,
			HttpServletResponse response) {
		List<EnrollInfo> list = EnrollDao.getAllEnroll();
		map.addAttribute("EnrollList1", list);
		return new ModelAndView("jsp_backstage/openExcel");
	}
//前台
	//显示Enroll页面
		@RequestMapping("frontpage/enroll")
		public ModelAndView enrollshow(HttpServletRequest request,
				HttpServletResponse response,EnrollInfo eif) {
			String stu_id = request.getParameter("name");
			eif.setStu_id(stu_id);
			EnrollInfo eif2 = EnrollDao.fselectEnroll(eif);
			HttpSession session = request.getSession();
			if(eif2==null){
				request.setAttribute("error", "首次填写，请务必填写正确信息");
				session.setAttribute("states", "first");
			}else{
				request.setAttribute("error", "修改信息，请确保无误后提交");
				request.setAttribute("eif", eif2);
				session.setAttribute("states", "notfirst");
			}
			return new ModelAndView("frontpage/enroll");
		}
		//添加Enroll
				@RequestMapping("frontpage/finsertEnroll")
				public ModelAndView finsertEnroll(HttpServletRequest request,
						HttpServletResponse response,EnrollInfo eif,ModelMap map) {
					String stu_id = request.getParameter("name");
					String e_name = request.getParameter("e_name");
					String e_company = request.getParameter("e_company");
					String e_position = request.getParameter("e_position");
					String e_location = request.getParameter("e_location");
					String e_salary = request.getParameter("e_salary");
					int e_id = EnrollDao.selectID();
					eif.setE_id(e_id);
					eif.setStu_id(stu_id);
					eif.setE_location(e_location);
					eif.setE_company(e_company);
					eif.setE_name(e_name);
					eif.setE_position(e_position);
					eif.setE_salary(e_salary);
					EnrollDao.finsertEnroll(eif);
					
					List<RecommendInfo> list = EnrollDao.selectAllRec();
					map.addAttribute("RecommendList",list);
					List<InformationInfo> list1 = EnrollDao.selectAllInf();
					map.addAttribute("InformationList",list1);
					return new ModelAndView("frontpage/index");
				}		
				//修改Enroll
				@RequestMapping("frontpage/fupdateEnroll")
				public ModelAndView fupdateEnroll(HttpServletRequest request,
						HttpServletResponse response,EnrollInfo eif,ModelMap map) {
					String stu_id = request.getParameter("name");
					String e_name = request.getParameter("e_name");
					String e_company = request.getParameter("e_company");
					String e_position = request.getParameter("e_position");
					String e_location = request.getParameter("e_location");
					String e_salary = request.getParameter("e_salary");
					eif.setStu_id(stu_id);
					eif.setE_location(e_location);
					eif.setE_company(e_company);
					eif.setE_name(e_name);
					eif.setE_position(e_position);
					eif.setE_salary(e_salary);
					EnrollDao.fupdateEnroll(eif);
					
					List<RecommendInfo> list = EnrollDao.selectAllRec();
					map.addAttribute("RecommendList",list);
					List<InformationInfo> list1 = EnrollDao.selectAllInf();
					map.addAttribute("InformationList",list1);
					return new ModelAndView("frontpage/index");
				}		
}
