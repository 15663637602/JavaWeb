package com.neu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.entity.EnrollInfo;
import com.neu.entity.InformationInfo;
import com.neu.entity.RecommendInfo;
import com.neu.entity.StudentInfo;

@Repository(value="EnrollDao")
public class EnrollDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<EnrollInfo> getAllEnroll(){
		List<EnrollInfo> list = sqlSession.selectList("com.neu.entity.EnrollMapper.getAllEnroll");
		return list;
	}
	public List<EnrollInfo> getEnrollByNo(String stu_id){
		List<EnrollInfo> list = sqlSession.selectList("com.neu.entity.EnrollMapper.getEnrollByNo",stu_id);
		return list;
	}
	public void deleteEnroll(String stu_id){
		sqlSession.delete("com.neu.entity.EnrollMapper.delEnrollByNo",stu_id);
	}
	public EnrollInfo fselectEnroll(EnrollInfo eif){
		EnrollInfo temp = sqlSession.selectOne("com.neu.entity.EnrollMapper.fselectEnroll",eif);
		return temp;
	}
	public int selectID(){
		int s_id = sqlSession.selectOne("com.neu.entity.StudentMapper.selectID");
		return s_id;
	}
	public void finsertEnroll(EnrollInfo eif){
		sqlSession.insert("com.neu.entity.EnrollMapper.finsertEnroll",eif);
	}
	public void fupdateEnroll(EnrollInfo eif){
		sqlSession.update("com.neu.entity.EnrollMapper.fupdateEnroll",eif);
	}
	//Ê×Ò³ÏÔÊ¾
			public List<RecommendInfo> selectAllRec(){
				List<RecommendInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllRec");
				return list;
			}
			public List<InformationInfo> selectAllInf(){
				List<InformationInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllInf");
				return list;
			}
	
}
