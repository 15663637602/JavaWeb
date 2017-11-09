package com.neu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

import com.neu.dao.HRDao;
import com.neu.entity.DeliveryInfo;
import com.neu.entity.HrInfo;
import com.neu.entity.PositionInfo;
import com.neu.entity.RegisterCode;
import com.neu.entity.StudentInfo;
import com.neu.entity.TagInfo;

@Controller
@SessionAttributes({ "TagList","PositionList","DeliveryList","pos_info"})
public class HRController {
	@Autowired
	@Qualifier("HrDao")
	private HRDao HrDao;
	
	
	public static MimeMessage createSimpleMail(Session session,String address,String pass)throws Exception{
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress("ppag7602c45d6df3@sohu.com"));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(address));
		message.setSubject("密码找回");
		message.setContent("您好！您的密码为:"+pass, "text/html;charset=UTF-8");
		return message;
		
	}
	
	// 找回密码
			@RequestMapping("frontpage/HrRetrieve")
			public ModelAndView HrRetrieve(HrInfo hif, HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				String h_email = request.getParameter("email");
				hif.setH_email(h_email);
				String pass = HrDao.retrievePass(hif);
				if(pass == null){
					request.setAttribute("error","您输入的邮箱地址有误");
					return new ModelAndView("frontpage/reset_hr");
				}
				request.setAttribute("h_email",h_email);
				//发送Email
				Properties prop = new Properties();
				prop.setProperty("mail.host", "smtp.sohu.com");
				prop.setProperty("mail.transport.protocol", "smtp");
				prop.setProperty("mail.smtp.auth", "true");
				Session session = Session.getInstance(prop);
				session.setDebug(true);
				Transport ts = session.getTransport();
				ts.connect("smtp.sohu.com", "ppag7602c45d6df3", "243583762lyq");
				Message message = createSimpleMail(session,h_email,pass);
				ts.sendMessage(message, message.getAllRecipients());
				ts.close();
				
				return new ModelAndView("frontpage/reset2_hr");
			}
	
	// 公司页面
		@RequestMapping("frontpage/myhome")
		public ModelAndView jianli(HrInfo hif, HttpServletRequest request,
				HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
			String h_email = request.getParameter("name");
			HrInfo hif1 = new HrInfo();
			hif1.setH_email(h_email);
			hif = HrDao.selectInfoByNo(hif1);
			String auth = hif.getAuth();
			HttpSession session = request.getSession();
			session.setAttribute("auth", auth);
			
			tif.setCtag_id(h_email);
			List<TagInfo> tif1 = HrDao.selectTag(tif);
			map.addAttribute("TagList", tif1);
			request.setAttribute("hr_info",hif);
			return new ModelAndView("frontpage/myhome");
		}
		// 学生浏览公司页面
				@RequestMapping("frontpage/stu_showcom")
				public ModelAndView stu_showcom(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("h_email");
					HrInfo hif1 = new HrInfo();
					hif1.setH_email(h_email);
					hif = HrDao.selectInfoByNo(hif1);
					List<PositionInfo> pif = HrDao.seletposByHemail(h_email);
					String auth = hif.getAuth();
					HttpSession session = request.getSession();
					session.setAttribute("auth", auth);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					request.setAttribute("hr_info",hif);
					map.addAttribute("pos_info", pif);
					return new ModelAndView("frontpage/stu_myhome");
				}
		
		// 更新简历标题
				@RequestMapping("frontpage/updateCT")
				public ModelAndView updateCT(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String c_name = request.getParameter("companyShortName");
					String c_title = request.getParameter("companyFeatures");
					hif.setH_email(h_email);
					hif.setC_name(c_name);
					hif.setC_title(c_title);
					HrDao.updateCTByNo(hif);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					request.setAttribute("hr_info",hif1);
					return new ModelAndView("frontpage/myhome");
				}
				// 更新公司产品
				@RequestMapping("frontpage/updatePro")
				public ModelAndView updatePro(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String c_pro_name = request.getParameter("product");
					String c_pro_content = request.getParameter("productProfile");
					hif.setH_email(h_email);
					hif.setC_pro_name(c_pro_name);
					hif.setC_pro_content(c_pro_content);
					HrDao.updatePro(hif);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					request.setAttribute("hr_info",hif1);
					
					return new ModelAndView("frontpage/myhome");
				}
				// 更新公司产品
				@RequestMapping("frontpage/updateIntroduce")
				public ModelAndView updateIntroduce(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String c_introduction = request.getParameter("companyProfile");
					hif.setH_email(h_email);
					hif.setC_introduction(c_introduction);
					HrDao.updateIntr(hif);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					request.setAttribute("hr_info",hif1);
					
					return new ModelAndView("frontpage/myhome");
				}
				// 更新公司基本信息
				@RequestMapping("frontpage/updateBase")
				public ModelAndView updateBase(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String c_loc = request.getParameter("city");
					String c_type = request.getParameter("field");
					String c_population = request.getParameter("companySize");
					String c_website = request.getParameter("companyUrl");
					hif.setH_email(h_email);
					hif.setC_loc(c_loc);
					hif.setC_type(c_type);
					hif.setC_population(c_population);
					hif.setC_website(c_website);
					HrDao.updateBas(hif);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					request.setAttribute("hr_info",hif1);
					
					return new ModelAndView("frontpage/myhome");
				}
				// 更新公司融资信息
				@RequestMapping("frontpage/updatefinance")
				public ModelAndView updatefinance(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String c_fin_stage = request.getParameter("financeStage");
					String c_fin_name = request.getParameter("stageorg");
					hif.setH_email(h_email);
					hif.setC_fin_name(c_fin_name);
					hif.setC_fin_stage(c_fin_stage);
					HrDao.updatefinance(hif);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					request.setAttribute("hr_info",hif1);
					
					return new ModelAndView("frontpage/myhome");
				}
				// 更新联系人信息
				@RequestMapping("frontpage/updateContact")
				public ModelAndView updateContact(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String c_con_name = request.getParameter("cooname");
					String c_con_cont = request.getParameter("contactInfo");
					hif.setH_email(h_email);
					hif.setC_con_name(c_con_name);
					hif.setC_con_cont(c_con_cont);
					HrDao.updateContact(hif);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					request.setAttribute("hr_info",hif1);
					
					return new ModelAndView("frontpage/myhome");
				}
				// 自增HR
				@RequestMapping("frontpage/insertHr")
				public ModelAndView insertStu(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif) throws IOException {
					String h_email = request.getParameter("email");
					String h_password = request.getParameter("password2");
					int h_id = HrDao.selectID();
					hif.setH_email(h_email);
					hif.setH_password(h_password);
					hif.setH_id(h_id);
					HrDao.insertHr(hif);
					tif.setCt_id(h_id);
					tif.setCtag_id(h_email);
					HrDao.insertTag(tif);
					request.setAttribute("error", "注册成功!");
					return new ModelAndView("frontpage/hr_login");
				}
				// 验证邮箱地址
				@RequestMapping("frontpage/testemail")
				public void TestCode(HrInfo hif,HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String data;
					String email = request.getParameter("email");
					hif.setH_email(email);
					if (HrDao.validateEmail(hif) != null) {
						data = "该邮箱地址已注册";
					} else {
						data = "邮箱地址可用";
					}
					response.setContentType("text/xml;charset=UTF-8");
					response.setHeader("Cache-Control", "no-cache");
					response.getWriter().write(data);
				}
				// 添加Tag
				@RequestMapping("frontpage/insertTag")
				public ModelAndView insertTag(HrInfo hif,HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String ctag_content = request.getParameter("articleTitle");
					TagInfo tif2 = new TagInfo();
					int ct_id = HrDao.selectID();
					tif2.setCtag_content(ctag_content);
					tif2.setCt_id(ct_id);
					tif2.setCtag_id(h_email);
					HrDao.insertsTag(tif2);
					
					hif.setH_email(h_email);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					request.setAttribute("hr_info",hif1);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					
					
					return new ModelAndView("frontpage/myhome");
				}
				// 删除Tag
				@RequestMapping("frontpage/delTag")
				public void delTag(HrInfo hif,HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					int ct_id = Integer.parseInt(request.getParameter("ct_id"));
					HrDao.delTag(ct_id);
				}
				// 发布职位页面
				@RequestMapping("frontpage/create")
				public ModelAndView create(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String h_email = request.getParameter("name");
					HttpSession session = request.getSession();
					session.setAttribute("username", h_email);
					session.setAttribute("status", "hr");
					return new ModelAndView("frontpage/create");
				}
				// 发布职位
				@RequestMapping("frontpage/createJob")
				public ModelAndView createJob( PositionInfo psf,HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String p_field = request.getParameter("positionType");
					String p_name = request.getParameter("positionName");
					String p_type = request.getParameter("jobNature");
					String p_low_salary = request.getParameter("salaryMin");
					String p_high_salary = request.getParameter("salaryMax");
					String p_loc = request.getParameter("workAddress");
					String p_degree = request.getParameter("education");
					String p_charm = request.getParameter("positionAdvantage");
					String p_descr = request.getParameter("JobProfile");
					String p_demand = request.getParameter("JobDemand");
					String p_contact = request.getParameter("contactInfo");
					int p_id = HrDao.selectID();
					HrInfo hif1 = new HrInfo();
					hif1.setH_email(h_email);
					HrInfo hif = HrDao.selectInfoByNo(hif1);
					String p_fields = hif.getC_type();
					String p_stage = hif.getC_fin_stage();
					String p_pop = hif.getC_population();
					String p_company = hif.getC_name();
					Date d = new Date();
					
					psf.setDate(d);
					psf.setH_email(h_email);
					psf.setP_high_salary(p_high_salary);
					psf.setP_charm(p_charm);
					psf.setP_contact(p_contact);
					psf.setP_degree(p_degree);
					psf.setP_demand(p_demand);
					psf.setP_descr(p_descr);
					psf.setP_field(p_field);
					psf.setP_loc(p_loc);
					psf.setP_low_salary(p_low_salary);
					psf.setP_name(p_name);
					psf.setP_type(p_type);
					psf.setP_id(p_id);
					psf.setP_fields(p_fields);
					psf.setP_stage(p_stage);
					psf.setP_pop(p_pop);
					psf.setP_company(p_company);
					HrDao.createJob(psf);
					
					List<PositionInfo> pif2 = HrDao.selectPos(psf);
					map.addAttribute("PositionList", pif2);
					
					return new ModelAndView("frontpage/positions");
				}
				
				// 编辑职位
				@RequestMapping("frontpage/updateJob")
				public ModelAndView updateJob( PositionInfo psf,HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					int p_id= Integer.parseInt(request.getParameter("id"));
					String h_email = request.getParameter("name");
					String p_field = request.getParameter("positionType");
					String p_name = request.getParameter("positionName");
					String p_type = request.getParameter("jobNature");
					String p_low_salary = request.getParameter("salaryMin");
					String p_high_salary = request.getParameter("salaryMax");
					String p_loc = request.getParameter("workAddress");
					String p_degree = request.getParameter("education");
					String p_charm = request.getParameter("positionAdvantage");
					String p_descr = request.getParameter("JobProfile");
					String p_demand = request.getParameter("JobDemand");
					String p_contact = request.getParameter("contactInfo");
					
					psf.setH_email(h_email);
					psf.setP_high_salary(p_high_salary);
					psf.setP_charm(p_charm);
					psf.setP_contact(p_contact);
					psf.setP_degree(p_degree);
					psf.setP_demand(p_demand);
					psf.setP_descr(p_descr);
					psf.setP_field(p_field);
					psf.setP_loc(p_loc);
					psf.setP_low_salary(p_low_salary);
					psf.setP_name(p_name);
					psf.setP_type(p_type);
					psf.setP_id(p_id);
					HrDao.updateJob(psf);
					
					List<PositionInfo> pif2 = HrDao.selectPos(psf);
					map.addAttribute("PositionList", pif2);
					
					return new ModelAndView("frontpage/positions");
				}
				
				// 职位管理页面
				@RequestMapping("frontpage/positions")
				public ModelAndView positions(PositionInfo pif,HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					HttpSession session = request.getSession();
					session.setAttribute("username", h_email);
					session.setAttribute("status", "hr");
					pif.setH_email(h_email);
					List<PositionInfo> pif2 = HrDao.selectPos(pif);
					map.addAttribute("PositionList", pif2);
					return new ModelAndView("frontpage/positions");
				}
				// 学生浏览企业所有职位
				@RequestMapping("frontpage/stu_positions")
				public ModelAndView stu_positions(PositionInfo pif,HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					pif.setH_email(h_email);
					List<PositionInfo> pif2 = HrDao.selectPos(pif);
					request.setAttribute("list_size",pif2.size());
					map.addAttribute("PositionList", pif2);
					return new ModelAndView("frontpage/stu_positions");
				}
				// 编辑职位页面
				@RequestMapping("frontpage/updatePos")
				public ModelAndView updatePos(PositionInfo pif,HttpServletRequest request,
						HttpServletResponse response) throws IOException {
					String h_email = request.getParameter("name");
					int p_id = Integer.parseInt(request.getParameter("id"));
					pif.setP_id(p_id);
					PositionInfo pif2 =  HrDao.selectposs(pif);
					HttpSession session = request.getSession();
					session.setAttribute("username", h_email);
					session.setAttribute("status", "hr");
					request.setAttribute("pif_Info", pif2);
					return new ModelAndView("frontpage/updatePos");
				}
				// 删除职位
				@RequestMapping("frontpage/deletePos")
				public ModelAndView deletePos(PositionInfo pif,HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					int p_id = Integer.parseInt(request.getParameter("id"));
					pif.setP_id(p_id);
					HrDao.deletePos(pif);
					
					HttpSession session = request.getSession();
					session.setAttribute("username", h_email);
					session.setAttribute("status", "hr");
					PositionInfo pif3 =  new PositionInfo();
					pif3.setH_email(h_email);
					List<PositionInfo> pif2 = HrDao.selectPos(pif3);
					map.addAttribute("PositionList", pif2);
					return new ModelAndView("frontpage/positions");
				}
				// 查看职位页面
				@RequestMapping("frontpage/showJob")
				public ModelAndView showJob(PositionInfo pif,HttpServletRequest request,
						HttpServletResponse response,HrInfo hif,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					int p_id = Integer.parseInt(request.getParameter("id"));
					pif.setP_id(p_id);
					hif.setH_email(h_email);
					tif.setCtag_id(h_email);
					HrInfo hif2 = HrDao.selectInfoByNo(hif);
					List<TagInfo> tif2 = HrDao.selectTag(tif);
					PositionInfo pif2 =  HrDao.selectposs(pif);
					request.setAttribute("pif_Info", pif2);
					request.setAttribute("hif_Info", hif2);
					map.addAttribute("TagList", tif2);
					return new ModelAndView("frontpage/jobdetail_hr");
				}
				
				@RequestMapping("frontpage/fileUpload")  
				public String ProfileUpload(@RequestParam("uname") String uname, @RequestParam MultipartFile[] myfiles, HttpServletRequest request, HttpServletResponse response) throws IOException{
					//可以在上传文件的同时接收其它参数
					//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
					//这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
					String realPath = "D:"+File.separator+"workplace_me"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"frontpage"+File.separator+"style"+File.separator+"hr_profile";
					String realsPath = request.getSession().getServletContext().getRealPath("/frontpage/style/hr_profile");
					String realssPath = request.getSession().getServletContext().getRealPath("/upload");
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
					String logo = "style/hr_profile/"+uname+originalFilename;
					HrInfo hif = new HrInfo();
					hif.setLogo(logo);
					hif.setH_email(uname);
					HrDao.updateProfile(hif);
					//此时在Windows下输出的是[D:\Develop\apache-tomcat-6.0.36\webapps\AjaxFileUpload\\upload\愤怒的小鸟.jpg]
				//	System.out.println(realPath + "\\" + originalFilename);
					//此时在Windows下输出的是[/AjaxFileUpload/upload/愤怒的小鸟.jpg]
				//	System.out.println(originalFilename);
					//不推荐返回[realPath + "\\" + originalFilename]的值
					//因为在Windows下<img src="file:///D:/aa.jpg">能被firefox显示,而<img src="D:/aa.jpg">firefox是不认的
					out.print("0`" + request.getContextPath() + "/upload/" +uname + originalFilename);
		//			System.out.println("0`" + realPath + uname + originalFilename);
					out.flush();
					return null;
				}
				@RequestMapping("frontpage/uploadAuth")  
			    public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {  
			  
					String h_email = request.getParameter("name");
			        String path = "C:"+File.separator+"Users"+File.separator+"Curry"+File.separator+"Desktop"+File.separator+"workspace"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"jsp_backstage"+File.separator+"auth";  
			        String realsPath = request.getSession().getServletContext().getRealPath("/jsp_backstage/auth");
			        String fileName = file.getOriginalFilename();  
			        try {
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path,h_email+fileName));
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realsPath,h_email+fileName));
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			        model.addAttribute("fileUrl", request.getContextPath()+"/auth/"+fileName);  
			        String auth = "auth/" + h_email+fileName;
			        HrInfo hif = new HrInfo();
			        hif.setH_email(h_email);
			        hif.setAuth_image(auth);
			        HrDao.updateAuthImage(hif);
			  
			        return "frontpage/authSuccess";  
			    }  
				// 更新密码
				@RequestMapping("frontpage/hr_updatepass")
				public ModelAndView hr_updatepass(HrInfo hif, HttpServletRequest request,
						HttpServletResponse response,TagInfo tif,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					String h_password = request.getParameter("newpassword");
					hif.setH_email(h_email);
					hif.setH_password(h_password);
					HrDao.updatePass(hif);
					HrInfo hif1 = HrDao.selectInfoByNo(hif);
					
					tif.setCtag_id(h_email);
					List<TagInfo> tif1 = HrDao.selectTag(tif);
					map.addAttribute("TagList", tif1);
					
					request.setAttribute("hr_info",hif1);
					
					return new ModelAndView("frontpage/myhome");
				}
				
