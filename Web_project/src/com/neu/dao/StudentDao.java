package com.neu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.entity.BadInfo;
import com.neu.entity.DeliveryInfo;
import com.neu.entity.FadInfo;
import com.neu.entity.HrInfo;
import com.neu.entity.PositionInfo;
import com.neu.entity.RecommendInfo;
import com.neu.entity.RegisterCode;
import com.neu.entity.StudentInfo;

@Repository(value="StudentDao")
public class StudentDao {
	@Autowired
	private SqlSession sqlSession;
	
	public String getPassBycode(String rc_code){
		String pass = sqlSession.selectOne("com.neu.entity.StudentMapper.getPassBycode", rc_code);
		return pass;
	}
	public RegisterCode validateCode(RegisterCode rsc){
		RegisterCode temp = sqlSession.selectOne("com.neu.entity.StudentMapper.validateCode",rsc);
		return temp;
	}
	public RegisterCode validateNo(RegisterCode rsc){
		RegisterCode temp = sqlSession.selectOne("com.neu.entity.StudentMapper.validateNo",rsc);
		return temp;
	}
	public StudentInfo validateNo2(StudentInfo rsi){
		StudentInfo temp = sqlSession.selectOne("com.neu.entity.StudentMapper.validateNo2",rsi);
		return temp;
	}
	public int selectID(){
		int s_id = sqlSession.selectOne("com.neu.entity.StudentMapper.selectID");
		return s_id;
	}
	public void insertStu(StudentInfo sif){
		sqlSession.insert("com.neu.entity.StudentMapper.insertStu",sif);
	}
	public StudentInfo selectInfoByNo(String stu_no){
		StudentInfo temp = sqlSession.selectOne("com.neu.entity.StudentMapper.selectInfoByNo",stu_no);
		return temp;
	}
	public void updateRNByNo(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateRNByNo",sif);
	}
	public void updateBasicByNo(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateBasicByNo",sif);
	}
	public void updateExpByNo(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateExpByNo",sif);
	}
	public void updateExpByNos(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateExpByNos",sif);
	}
	public void updateExperienceByNo(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateExperienceByNo",sif);
	}
	public void updateExperienceByNos(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateExperienceByNos",sif);
	}
	public void updateProjectByNo(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateProjectByNo",sif);
	}
	public void updateProjectByNos(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateProjectByNos",sif);
	}
	public void updateEduByDoc(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateEduByDoc",sif);
	}
	public void updateEduByDocs(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateEduByDocs",sif);
	}
	public void updateEduByMas(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateEduByMas",sif);
	}
	public void updateEduByMass(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateEduByMass",sif);
	}
	public void updateEduByUnd(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateEduByUnd",sif);
	}
	public void updateEduByUnds(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateEduByUnds",sif);
	}
	public void updateDescrByNo(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateDescrByNo",sif);
	}
	public void updateDescrByNos(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateDescrByNos",sif);
	}
	public int selectScore(String stu_id){
		int temp = sqlSession.selectOne("com.neu.entity.StudentMapper.selectScore",stu_id);
		return temp;
	}
	public void updateProfile(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updateProfile",sif);
	}
	public void updatePass(StudentInfo sif){
		sqlSession.update("com.neu.entity.StudentMapper.updatePass",sif);
	}
	public List<PositionInfo> getAllPos(){
		List<PositionInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getAllPos");
		return list;
	}
	public List<PositionInfo> getPos(String p_name){
		List<PositionInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getPos",p_name);
		return list;
	}
	public List<PositionInfo> getnPos(PositionInfo pif){
		List<PositionInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getnPos",pif);
		return list;
	}
	public List<PositionInfo> getPoss(PositionInfo pif){
		List<PositionInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getPoss",pif);
		return list;
	}
	public List<PositionInfo> getnPoss(PositionInfo pif){
		List<PositionInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getnPoss",pif);
		return list;
	}
	public void insertDelivery(DeliveryInfo dif){
		sqlSession.insert("com.neu.entity.StudentMapper.insertDelivery",dif);
	}
	public PositionInfo getPosById(int p_id){
		PositionInfo list = sqlSession.selectOne("com.neu.entity.StudentMapper.getPosById",p_id);
		return list;
	}
	public List<DeliveryInfo> getDelivery(String stu_id){
		List<DeliveryInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getDelivery",stu_id);
		return list;
	}
	public List<DeliveryInfo> getsusDelivery(String stu_id){
		List<DeliveryInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getsusDelivery",stu_id);
		return list;
	}
	public List<DeliveryInfo> getdoneDelivery(String stu_id){
		List<DeliveryInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getdoneDelivery",stu_id);
		return list;
	}
	public List<DeliveryInfo> getunDelivery(String stu_id){
		List<DeliveryInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getunDelivery",stu_id);
		return list;
	}
	public StudentInfo getStuById(String stu_id){
		StudentInfo list = sqlSession.selectOne("com.neu.entity.StudentMapper.getStuById",stu_id);
		return list;
	}
	public List<FadInfo> getFAD(){
		List<FadInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getFAD");
		return list;
	}
	public List<BadInfo> getBAD(){
		List<BadInfo> list = sqlSession.selectList("com.neu.entity.StudentMapper.getBAD");
		return list;
	}
	
}
