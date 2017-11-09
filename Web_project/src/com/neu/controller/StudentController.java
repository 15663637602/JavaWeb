package com.neu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.neu.dao.StudentDao;
import com.neu.entity.BadInfo;
import com.neu.entity.DeliveryInfo;
import com.neu.entity.FadInfo;
import com.neu.entity.HrInfo;
import com.neu.entity.PositionInfo;
import com.neu.entity.RegisterCode;
import com.neu.entity.StudentInfo;
import com.neu.entity.TagInfo;

@Controller
@SessionAttributes({"PositionList","Stu_delivery","AdList","BADList"})
public class StudentController {
	@Autowired
	@Qualifier("StudentDao")
	private StudentDao StudentDao;

	// 找回密码
	@RequestMapping("frontpage/StuRetrieve")
	public ModelAndView StuRetrieve(ModelMap map, HttpServletRequest request,
			HttpServletResponse response) {
		String rc_code = request.getParameter("email");
		String pass = StudentDao.getPassBycode(rc_code);
		if (pass != null) {
			request.setAttribute("pass", pass);
			return new ModelAndView("frontpage/reset2");
		}
		request.setAttribute("error", "您输入的注册码有误");
		return new ModelAndView("frontpage/reset");
	}

	// 验证注册码
	@RequestMapping("frontpage/testcode")
	public void TestCode(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data;
		String stu_code = request.getParameter("stu_code");
		RegisterCode rsc = new RegisterCode();
		rsc.setRc_code(stu_code);
		if (StudentDao.validateCode(rsc) == null) {
			data = "注册码不存在";
		} else {
			data = "该注册码可用";
		}
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(data);
	}

	// 验证学号
	@RequestMapping("frontpage/testno")
	public void TestNo(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String data;
		String stu_code = request.getParameter("stu_code");
		String stu_no = request.getParameter("stu_no");
		RegisterCode rsc = new RegisterCode();
		rsc.setRc_code(stu_code);
		rsc.setRc_no(stu_no);
		StudentInfo sti = new StudentInfo();
		sti.setStu_id(stu_no);
		if (StudentDao.validateNo(rsc) == null) {
			data = "学号与注册码不匹配!";
		} else if (StudentDao.validateNo2(sti) != null) {
			data = "该学号已被注册!";
		} else {
			data = "可以注册";
		}
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(data);
	}

	// 自增学生
	@RequestMapping("frontpage/insertStu")
	public ModelAndView insertStu(StudentInfo sif, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String stu_id = request.getParameter("idnum");
		String stu_password = request.getParameter("password");
		String rc_code = request.getParameter("idpassword");
		
		int s_id = StudentDao.selectID();
		Date d = new Date();
		sif.setDate(d);
		sif.setS_id(s_id);
		sif.setStu_id(stu_id);
		sif.setStu_password(stu_password);
		sif.setRc_code(rc_code);
		StudentDao.insertStu(sif);

		request.setAttribute("error", "注册成功!");
		return new ModelAndView("frontpage/stu_login");
	}

	// 学生简历管理页面
	@RequestMapping("frontpage/jianli")
	public ModelAndView jianli(StudentInfo sif, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		
		String stu_no = request.getParameter("name");
		sif = StudentDao.selectInfoByNo(stu_no);
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif.getDate());
		request.setAttribute("date",date);
		request.setAttribute("stu_info",sif);
		HttpSession session = request.getSession();
		session.setAttribute("exp_work", sif.getStu_exp_city());
		session.setAttribute("stu_work_name", sif.getStu_work_name());
		session.setAttribute("stu_inter_name", sif.getStu_inter_name());
		session.setAttribute("stu_undergraduate_name", sif.getStu_undergraduate_name());
		session.setAttribute("stu_college", sif.getStu_college());
		session.setAttribute("stu_descr", sif.getStu_descr());
		session.setAttribute("score", sif.getStu_resumeScore());
		session.setAttribute("profile", sif.getStu_profile());
		
