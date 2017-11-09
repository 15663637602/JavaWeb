package com.neu.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.entity.DeliveryInfo;
import com.neu.entity.HrInfo;
import com.neu.entity.PositionInfo;
import com.neu.entity.RegisterCode;
import com.neu.entity.StudentInfo;
import com.neu.entity.TagInfo;

@Repository(value="HrDao")
public class HRDao {
	@Autowired
	private SqlSession sqlSession;
	
	public HrInfo selectInfoByNo(HrInfo hif){
		HrInfo temp = sqlSession.selectOne("com.neu.entity.HRMapper.selectInfoByNo",hif);
		return temp;
	}
	public void updateCTByNo(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updateCTByNo",hif);
	}
	public void updatePro(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updatePro",hif);
	}
	public void updateIntr(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updateIntr",hif);
	}
	public void updateBas(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updateBas",hif);
	}
	public void updatefinance(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updatefinance",hif);
	}
	public void updateContact(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updateContact",hif);
	}
	public int selectID(){
		int s_id = sqlSession.selectOne("com.neu.entity.StudentMapper.selectID");
		return s_id;
	}
	public void insertHr(HrInfo hif){
		sqlSession.insert("com.neu.entity.HRMapper.insertHr",hif);
	}
	public HrInfo validateEmail(HrInfo hif){
		HrInfo temp = sqlSession.selectOne("com.neu.entity.HRMapper.validateEmail",hif);
		return temp;
	}
	public List<TagInfo> selectTag(TagInfo tif){
		List<TagInfo> temp = sqlSession.selectList("com.neu.entity.TagMapper.selectTag",tif);
		return temp;
	}
	public void insertTag(TagInfo tif){
		sqlSession.insert("com.neu.entity.TagMapper.insertTag",tif);
	}
	public void updateTag(TagInfo tif){
		sqlSession.update("com.neu.entity.TagMapper.updateTag",tif);
	}
	public void insertsTag(TagInfo tif){
		sqlSession.insert("com.neu.entity.TagMapper.insertsTag",tif);
	}
	public void delTag(int ct_id){
		sqlSession.delete("com.neu.entity.TagMapper.delTag",ct_id);
	}
	public void createJob(PositionInfo pif){
		sqlSession.insert("com.neu.entity.HRMapper.createJob",pif);
	}
	public List<PositionInfo> selectPos(PositionInfo pif){
		List<PositionInfo> temp = sqlSession.selectList("com.neu.entity.HRMapper.selectPosition",pif);
		return temp;
	}
	public List<PositionInfo> seletposByHemail(String h_email){
		List<PositionInfo> temp = sqlSession.selectList("com.neu.entity.HRMapper.seletposByHemail",h_email);
		return temp;
	}
	public PositionInfo selectposs(PositionInfo pif){
		PositionInfo temp = sqlSession.selectOne("com.neu.entity.HRMapper.selectsPosition",pif);
		return temp;
	}
	public void updateJob(PositionInfo pif){
		sqlSession.update("com.neu.entity.HRMapper.updateJob",pif);
	}
	public void deletePos(PositionInfo pif){
		sqlSession.delete("com.neu.entity.HRMapper.deleteJob",pif);
	}
	public String retrievePass(HrInfo hif){
		String pass = sqlSession.selectOne("com.neu.entity.HRMapper.retrievePass",hif);
		return pass;
	}
	public void updateProfile(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updateProfile",hif);
	}
	public void updateAuthImage(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updateAuthImage",hif);
	}
	public void updatePass(HrInfo hif){
		sqlSession.update("com.neu.entity.HRMapper.updatePass",hif);
	}
	public StudentInfo selectInfoByNo(String stu_no){
		StudentInfo temp = sqlSession.selectOne("com.neu.entity.StudentMapper.selectInfoByNo",stu_no);
		return temp;
	}
	public List<DeliveryInfo> getDelivery(String h_email){
		List<DeliveryInfo> temp = sqlSession.selectList("com.neu.entity.HRMapper.getDelivery",h_email);
		return temp;
	}
	public List<DeliveryInfo> getOnDelivery(String h_email){
		List<DeliveryInfo> temp = sqlSession.selectList("com.neu.entity.HRMapper.getOnDelivery",h_email);
		return temp;
	}
	public List<DeliveryInfo> getUnDelivery(String h_email){
		List<DeliveryInfo> temp = sqlSession.selectList("com.neu.entity.HRMapper.getUnDelivery",h_email);
		return temp;
	}
	public void passdelivery(DeliveryInfo dif){
		sqlSession.update("com.neu.entity.HRMapper.passdelivery",dif);
	}
	public void donedelivery(DeliveryInfo dif){
		sqlSession.update("com.neu.entity.HRMapper.donedelivery",dif);
	}
	public void addorder(PositionInfo pif){
		sqlSession.update("com.neu.entity.HRMapper.addorder",pif);
	}
}
