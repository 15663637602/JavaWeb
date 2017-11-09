package com.neu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.entity.B_UserInfo;
import com.neu.entity.HrInfo;
import com.neu.entity.InformationInfo;
import com.neu.entity.RecommendInfo;
import com.neu.entity.StudentInfo;
import com.neu.entity.TagInfo;

@Repository(value="loginDao")
public class LoginDao {

	@Autowired
	private SqlSession sqlSession;
	//前台学生登录验证
	public boolean validate(String name, String pass) {
		StudentInfo s1 = new StudentInfo();
		s1.setStu_id(name);
		s1.setStu_password(pass);
		StudentInfo temp = sqlSession.selectOne("com.neu.entity.StudentMapper.stu_Login",s1);
		if(temp!=null){
			return true;
		}
		return false;
	}
	
	//前台hr登录验证
		public boolean Hr_validate(String name, String pass) {
			HrInfo h1 = new HrInfo();
			h1.setH_email(name);
			h1.setH_password(pass);
			HrInfo temp = sqlSession.selectOne("com.neu.entity.HRMapper.hr_Login",h1);
			if(temp!=null){
				return true;
			}
			return false;
		}
		
		public HrInfo selectInfoByNo(HrInfo hif){
			HrInfo temp = sqlSession.selectOne("com.neu.entity.HRMapper.selectInfoByNo",hif);
			return temp;
		}
		public List<TagInfo> selectTag(TagInfo tif){
			List<TagInfo> temp = sqlSession.selectList("com.neu.entity.TagMapper.selectTag",tif);
			return temp;
		}
	
	//后台登录验证
		public boolean b_validate(String name, String pass) {
			B_UserInfo b1 = new B_UserInfo();
			b1.setB_name(name);
			b1.setB_pass(pass);
			String temp = sqlSession.selectOne("com.neu.entity.UserMapper.B_Login",b1);
			if(temp!=null){
				return true;
			}
			return false;
		}
		public String b_val_status(String name,String pass){
			B_UserInfo b1 = new B_UserInfo();
			b1.setB_name(name);
			b1.setB_pass(pass);
			String temp = sqlSession.selectOne("com.neu.entity.UserMapper.B_Login",b1);
			return temp;
		}
		
		//首页显示
		public List<RecommendInfo> selectAllRec(){
			List<RecommendInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllRec");
			return list;
		}
		public List<InformationInfo> selectAllInf(){
			List<InformationInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllInf");
			return list;
		}

}