		return new ModelAndView("frontpage/jianli");
	}

	// 更新简历标题
		@RequestMapping("frontpage/updateRN")
		public ModelAndView updateRN(StudentInfo sif, HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			String stu_no = request.getParameter("name");
			String stu_jianli_title = request.getParameter("resumeName");
			StudentInfo sif2 = new StudentInfo();
			sif2.setStu_id(stu_no);
			sif2.setStu_jianli_title(stu_jianli_title);
			Date d = new Date();
			sif2.setDate(d);
			StudentDao.updateRNByNo(sif2);
			sif = StudentDao.selectInfoByNo(stu_no);
			request.setAttribute("stu_info",sif);		
			HttpSession session = request.getSession();
			session.setAttribute("exp_work", sif.getStu_exp_city());
			session.setAttribute("stu_work_name", sif.getStu_work_name());
			session.setAttribute("stu_inter_name", sif.getStu_inter_name());
			session.setAttribute("stu_undergraduate_name", sif.getStu_undergraduate_name());
			session.setAttribute("stu_college", sif.getStu_college());
			session.setAttribute("stu_descr", sif.getStu_descr());
			session.setAttribute("score", sif.getStu_resumeScore());
			
			String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif.getDate());
			request.setAttribute("date",date);
			return new ModelAndView("frontpage/jianli");
		}
		
		// 更新基本信息
				@RequestMapping("frontpage/updatebasic")
				public ModelAndView updatebasic(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_name = request.getParameter("namess");
					String stu_sex = request.getParameter("genderss");
					String stu_college = request.getParameter("collegeee");
					String stu_tel = request.getParameter("telss");
					String stu_email = request.getParameter("emailss");
					Date d = new Date();
					sif.setStu_id(stu_no);
					sif.setStu_name(stu_name);
					sif.setStu_sex(stu_sex);
					sif.setStu_college(stu_college);
					sif.setStu_tel(stu_tel);
					sif.setStu_email(stu_email);
					sif.setDate(d);
					StudentDao.updateBasicByNo(sif);
					
					sif = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif.getStu_exp_city());
					session.setAttribute("stu_work_name", sif.getStu_work_name());
					session.setAttribute("stu_inter_name", sif.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif.getStu_college());
					session.setAttribute("stu_descr", sif.getStu_descr());
					session.setAttribute("score", sif.getStu_resumeScore());
					
					String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif.getDate());
					request.setAttribute("date",date);
					
					return new ModelAndView("frontpage/jianli");
				}
				
				// 更新期望信息
				@RequestMapping("frontpage/updateExps")
				public ModelAndView updateExps(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					int scores = StudentDao.selectScore(stu_no);
					int score = scores + 20;
					String stu_exp_city = request.getParameter("expectCity");
					String stu_exp_type = request.getParameter("type");
					String stu_exp_pos = request.getParameter("expectPosition");
					String stu_exp_salary = request.getParameter("salaryeee");
					sif.setStu_id(stu_no);
					sif.setStu_exp_city(stu_exp_city);
					sif.setStu_exp_pos(stu_exp_pos);
					sif.setStu_exp_type(stu_exp_type);
					sif.setStu_exp_salary(stu_exp_salary);
					sif.setStu_resumeScore(score);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateExpByNos(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}
				@RequestMapping("frontpage/updateExp")
				public ModelAndView updateExp(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_exp_city = request.getParameter("cityeee");
					String stu_exp_type = request.getParameter("type");
					String stu_exp_pos = request.getParameter("expectPosition");
					String stu_exp_salary = request.getParameter("salaryeee");
					sif.setStu_id(stu_no);
					sif.setStu_exp_city(stu_exp_city);
					sif.setStu_exp_pos(stu_exp_pos);
					sif.setStu_exp_type(stu_exp_type);
					sif.setStu_exp_salary(stu_exp_salary);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateExpByNo(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}
				
				// 更新工作经历信息
				@RequestMapping("frontpage/updateExperiences")
				public ModelAndView updateExperiences(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					int scores = StudentDao.selectScore(stu_no);
					int score = scores + 20;
					String stu_work_name = request.getParameter("companyName");
					String stu_work_pos = request.getParameter("positionName");
					String stu_work_sta_y = request.getParameter("companyYearStart");
					String stu_work_sta_m = request.getParameter("companyMonthStart");
					String stu_work_end_y = request.getParameter("companyYearEnd");
					String stu_work_end_m = request.getParameter("companyMonthEnd");
					sif.setStu_id(stu_no);
					sif.setStu_work_name(stu_work_name);
					sif.setStu_work_pos(stu_work_pos);
					sif.setStu_work_sta_y(stu_work_sta_y);
					sif.setStu_work_sta_m(stu_work_sta_m);
					sif.setStu_work_end_y(stu_work_end_y);
					sif.setStu_work_end_m(stu_work_end_m);
					sif.setStu_resumeScore(score);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateExperienceByNos(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}
				@RequestMapping("frontpage/updateExperience")
				public ModelAndView updateExperience(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_work_name = request.getParameter("companyName");
					String stu_work_pos = request.getParameter("positionName");
					String stu_work_sta_y = request.getParameter("companyYearStart");
					String stu_work_sta_m = request.getParameter("companyMonthStart");
					String stu_work_end_y = request.getParameter("companyYearEnd");
					String stu_work_end_m = request.getParameter("companyMonthEnd");
					sif.setStu_id(stu_no);
					sif.setStu_work_name(stu_work_name);
					sif.setStu_work_pos(stu_work_pos);
					sif.setStu_work_sta_y(stu_work_sta_y);
					sif.setStu_work_sta_m(stu_work_sta_m);
					sif.setStu_work_end_y(stu_work_end_y);
					sif.setStu_work_end_m(stu_work_end_m);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateExperienceByNo(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}
				
				// 更新项目经历信息
				@RequestMapping("frontpage/updateprojects")
				public ModelAndView updateProjects(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					int scores = StudentDao.selectScore(stu_no);
					int score = scores + 20;
					String stu_inter_name = request.getParameter("projectName");
					String stu_inter_pos = request.getParameter("thePost");
					String stu_inter_sta_y = request.getParameter("projectYearStart");
					String stu_inter_sta_m = request.getParameter("projectMonthStart");
					String stu_inter_end_y = request.getParameter("projectYearEnd");
					String stu_inter_end_m = request.getParameter("projectMonthEnd");
					String stu_inter_descr = request.getParameter("projectDescription");
					sif.setStu_id(stu_no);
					sif.setStu_inter_name(stu_inter_name);
					sif.setStu_inter_pos(stu_inter_pos);
					sif.setStu_inter_sta_y(stu_inter_sta_y);
					sif.setStu_inter_sta_m(stu_inter_sta_m);
					sif.setStu_inter_end_y(stu_inter_end_y);
					sif.setStu_inter_end_m(stu_inter_end_m);
					sif.setStu_inter_descr(stu_inter_descr);
					sif.setStu_resumeScore(score);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateProjectByNos(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}		
				@RequestMapping("frontpage/updateproject")
				public ModelAndView updateProject(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_inter_name = request.getParameter("projectName");
					String stu_inter_pos = request.getParameter("thePost");
					String stu_inter_sta_y = request.getParameter("projectYearStart");
					String stu_inter_sta_m = request.getParameter("projectMonthStart");
					String stu_inter_end_y = request.getParameter("projectYearEnd");
					String stu_inter_end_m = request.getParameter("projectMonthEnd");
					String stu_inter_descr = request.getParameter("projectDescription");
					sif.setStu_id(stu_no);
					sif.setStu_inter_name(stu_inter_name);
					sif.setStu_inter_pos(stu_inter_pos);
					sif.setStu_inter_sta_y(stu_inter_sta_y);
					sif.setStu_inter_sta_m(stu_inter_sta_m);
					sif.setStu_inter_end_y(stu_inter_end_y);
					sif.setStu_inter_end_m(stu_inter_end_m);
					sif.setStu_inter_descr(stu_inter_descr);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateProjectByNo(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}		
				
				// 更新学历信息
				@RequestMapping("frontpage/updateEdus")
				public ModelAndView updateEdus(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_colleges = request.getParameter("colle");
					int scores = StudentDao.selectScore(stu_no);
					int score = scores + 20;
					sif.setStu_id(stu_no);
					if("doc".equals(stu_colleges)){
						String stu_undergraduate_name = request.getParameter("schoolName");
						String stu_undergraduate_major = request.getParameter("professionalName");
						String stu_undergraduate_sta = request.getParameter("schoolYearStart");
						String stu_undergraduate_end = request.getParameter("schoolYearEnd");
						String stu_master_name = request.getParameter("MschoolName");
						String stu_master_major = request.getParameter("MprofessionalName");
						String stu_master_sta = request.getParameter("MschoolYearStart");
						String stu_master_end = request.getParameter("MschoolYearEnd");
						String stu_doctor_name = request.getParameter("DschoolName");
						String stu_doctor_major = request.getParameter("DprofessionalName");
						String stu_doctor_sta = request.getParameter("DschoolYearStart");
						String stu_doctor_end = request.getParameter("DschoolYearEnd");
						sif.setStu_undergraduate_name(stu_undergraduate_name);
						sif.setStu_undergraduate_major(stu_undergraduate_major);
						sif.setStu_undergraduate_sta(stu_undergraduate_sta);
						sif.setStu_undergraduate_end(stu_undergraduate_end);
						sif.setStu_master_name(stu_master_name);
						sif.setStu_master_major(stu_master_major);
						sif.setStu_master_sta(stu_master_sta);
						sif.setStu_master_end(stu_master_end);
						sif.setStu_doctor_name(stu_doctor_name);
						sif.setStu_doctor_major(stu_doctor_major);
						sif.setStu_doctor_sta(stu_doctor_sta);
						sif.setStu_doctor_end(stu_doctor_end);
						Date d = new Date();
						sif.setDate(d);
						sif.setStu_resumeScore(score);
						StudentDao.updateEduByDocs(sif);
					}else if("mas".equals(stu_colleges)){
						String stu_undergraduate_name = request.getParameter("schoolName");
						String stu_undergraduate_major = request.getParameter("professionalName");
						String stu_undergraduate_sta = request.getParameter("schoolYearStart");
						String stu_undergraduate_end = request.getParameter("schoolYearEnd");
						String stu_master_name = request.getParameter("MschoolName");
						String stu_master_major = request.getParameter("MprofessionalName");
						String stu_master_sta = request.getParameter("MschoolYearStart");
						String stu_master_end = request.getParameter("MschoolYearEnd");
						sif.setStu_undergraduate_name(stu_undergraduate_name);
						sif.setStu_undergraduate_major(stu_undergraduate_major);
						sif.setStu_undergraduate_sta(stu_undergraduate_sta);
						sif.setStu_undergraduate_end(stu_undergraduate_end);
						sif.setStu_master_name(stu_master_name);
						sif.setStu_master_major(stu_master_major);
						sif.setStu_master_sta(stu_master_sta);
						sif.setStu_master_end(stu_master_end);
						Date d = new Date();
						sif.setDate(d);
						sif.setStu_resumeScore(score);
						StudentDao.updateEduByMass(sif);
					}else if("und".equals(stu_colleges)){
						String stu_undergraduate_name = request.getParameter("schoolName");
						String stu_undergraduate_major = request.getParameter("professionalName");
						String stu_undergraduate_sta = request.getParameter("schoolYearStart");
						String stu_undergraduate_end = request.getParameter("schoolYearEnd");
						sif.setStu_undergraduate_name(stu_undergraduate_name);
						sif.setStu_undergraduate_major(stu_undergraduate_major);
						sif.setStu_undergraduate_sta(stu_undergraduate_sta);
						sif.setStu_undergraduate_end(stu_undergraduate_end);
						Date d = new Date();
						sif.setDate(d);
						sif.setStu_resumeScore(score);
						StudentDao.updateEduByUnds(sif);
					}
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}	
				@RequestMapping("frontpage/updateEdu")
				public ModelAndView updateEdu(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_colleges = request.getParameter("colle");
					sif.setStu_id(stu_no);
					if("doc".equals(stu_colleges)){
						String stu_undergraduate_name = request.getParameter("schoolName");
						String stu_undergraduate_major = request.getParameter("professionalName");
						String stu_undergraduate_sta = request.getParameter("schoolYearStart");
						String stu_undergraduate_end = request.getParameter("schoolYearEnd");
						String stu_master_name = request.getParameter("MschoolName");
						String stu_master_major = request.getParameter("MprofessionalName");
						String stu_master_sta = request.getParameter("MschoolYearStart");
						String stu_master_end = request.getParameter("MschoolYearEnd");
						String stu_doctor_name = request.getParameter("DschoolName");
						String stu_doctor_major = request.getParameter("DprofessionalName");
						String stu_doctor_sta = request.getParameter("DschoolYearStart");
						String stu_doctor_end = request.getParameter("DschoolYearEnd");
						sif.setStu_undergraduate_name(stu_undergraduate_name);
						sif.setStu_undergraduate_major(stu_undergraduate_major);
						sif.setStu_undergraduate_sta(stu_undergraduate_sta);
						sif.setStu_undergraduate_end(stu_undergraduate_end);
						sif.setStu_master_name(stu_master_name);
						sif.setStu_master_major(stu_master_major);
						sif.setStu_master_sta(stu_master_sta);
						sif.setStu_master_end(stu_master_end);
						sif.setStu_doctor_name(stu_doctor_name);
						sif.setStu_doctor_major(stu_doctor_major);
						sif.setStu_doctor_sta(stu_doctor_sta);
						sif.setStu_doctor_end(stu_doctor_end);
						Date d = new Date();
						sif.setDate(d);
						StudentDao.updateEduByDoc(sif);
					}else if("mas".equals(stu_colleges)){
						String stu_undergraduate_name = request.getParameter("schoolName");
						String stu_undergraduate_major = request.getParameter("professionalName");
						String stu_undergraduate_sta = request.getParameter("schoolYearStart");
						String stu_undergraduate_end = request.getParameter("schoolYearEnd");
						String stu_master_name = request.getParameter("MschoolName");
						String stu_master_major = request.getParameter("MprofessionalName");
						String stu_master_sta = request.getParameter("MschoolYearStart");
						String stu_master_end = request.getParameter("MschoolYearEnd");
						sif.setStu_undergraduate_name(stu_undergraduate_name);
						sif.setStu_undergraduate_major(stu_undergraduate_major);
						sif.setStu_undergraduate_sta(stu_undergraduate_sta);
						sif.setStu_undergraduate_end(stu_undergraduate_end);
						sif.setStu_master_name(stu_master_name);
						sif.setStu_master_major(stu_master_major);
						sif.setStu_master_sta(stu_master_sta);
						sif.setStu_master_end(stu_master_end);
						Date d = new Date();
						sif.setDate(d);
						StudentDao.updateEduByMas(sif);
					}else if("und".equals(stu_colleges)){
						String stu_undergraduate_name = request.getParameter("schoolName");
						String stu_undergraduate_major = request.getParameter("professionalName");
						String stu_undergraduate_sta = request.getParameter("schoolYearStart");
						String stu_undergraduate_end = request.getParameter("schoolYearEnd");
						sif.setStu_undergraduate_name(stu_undergraduate_name);
						sif.setStu_undergraduate_major(stu_undergraduate_major);
						sif.setStu_undergraduate_sta(stu_undergraduate_sta);
						sif.setStu_undergraduate_end(stu_undergraduate_end);
						Date d = new Date();
						sif.setDate(d);
						StudentDao.updateEduByUnd(sif);
					}
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}	
				
				// 更新自我描述信息
				@RequestMapping("frontpage/updateDescrs")
				public ModelAndView updateDescrs(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_descr = request.getParameter("selfDescription");
					int scores = StudentDao.selectScore(stu_no);
					int score = scores + 20;
					sif.setStu_id(stu_no);
					sif.setStu_descr(stu_descr);
					sif.setStu_resumeScore(score);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateDescrByNos(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}
				@RequestMapping("frontpage/updateDescr")
				public ModelAndView updateDescr(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_no = request.getParameter("name");
					String stu_descr = request.getParameter("selfDescription");
					sif.setStu_id(stu_no);
					sif.setStu_descr(stu_descr);
					Date d = new Date();
					sif.setDate(d);
					StudentDao.updateDescrByNo(sif);
					StudentInfo sif2 = new StudentInfo();
					sif2 = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif2);
					HttpSession session = request.getSession();
					session.setAttribute("exp_work", sif2.getStu_exp_city());
					session.setAttribute("stu_work_name", sif2.getStu_work_name());
					session.setAttribute("stu_inter_name", sif2.getStu_inter_name());
					session.setAttribute("stu_undergraduate_name", sif2.getStu_undergraduate_name());
					session.setAttribute("stu_college", sif2.getStu_college());
					session.setAttribute("stu_descr", sif2.getStu_descr());
					session.setAttribute("score", sif2.getStu_resumeScore());
					
					String dates = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif2.getDate());
					request.setAttribute("date",dates);
					return new ModelAndView("frontpage/jianli");
				}
				
				@RequestMapping("frontpage/stu_Upload")  
				public String ProfileUpload(@RequestParam("uname") String uname, @RequestParam MultipartFile[] myfiles, HttpServletRequest request, HttpServletResponse response) throws IOException{
					//可以在上传文件的同时接收其它参数
					//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
					//这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
					String realPath = "C:"+File.separator+"Users"+File.separator+"Curry"+File.separator+"Desktop"+File.separator+"workspace"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"frontpage"+File.separator+"style"+File.separator+"stu_profile";
					String realsPath = request.getSession().getServletContext().getRealPath("/frontpage/style/stu_profile");
					String realssPath = request.getSession().getServletContext().getRealPath("/stu");
					//设置响应给前台内容的数据格式
					response.setContentType("text/plain; charset=UTF-8");
					//设置响应给前台内容的PrintWriter对象
					PrintWriter out = response.getWriter();
					//上传文件的原名(即上传前的文件名字)
					String originalFilename = null;
					//如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
					//如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
					//上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件
					for(MultipartFile myfile : myfiles){
						if(myfile.isEmpty()){
							out.print("1`请选择文件后上传");
							out.flush();
							return null;
						}else{
							originalFilename = myfile.getOriginalFilename();
							try {
								//这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
								//此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
								FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, uname+originalFilename));
								FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realsPath, uname+originalFilename));
								FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realssPath, uname+originalFilename));
							} catch (IOException e) {
								System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
								e.printStackTrace();
								out.print("1`文件上传失败，请重试！！");
								out.flush();
								return null;
							}
						}
					}
					String profile = "style/stu_profile/"+uname+originalFilename;
					StudentInfo sif = new StudentInfo();
					sif.setStu_id(uname);
					sif.setStu_profile(profile);
					StudentDao.updateProfile(sif);
					//此时在Windows下输出的是[D:\Develop\apache-tomcat-6.0.36\webapps\AjaxFileUpload\\upload\愤怒的小鸟.jpg]
				//	System.out.println(realPath + "\\" + originalFilename);
					//此时在Windows下输出的是[/AjaxFileUpload/upload/愤怒的小鸟.jpg]
				//	System.out.println(originalFilename);
					//不推荐返回[realPath + "\\" + originalFilename]的值
					//因为在Windows下<img src="file:///D:/aa.jpg">能被firefox显示,而<img src="D:/aa.jpg">firefox是不认的
					out.print("0`" + request.getContextPath() + "/stu/" +uname + originalFilename);
					out.flush();
					return null;
				}
				// 修改密码
				@RequestMapping("frontpage/stu_updatepass")
				public ModelAndView stu_updatepass(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String stu_id = request.getParameter("name");
					String stu_password = request.getParameter("newpassword");
					sif.setStu_id(stu_id);
					sif.setStu_password(stu_password);
					StudentDao.updatePass(sif);

					return new ModelAndView("frontpage/index");
				}
				// showposition
				@RequestMapping("frontpage/positionshow")
				public ModelAndView positionshow(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					List<PositionInfo> list = StudentDao.getAllPos();
					request.setAttribute("begin",0);
					request.setAttribute("end",5);
					request.setAttribute("p_loc","全国");
					map.addAttribute("PositionList",list);

					return new ModelAndView("frontpage/position");
				}
				// selectposition
				@RequestMapping("frontpage/selectPos")
				public ModelAndView selectPos(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String p_name = request.getParameter("titlesss");
					List<PositionInfo> list = StudentDao.getPos(p_name);
					request.setAttribute("p_name_storage",p_name);
					request.setAttribute("begin",0);
					request.setAttribute("end",5);
					request.setAttribute("p_loc","全国");
					map.addAttribute("PositionList",list);
					if(list.size()!=0){
						return new ModelAndView("frontpage/position");
					}else{
						return new ModelAndView("frontpage/position-none");
					}

					
				}
				// selectpositions
				@RequestMapping("frontpage/selectPoss")
				public ModelAndView selectPoss(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String p_name = request.getParameter("search_input");
					List<PositionInfo> list = StudentDao.getPos(p_name);
					request.setAttribute("p_name_storage",p_name);
					request.setAttribute("begin",0);
					request.setAttribute("end",5);
					request.setAttribute("p_loc","全国");
					map.addAttribute("PositionList",list);
					if(list.size()!=0){
						return new ModelAndView("frontpage/position");
					}else{
						return new ModelAndView("frontpage/position-none");
					}

					
				}
				// selectposition2
				@RequestMapping("frontpage/selectPos2")
				public ModelAndView selectPos2(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String p_name = request.getParameter("search_input");
					String p_loc = request.getParameter("p_loc");
					PositionInfo pif = new PositionInfo();
					if("全国".equals(p_loc)){
						List<PositionInfo> list = StudentDao.getPos(p_name);
						request.setAttribute("p_name_storage",p_name);
						request.setAttribute("p_loc",p_loc);
						request.setAttribute("begin",0);
						request.setAttribute("end",5);
						map.addAttribute("PositionList",list);
						if(list.size()!=0){
							return new ModelAndView("frontpage/position");
						}else{
							return new ModelAndView("frontpage/position-none");
						}
					}else{
						pif.setP_name(p_name);
						pif.setP_loc(p_loc);
						List<PositionInfo> list = StudentDao.getPoss(pif);
						request.setAttribute("p_name_storage",p_name);
						request.setAttribute("p_loc",p_loc);
						request.setAttribute("begin",0);
						request.setAttribute("end",5);
						map.addAttribute("PositionList",list);
						if(list.size()!=0){
							return new ModelAndView("frontpage/position");
						}else{
							return new ModelAndView("frontpage/position-none");
						}
					}
					
				}
				// nextposition
				@RequestMapping("frontpage/nextposition")
				public ModelAndView nextposition(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String p_name = request.getParameter("search_input");
					String p_loc = request.getParameter("p_loc");
					int obegin = Integer.parseInt(request.getParameter("begin"));
					int oend = Integer.parseInt(request.getParameter("end"));
					int begin = obegin + 5;
					int end = oend + 5;
					PositionInfo pif = new PositionInfo();
					pif.setBegin(begin);
					pif.setEnd(end);
					pif.setP_name(p_name);
					if("全国".equals(p_loc)){
						List<PositionInfo> list = StudentDao.getnPos(pif);
						request.setAttribute("p_name_storage",p_name);
						request.setAttribute("p_loc",p_loc);
						request.setAttribute("begin",begin);
						request.setAttribute("end",end);
						map.addAttribute("PositionList",list);
						if(list.size()!=0){
							return new ModelAndView("frontpage/position");
						}else{
							return new ModelAndView("frontpage/position-none");
						}
					}else{
						pif.setP_loc(p_loc);
						List<PositionInfo> list = StudentDao.getnPoss(pif);
						request.setAttribute("p_name_storage",p_name);
						request.setAttribute("p_loc",p_loc);
						request.setAttribute("begin",begin);
						request.setAttribute("end",end);
						map.addAttribute("PositionList",list);
						if(list.size()!=0){
							return new ModelAndView("frontpage/position");
						}else{
							return new ModelAndView("frontpage/position-none");
						}
					}
					
				}
				// uponposition
				@RequestMapping("frontpage/uponposition")
				public ModelAndView uponposition(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String p_name = request.getParameter("search_input");
					String p_loc = request.getParameter("p_loc");
					int obegin = Integer.parseInt(request.getParameter("begin"));
					int oend = Integer.parseInt(request.getParameter("end"));
					int begin = obegin - 5;
					int end = oend - 5;
					PositionInfo pif = new PositionInfo();
					pif.setBegin(begin);
					pif.setEnd(end);
					pif.setP_name(p_name);
					if(begin<0){
						request.setAttribute("p_name_storage",p_name);
						request.setAttribute("p_loc",p_loc);
						request.setAttribute("begin",-5);
						request.setAttribute("end",0);
						return new ModelAndView("frontpage/position-none");
					}else{
					if("全国".equals(p_loc)){
						List<PositionInfo> list = StudentDao.getnPos(pif);
						request.setAttribute("p_name_storage",p_name);
						request.setAttribute("p_loc",p_loc);
						request.setAttribute("begin",begin);
						request.setAttribute("end",end);
						map.addAttribute("PositionList",list);
						if(list.size()!=0){
							return new ModelAndView("frontpage/position");
						}else{
							return new ModelAndView("frontpage/position-none");
						}
					}else{
						pif.setP_loc(p_loc);
						List<PositionInfo> list = StudentDao.getnPoss(pif);
						request.setAttribute("p_name_storage",p_name);
						request.setAttribute("p_loc",p_loc);
						request.setAttribute("begin",begin);
						request.setAttribute("end",end);
						map.addAttribute("PositionList",list);
						if(list.size()!=0){
							return new ModelAndView("frontpage/position");
						}else{
							return new ModelAndView("frontpage/position-none");
						}
					}
					}
					
				}
				/*@RequestMapping("frontpage/uploadresume")  
				public String uploadresum(@RequestParam("name") String uname, @RequestParam MultipartFile[] myfiles, HttpServletRequest request, HttpServletResponse response) throws IOException{
					//可以在上传文件的同时接收其它参数
					//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
					//这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
					String realPath = "C:"+File.separator+"Users"+File.separator+"Curry"+File.separator+"Desktop"+File.separator+"workspace"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"frontpage"+File.separator+"style"+File.separator+"resume";
					String realsPath = request.getSession().getServletContext().getRealPath("/frontpage/style/resume");
					String realssPath = request.getSession().getServletContext().getRealPath("/stu");
					//设置响应给前台内容的数据格式
					response.setContentType("text/plain; charset=UTF-8");
					//设置响应给前台内容的PrintWriter对象
					PrintWriter out = response.getWriter();
					//上传文件的原名(即上传前的文件名字)
					String originalFilename = null;
					//如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
					//如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
					//上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件
					for(MultipartFile myfile : myfiles){
						if(myfile.isEmpty()){
							out.print("1`请选择文件后上传");
							out.flush();
							return null;
						}else{
							originalFilename = myfile.getOriginalFilename();
							try {
								//这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
								//此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
								FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, uname+originalFilename));
								FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realsPath, uname+originalFilename));
								FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realssPath, uname+originalFilename));
							} catch (IOException e) {
								System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
								e.printStackTrace();
								out.print("1`文件上传失败，请重试！！");
								out.flush();
								return null;
							}
						}
					}
					
					//此时在Windows下输出的是[D:\Develop\apache-tomcat-6.0.36\webapps\AjaxFileUpload\\upload\愤怒的小鸟.jpg]
				//	System.out.println(realPath + "\\" + originalFilename);
					//此时在Windows下输出的是[/AjaxFileUpload/upload/愤怒的小鸟.jpg]
				//	System.out.println(originalFilename);
					//不推荐返回[realPath + "\\" + originalFilename]的值
					//因为在Windows下<img src="file:///D:/aa.jpg">能被firefox显示,而<img src="D:/aa.jpg">firefox是不认的
					out.print("0`" + request.getContextPath() + "/stu/" +uname + originalFilename);
					out.flush();
					return null;
				}*/
				// 投递简历
				@RequestMapping("frontpage/delivery")
				public ModelAndView delivery(DeliveryInfo dif, HttpServletRequest request,
						HttpServletResponse response,PositionInfo pif,StudentInfo sif) throws IOException {
					String h_email = request.getParameter("h_email");
					String stu_id = request.getParameter("stu_id");
					int p_id = Integer.parseInt(request.getParameter("p_id"));
					int d_id = StudentDao.selectID();
					Date dat = new Date();
					String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dat);
					pif = StudentDao.getPosById(p_id);
					sif = StudentDao.selectInfoByNo(stu_id);
					
					
					dif.setP_name(pif.getP_name());
					dif.setP_low_salary(pif.getP_low_salary());
					dif.setP_high_salary(pif.getP_high_salary());
					dif.setP_company(pif.getP_company());
					dif.setP_loc(pif.getP_loc());
					dif.setD_id(d_id);
					dif.setDate(date);
					dif.setH_email(h_email);
					dif.setP_id(p_id);
					dif.setStu_id(stu_id);
					dif.setStu_name(sif.getStu_name());
					dif.setStu_sex(sif.getStu_sex());
					dif.setStu_college(sif.getStu_college());
					dif.setStu_exp_city(sif.getStu_exp_city());
					dif.setStu_exp_pos(sif.getStu_exp_pos());
					dif.setStu_tel(sif.getStu_tel());
					dif.setStu_email(sif.getStu_email());
					dif.setStu_jianli_title(sif.getStu_jianli_title());
					dif.setStu_profile(sif.getStu_profile());
					StudentDao.insertDelivery(dif);
					
					
					return new ModelAndView("frontpage/toudi_success");
				}	
				// show简历
				@RequestMapping("frontpage/showdelivery")
				public ModelAndView showdelivery(HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String stu_id = request.getParameter("name");
					StudentInfo sif = StudentDao.getStuById(stu_id);
					String p_name= sif.getStu_exp_pos();
					if(p_name==null){
						List<PositionInfo> list = StudentDao.getPos("");
						map.addAttribute("PositionList",list);
					}else{
						List<PositionInfo> list = StudentDao.getPos(p_name);
						map.addAttribute("PositionList",list);
					}
					
					List<DeliveryInfo> dif = StudentDao.getDelivery(stu_id);
					map.addAttribute("Stu_delivery",dif);
					request.setAttribute("statu","all");
					if(dif.size()!=0){
						return new ModelAndView("frontpage/delivery");
					}else{
						return new ModelAndView("frontpage/delivery-none");
					}
					
					
				}
				@RequestMapping("frontpage/susdelivery")
				public ModelAndView susdelivery(HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String stu_id = request.getParameter("name");
					StudentInfo sif = StudentDao.getStuById(stu_id);
					String p_name= sif.getStu_exp_pos();
					List<PositionInfo> list = StudentDao.getPos(p_name);
					map.addAttribute("PositionList",list);
					List<DeliveryInfo> dif = StudentDao.getsusDelivery(stu_id);
					map.addAttribute("Stu_delivery",dif);
					request.setAttribute("statu","success");
					
					if(dif.size()!=0){
						return new ModelAndView("frontpage/delivery");
					}else{
						return new ModelAndView("frontpage/delivery-none");
					}
				}
				@RequestMapping("frontpage/donedelivery")
				public ModelAndView donedelivery(HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String stu_id = request.getParameter("name");
					StudentInfo sif = StudentDao.getStuById(stu_id);
					String p_name= sif.getStu_exp_pos();
					List<PositionInfo> list = StudentDao.getPos(p_name);
					map.addAttribute("PositionList",list);
					List<DeliveryInfo> dif = StudentDao.getdoneDelivery(stu_id);
					map.addAttribute("Stu_delivery",dif);
					request.setAttribute("statu","done");
					
					if(dif.size()!=0){
						return new ModelAndView("frontpage/delivery");
					}else{
						return new ModelAndView("frontpage/delivery-none");
					}
				}
				@RequestMapping("frontpage/undelivery")
				public ModelAndView undelivery(HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String stu_id = request.getParameter("name");
					StudentInfo sif = StudentDao.getStuById(stu_id);
					String p_name= sif.getStu_exp_pos();
					List<PositionInfo> list = StudentDao.getPos(p_name);
					map.addAttribute("PositionList",list);
					List<DeliveryInfo> dif = StudentDao.getunDelivery(stu_id);
					map.addAttribute("Stu_delivery",dif);
					request.setAttribute("statu","un");
					
					if(dif.size()!=0){
						return new ModelAndView("frontpage/delivery");
					}else{
						return new ModelAndView("frontpage/delivery-none");
					}
				}
				// 学生简历管理页面
				@RequestMapping("frontpage/showresumeView")
				public ModelAndView showresumeView(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					
					
					String stu_no = request.getParameter("stu_id");
					sif = StudentDao.selectInfoByNo(stu_no);
					request.setAttribute("stu_info",sif);
					HttpSession session = request.getSession();
					session.setAttribute("stu_college", sif.getStu_college());
					return new ModelAndView("frontpage/stu_preview");
				}
				// Ad
				@RequestMapping("frontpage/getAd")
				public ModelAndView getAd( HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					request.setAttribute("info", "asd");
					List<FadInfo> fif = StudentDao.getFAD();
					map.addAttribute("AdList",fif);
					List<BadInfo> bif = StudentDao.getBAD();
					map.addAttribute("BADList",bif);
					
					return new ModelAndView("frontpage/index");
				}
				

					
				


}
