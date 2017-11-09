package com.neu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.neu.dao.StudentDao;
import com.neu.dao.UserInfoDao;
import com.neu.entity.B_UserInfo;
import com.neu.entity.BadInfo;
import com.neu.entity.FadInfo;
import com.neu.entity.HrInfo;
import com.neu.entity.InformationInfo;
import com.neu.entity.RecommendInfo;
import com.neu.entity.RegisterCode;

@Controller
@SessionAttributes({"adminList","CompanyList","RecommendList","InformationList","AdList","BadList"})
public class UserInfoController {
	@Autowired
	private UserInfoDao userInfoDao;
	
	//后台
	//查询所有管理员信息
	@RequestMapping("jsp_backstage/showAllAdmin")
	public ModelAndView allAdminShow(ModelMap map,HttpServletRequest request,HttpServletResponse response){
		List<B_UserInfo> list = userInfoDao.getAllAdmin();
		request.setAttribute("list_size", list.size());
		map.addAttribute("adminList",list);
		return new ModelAndView("jsp_backstage/admin-list");
	}
	//添加
		@RequestMapping("jsp_backstage/insertAdmin")
		public ModelAndView insertAdmin(B_UserInfo b_userInfo ,HttpServletRequest request,HttpServletResponse response,ModelMap map){
			String b_name = request.getParameter("adminname");
			String b_pass = request.getParameter("newpassword");
			String b_status = request.getParameter("status_b");
			
			// 获取自增id
			int b_id = userInfoDao.selectID();
			b_userInfo.setB_id(b_id);
			b_userInfo.setB_name(b_name);
			b_userInfo.setB_pass(b_pass);
			b_userInfo.setB_status(b_status);
			userInfoDao.insertAdmin(b_userInfo);
			List<B_UserInfo> list = userInfoDao.getAllAdmin();
			request.setAttribute("list_size", list.size());
			map.addAttribute("adminList",list);
			return new ModelAndView("jsp_backstage/admin-list");
		}
		//用户名检测
		@RequestMapping("jsp_backstage/b_registertest")
		public void test2(HttpServletRequest request,HttpServletResponse response) throws IOException{
			String data;
		    String username = request.getParameter("b_username");
		    B_UserInfo userInfo = new B_UserInfo();
		    userInfo.setB_name(username);
			    if(userInfoDao.validateAdmin(userInfo)==null) {
			    	data = "用户名可用";
			    	request.setAttribute("username_use", true);
			    }else{
			    	data = "用户名已存在";
			    }
			   //设置返回的内容格式和编码方式
				response.setContentType("text/xml;charset=UTF-8");
				response.setHeader("Cache-Control", "no-cache");		    
			    response.getWriter().write(data);
		}
		//修改
		@RequestMapping("jsp_backstage/updateAdmin")
		public ModelAndView updateAdmin(HttpServletRequest request,HttpServletResponse response){
			String name = request.getParameter("b_name");
			String pass = request.getParameter("b_pass");
			request.setAttribute("name_b", name);
			request.setAttribute("pass_b", pass);
			return new ModelAndView("jsp_backstage/admin-password-edit");
		}
		@RequestMapping("updateAdminInfo")
		public ModelAndView updateAdminInfo(HttpServletRequest request,HttpServletResponse response,ModelMap map){
			String name = request.getParameter("name");
			String status = request.getParameter("status_b");
			String newpassword = request.getParameter("newpassword");
			B_UserInfo b_user = new B_UserInfo();
			b_user.setB_name(name);
			b_user.setB_pass(newpassword);
			b_user.setB_status(status);
			userInfoDao.updateAdminInfo(b_user);
			List<B_UserInfo> list = userInfoDao.getAllAdmin();
			request.setAttribute("list_size", list.size());
			map.addAttribute("adminList",list);
			return new ModelAndView("redirect:jsp_backstage/admin-list.jsp");
		}
		//删除
		@RequestMapping("jsp_backstage/deleteAdmin")
		public ModelAndView deleteAdmin(HttpServletRequest request,HttpServletResponse response){
			String b_name = request.getParameter("b_name");
			userInfoDao.deleteAdmin(b_name);
			return new ModelAndView("jsp_backstage/admin-list");
		}
		//所有企业信息
		@RequestMapping("jsp_backstage/showAllCompany")
		public ModelAndView showAllCompany(ModelMap map,HttpServletRequest request,HttpServletResponse response,HrInfo hif){
			List<HrInfo> list = userInfoDao.getAllCompany();
			request.setAttribute("list_size", list.size());
			map.addAttribute("CompanyList",list);
			return new ModelAndView("jsp_backstage/allcompany");
		}
		//未认证企业信息
				@RequestMapping("jsp_backstage/showUnCompany")
				public ModelAndView showUnCompany(ModelMap map,HttpServletRequest request,HttpServletResponse response,HrInfo hif){
					List<HrInfo> list = userInfoDao.getAllUnCompany();
					request.setAttribute("list_size", list.size());
					map.addAttribute("CompanyList",list);
					return new ModelAndView("jsp_backstage/uncompany");
				}
				//企业信息小窗
				@RequestMapping("jsp_backstage/ComInfoShow")
				public ModelAndView ComInfoShow(HttpServletRequest request,HttpServletResponse response,HrInfo hif){
					int h_id = Integer.parseInt(request.getParameter("id"));
					hif.setH_id(h_id);
					HrInfo hif2 = userInfoDao.selectComByNo(hif);
					request.setAttribute("hr_info",hif2);
					return new ModelAndView("jsp_backstage/company-show");
				}
				//认证通过
				@RequestMapping("jsp_backstage/permitById")
				public void permitById(HttpServletRequest request,HttpServletResponse response,HrInfo hif){
					String h_email = request.getParameter("h_email");
					hif.setH_email(h_email);
					userInfoDao.permit(hif);
				}
				//认证不通过
				@RequestMapping("jsp_backstage/denyById")
				public void denyById(HttpServletRequest request,HttpServletResponse response,HrInfo hif){
					String h_email = request.getParameter("h_email");
					hif.setH_email(h_email);
					userInfoDao.deny(hif);
				}
				// 按名称查询公司
				@RequestMapping("jsp_backstage/bselectCom")
				public ModelAndView bselectCom(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					String c_name = request.getParameter("c_name");
					List<HrInfo> hif = userInfoDao.getComByName(c_name);
					if (hif.size() != 0) {
						request.setAttribute("list_size", hif.size());
						map.addAttribute("CompanyList", hif);
						return new ModelAndView("jsp_backstage/allcompany");
					}
					request.setAttribute("list_size", hif.size());
					return new ModelAndView("jsp_backstage/company-list-none");
				}
				// 按名称查询未认证公司
				@RequestMapping("jsp_backstage/bselectUnCom")
				public ModelAndView bselectUnCom(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					String c_name = request.getParameter("c_name");
					List<HrInfo> hif = userInfoDao.getUnComByName(c_name);
					if (hif.size() != 0) {
						request.setAttribute("list_size", hif.size());
						map.addAttribute("CompanyList", hif);
						return new ModelAndView("jsp_backstage/uncompany");
					}
					request.setAttribute("list_size", hif.size());
					return new ModelAndView("jsp_backstage/uncompany-list-none");
				}
				// 显示就业推荐
				@RequestMapping("jsp_backstage/recommend")
				public ModelAndView recommendshow(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					List<RecommendInfo> list = userInfoDao.selectAllRec();
					request.setAttribute("list_size", list.size());
					map.addAttribute("RecommendList",list);
					
					
					return new ModelAndView("jsp_backstage/recommend-list");
				}
				// 添加Rec页面
				@RequestMapping("jsp_backstage/addRec")
				public ModelAndView showrecadd(HttpServletRequest request,
						HttpServletResponse response) {
					return new ModelAndView("jsp_backstage/recommend-add");
				}
				// 添加Rec
				@RequestMapping("jsp_backstage/insertRec")
				public ModelAndView insertGroup(HttpServletRequest request,
						HttpServletResponse response, ModelMap map,RecommendInfo rec) {
					// 获取自增id
					int rec_id = userInfoDao.selectID();

					String rec_title = request.getParameter("rec_title");
					String rec_link = request.getParameter("rec_link");
					rec.setRec_id(rec_id);
					rec.setRec_link(rec_link);
					rec.setRec_title(rec_title);
					userInfoDao.insertRec(rec);
					
					
					List<RecommendInfo> list = userInfoDao.selectAllRec();
					request.setAttribute("list_size", list.size());
					map.addAttribute("RecommendList", list);
					return new ModelAndView("jsp_backstage/recommend-list");
				}
				// 删除Rec
				@RequestMapping("jsp_backstage/deleteRecById")
				public void deleteRecById(HttpServletRequest request,
						HttpServletResponse response) {
					int rec_id = Integer.parseInt(request.getParameter("rec_id"));
					userInfoDao.deleteRec(rec_id);
				}
				// 按标题查询Rec
				@RequestMapping("jsp_backstage/selectRec")
				public ModelAndView selectCode(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					String rec_title = request.getParameter("rec_title");
					List<RecommendInfo> byno_list = userInfoDao.getRecByTitle(rec_title);
					if (byno_list.size() != 0) {
						request.setAttribute("list_size", byno_list.size());
						map.addAttribute("RecommendList", byno_list);
						return new ModelAndView("jsp_backstage/recommend-list");
					}
					return new ModelAndView("jsp_backstage/recommend-list-none");
				}
				// 显示就业资讯
				@RequestMapping("jsp_backstage/information")
				public ModelAndView informationshow(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					List<InformationInfo> list = userInfoDao.selectAllInf();
					request.setAttribute("list_size", list.size());
					map.addAttribute("InformationList",list);
					
					
					return new ModelAndView("jsp_backstage/information-list");
				}
				