//学生浏览
				// stu_showjob
				@RequestMapping("frontpage/stu_showjob")
				public ModelAndView stu_showjob(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map,PositionInfo pif,HrInfo hif,TagInfo tif) throws IOException {
					int p_id = Integer.parseInt(request.getParameter("p_id"));
					String h_email = request.getParameter("h_email");
					pif.setP_id(p_id);
					hif.setH_email(h_email);
					tif.setCtag_id(h_email);
					HrInfo hif2 = HrDao.selectInfoByNo(hif);
					List<TagInfo> tif2 = HrDao.selectTag(tif);
					PositionInfo pif2 =  HrDao.selectposs(pif);
					int order = pif2.getP_order() + 1;
					PositionInfo pif3 = new PositionInfo();
					pif3.setP_id(p_id);
					pif3.setP_order(order);
					HrDao.addorder(pif3);
					request.setAttribute("pif_Info", pif2);
					request.setAttribute("hif_Info", hif2);
					map.addAttribute("TagList", tif2);
						return new ModelAndView("frontpage/stu_job");
					}
				// stus_showjob
				@RequestMapping("frontpage/stus_showjob")
				public ModelAndView stus_showjob(StudentInfo sif, HttpServletRequest request,
						HttpServletResponse response,ModelMap map,PositionInfo pif,HrInfo hif,TagInfo tif) throws IOException {
					int p_id = Integer.parseInt(request.getParameter("p_id"));
					String h_email = request.getParameter("h_email");
					String stu_no = request.getParameter("name");
					pif.setP_id(p_id);
					hif.setH_email(h_email);
					tif.setCtag_id(h_email);
					HrInfo hif2 = HrDao.selectInfoByNo(hif);
					List<TagInfo> tif2 = HrDao.selectTag(tif);
					PositionInfo pif2 =  HrDao.selectposs(pif);
					int order = pif2.getP_order() + 1;
					PositionInfo pif3 = new PositionInfo();
					pif3.setP_id(p_id);
					pif3.setP_order(order);
					HrDao.addorder(pif3);
					sif = HrDao.selectInfoByNo(stu_no);
					String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(sif.getDate());
					request.setAttribute("date",date);
					request.setAttribute("stu_info",sif);
					
					request.setAttribute("pif_Info", pif2);
					request.setAttribute("hif_Info", hif2);
					map.addAttribute("TagList", tif2);
						return new ModelAndView("frontpage/stu_job");
					}
				// recieveResumes页面
				@RequestMapping("frontpage/showRecRes")
				public ModelAndView showRecRes( HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					List<DeliveryInfo> dif = HrDao.getDelivery(h_email);
					request.setAttribute("listsize", dif.size());
					map.addAttribute("DeliveryList", dif);
					return new ModelAndView("frontpage/recieveResumes");
				}
				// OnResumes页面
				@RequestMapping("frontpage/showOnRes")
				public ModelAndView showOnRes( HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					List<DeliveryInfo> dif = HrDao.getOnDelivery(h_email);
					request.setAttribute("listsize", dif.size());
					map.addAttribute("DeliveryList", dif);
					return new ModelAndView("frontpage/onResumes");
				}
				// UnResumes页面
				@RequestMapping("frontpage/showUnRes")
				public ModelAndView showUnRes( HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					List<DeliveryInfo> dif = HrDao.getUnDelivery(h_email);
					request.setAttribute("listsize", dif.size());
					map.addAttribute("DeliveryList", dif);
					return new ModelAndView("frontpage/unResumes");
				}
				// passResumes
				@RequestMapping("frontpage/passdelivery")
				public ModelAndView passdelivery( HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					int d_id = Integer.parseInt(request.getParameter("d_id"));
					String message = request.getParameter("content");
					DeliveryInfo difs = new DeliveryInfo();
					difs.setD_id(d_id);
					difs.setMessage(message);
					HrDao.passdelivery(difs);
					
					
					List<DeliveryInfo> dif = HrDao.getDelivery(h_email);
					request.setAttribute("listsize", dif.size());
					map.addAttribute("DeliveryList", dif);
					return new ModelAndView("frontpage/recieveResumes");
				}
				// passResumes
				@RequestMapping("frontpage/doneddelivery")
				public ModelAndView donedelivery( HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					int d_id = Integer.parseInt(request.getParameter("d_id"));
					String message = request.getParameter("content");
					DeliveryInfo difs = new DeliveryInfo();
					difs.setD_id(d_id);
					difs.setMessage(message);
					HrDao.donedelivery(difs);
					
					
					List<DeliveryInfo> dif = HrDao.getDelivery(h_email);
					request.setAttribute("listsize", dif.size());
					map.addAttribute("DeliveryList", dif);
					return new ModelAndView("frontpage/recieveResumes");
				}
				// passResumes
				@RequestMapping("frontpage/refuseRes")
				public ModelAndView refuseRes( HttpServletRequest request,
						HttpServletResponse response,ModelMap map) throws IOException {
					String h_email = request.getParameter("name");
					int d_id = Integer.parseInt(request.getParameter("d_id"));
					String message = "非常荣幸收到您的简历，在我们仔细阅读您的简历之后，却不得不很遗憾的通知您：您的简历与该职位的定位有些不匹配，因此无法进入面试。但您的信息已录入我司人才储备库，当有合适您的职位开放时我们将第一时间联系您，希望在未来我们有机会成为一起拼搏的同事；再次感谢您对我们的信任，祝您早日找到满意的工作。";
					DeliveryInfo difs = new DeliveryInfo();
					difs.setD_id(d_id);
					difs.setMessage(message);
					HrDao.passdelivery(difs);
					
					
					List<DeliveryInfo> dif = HrDao.getDelivery(h_email);
					request.setAttribute("listsize", dif.size());
					map.addAttribute("DeliveryList", dif);
					return new ModelAndView("frontpage/recieveResumes");
				}
//后台
				
}