				// 添加Inf页面
				@RequestMapping("jsp_backstage/addINF")
				public ModelAndView showinfadd(HttpServletRequest request,
						HttpServletResponse response) {
					return new ModelAndView("jsp_backstage/information-add");
				}
				// 添加Inf
				@RequestMapping("jsp_backstage/insertInf")
				public ModelAndView insertInf(HttpServletRequest request,
						HttpServletResponse response, ModelMap map,InformationInfo inf) {
					// 获取自增id
					int in_id = userInfoDao.selectID();

					String in_title = request.getParameter("in_title");
					String in_link = request.getParameter("in_link");
					inf.setIn_id(in_id);
					inf.setIn_link(in_link);
					inf.setIn_title(in_title);
					userInfoDao.insertInf(inf);
					
					List<InformationInfo> list = userInfoDao.selectAllInf();
					request.setAttribute("list_size", list.size());
					map.addAttribute("InformationList",list);
					return new ModelAndView("jsp_backstage/information-list");
				}
				// 删除Inf
				@RequestMapping("jsp_backstage/deleteInfById")
				public void deleteInfById(HttpServletRequest request,
						HttpServletResponse response) {
					int in_id = Integer.parseInt(request.getParameter("in_id"));
					userInfoDao.deleteInf(in_id);
				}
				// 按学号查询信息
				@RequestMapping("jsp_backstage/selectInf")
				public ModelAndView selectInf(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					String in_title = request.getParameter("in_title");
					List<InformationInfo> inf_list = userInfoDao.getInfByTitle(in_title);
					if (inf_list.size() != 0) {
						request.setAttribute("list_size", inf_list.size());
						map.addAttribute("InformationList", inf_list);
						return new ModelAndView("jsp_backstage/information-list");
					}
					return new ModelAndView("jsp_backstage/information-list-none");
				}
				// 显示推广信息
				@RequestMapping("jsp_backstage/manageAd")
				public ModelAndView manageAd(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					List<FadInfo> list = userInfoDao.selectAllfif();
					request.setAttribute("list_size", list.size());
					map.addAttribute("AdList",list);
					
					
					return new ModelAndView("jsp_backstage/ad-list");
				}
				// 显示ad-update
				@RequestMapping("jsp_backstage/updateAd")
				public ModelAndView updateAd(
						HttpServletRequest request, HttpServletResponse response) {
					int fa_id = Integer.parseInt(request.getParameter("fa_id"));
					FadInfo fif = userInfoDao.selectAdById(fa_id);
					request.setAttribute("fif", fif);
					
					return new ModelAndView("jsp_backstage/ad-update");
				}
				@RequestMapping("jsp_backstage/updateAd2")  
			    public String upload(@RequestParam(value = "fa_image", required = false) MultipartFile file, @RequestParam(value = "fa_image2", required = false) MultipartFile file2,HttpServletRequest request, ModelMap model,ModelMap map) {  
			  
					String h_email = request.getParameter("fa_h_email");
			        String path = "C:"+File.separator+"Users"+File.separator+"Curry"+File.separator+"Desktop"+File.separator+"workspace"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"jsp_backstage"+File.separator+"style"+File.separator+"company";
			        String path4 = "C:"+File.separator+"Users"+File.separator+"Curry"+File.separator+"Desktop"+File.separator+"workspace"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"frontpage"+File.separator+"style"+File.separator+"company";
			        String path2 = request.getSession().getServletContext().getRealPath("/jsp_backstage/style/company");
			        String path3 = request.getSession().getServletContext().getRealPath("/frontpage/style/company");
			        String fileName = file.getOriginalFilename();
			        try {
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path,h_email+fileName));
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path2,h_email+fileName));
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path3,h_email+fileName));
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path4,h_email+fileName));
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			        
			        String fileName2 = file2.getOriginalFilename();
			        try {
						FileUtils.copyInputStreamToFile(file2.getInputStream(), new File(path,h_email+fileName2));
						FileUtils.copyInputStreamToFile(file2.getInputStream(), new File(path2,h_email+fileName2));
						FileUtils.copyInputStreamToFile(file2.getInputStream(), new File(path3,h_email+fileName2));
						FileUtils.copyInputStreamToFile(file2.getInputStream(), new File(path4,h_email+fileName2));
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			  
			        int fa_id = Integer.parseInt(request.getParameter("faid"));
			        String fa_name = request.getParameter("fa_name");
			        String fa_image = "style/company/"+h_email+fileName;
			        String fa_image2 = "style/company/"+h_email+fileName2;
			        FadInfo fif = new FadInfo();
			        fif.setFa_id(fa_id);
			        fif.setFa_h_email(h_email);
			        fif.setFa_image(fa_image);
			        fif.setFa_name(fa_name);
			        fif.setFa_image2(fa_image2);
			        userInfoDao.updateAdByemail(fif);
			        
			        List<FadInfo> list = userInfoDao.selectAllfif();
					request.setAttribute("list_size", list.size());
					map.addAttribute("AdList",list);
			        
			        return "jsp_backstage/ad-list";  
			    }  
				// 显示后排推广信息
				@RequestMapping("jsp_backstage/manageAd2")
				public ModelAndView manageAd2(ModelMap map,
						HttpServletRequest request, HttpServletResponse response) {
					List<BadInfo> list = userInfoDao.selectAllbif();
					request.setAttribute("list_size", list.size());
					map.addAttribute("BadList",list);
					
					
					return new ModelAndView("jsp_backstage/bad-list");
				}
				// 显示bad-update
				@RequestMapping("jsp_backstage/updateAds")
				public ModelAndView updateAds(
						HttpServletRequest request, HttpServletResponse response) {
					int ba_id = Integer.parseInt(request.getParameter("ba_id"));
					BadInfo bif = userInfoDao.selectBAdById(ba_id);
					request.setAttribute("bif", bif);
					
					return new ModelAndView("jsp_backstage/bad-update");
				}
				@RequestMapping("jsp_backstage/updateAds2")  
			    public String uploadads(@RequestParam(value = "ba_image", required = false) MultipartFile file,HttpServletRequest request, ModelMap model,ModelMap map) {  
			  
					String h_email = request.getParameter("ba_h_email");
			        String path = "C:"+File.separator+"Users"+File.separator+"Curry"+File.separator+"Desktop"+File.separator+"workspace"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"jsp_backstage"+File.separator+"style"+File.separator+"company";
			        String path4 = "C:"+File.separator+"Users"+File.separator+"Curry"+File.separator+"Desktop"+File.separator+"workspace"+File.separator+"Web_project"+File.separator+"WebContent"+File.separator+"frontpage"+File.separator+"style"+File.separator+"company";
			        String path2 = request.getSession().getServletContext().getRealPath("/jsp_backstage/style/company");
			        String path3 = request.getSession().getServletContext().getRealPath("/frontpage/style/company");
			        String fileName = file.getOriginalFilename();
			        try {
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path,h_email+fileName));
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path2,h_email+fileName));
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path3,h_email+fileName));
						FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path4,h_email+fileName));
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			        
			  
			        int ba_id = Integer.parseInt(request.getParameter("baid"));
			        String ba_name = request.getParameter("ba_name");
			        String ba_image = "style/company/"+h_email+fileName;
			        String ba_descr = request.getParameter("descr");
			        BadInfo bif = new BadInfo();
			        bif.setBa_id(ba_id);
			        bif.setBa_descr(ba_descr);
			        bif.setBa_h_email(h_email);
			        bif.setBa_image(ba_image);
			        bif.setBa_name(ba_name);
			        userInfoDao.updateBAD(bif);
			        
			        
			        List<BadInfo> list = userInfoDao.selectAllbif();
					request.setAttribute("list_size", list.size());
					map.addAttribute("BadList",list);
					
			        
			        return "jsp_backstage/bad-list";  
			    }  
}
