package com.neu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.entity.B_UserInfo;
import com.neu.entity.BadInfo;
import com.neu.entity.FadInfo;
import com.neu.entity.HrInfo;
import com.neu.entity.InformationInfo;
import com.neu.entity.RecommendInfo;
import com.neu.entity.RegisterCode;

@Repository
public class UserInfoDao {
	@Autowired
	private SqlSession sqlSession;
	
	//后台用户操作
			public List<B_UserInfo> getAllAdmin(){
				List<B_UserInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.getAllAdmin");
				return list;
			}
			public List<FadInfo> selectAllfif(){
				List<FadInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllfif");
				return list;
			}
			public List<BadInfo> selectAllbif(){
				List<BadInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllbif");
				return list;
			}
			
			public void insertAdmin(B_UserInfo b_user){
				sqlSession.insert("com.neu.entity.UserMapper.insertAdmin",b_user);
			}
			public int selectID(){
				int rc_id = sqlSession.selectOne("com.neu.entity.UserMapper.selectID");
				return rc_id;
			}
			public B_UserInfo validateAdmin(B_UserInfo b_user){
				B_UserInfo temp = sqlSession.selectOne("com.neu.entity.UserMapper.validateAdmin",b_user);
				return temp;
			}
			public void updateAdminInfo(B_UserInfo b_user){
				sqlSession.update("com.neu.entity.UserMapper.updateAdminInfo",b_user);
			}
			public void deleteAdmin(String b_name){
				sqlSession.delete("com.neu.entity.UserMapper.delAdminByName",b_name);
			}
			public List<HrInfo> getAllCompany(){
				List<HrInfo> list = sqlSession.selectList("com.neu.entity.HRMapper.getAllCompany");
				return list;
			}
			public HrInfo selectComByNo(HrInfo hif){
				HrInfo temp = sqlSession.selectOne("com.neu.entity.HRMapper.selectInfoById",hif);
				return temp;
			}
			public void permit(HrInfo hif){
				sqlSession.update("com.neu.entity.HRMapper.permit",hif);
			}
			public void deny(HrInfo hif){
				sqlSession.update("com.neu.entity.HRMapper.deny",hif);
			}
			public List<HrInfo> getComByName(String c_name){
				List<HrInfo> list = sqlSession.selectList("com.neu.entity.HRMapper.getComByName",c_name);
				return list;
			}
			public List<HrInfo> getUnComByName(String c_name){
				List<HrInfo> list = sqlSession.selectList("com.neu.entity.HRMapper.getUnComByName",c_name);
				return list;
			}
			public List<HrInfo> getAllUnCompany(){
				List<HrInfo> list = sqlSession.selectList("com.neu.entity.HRMapper.getAllUnCompany");
				return list;
			}
			public List<RecommendInfo> selectAllRec(){
				List<RecommendInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllRec");
				return list;
			}
			public void insertRec(RecommendInfo rec){
				sqlSession.insert("com.neu.entity.UserMapper.insertRec",rec);
			}
			public void deleteRec(int rec_id){
				sqlSession.delete("com.neu.entity.UserMapper.deleteRec",rec_id);
			}
			public List<RecommendInfo> getRecByTitle(String rec_title){
				List<RecommendInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.getRecByTitle",rec_title);
				return list;
			}
			public List<InformationInfo> selectAllInf(){
				List<InformationInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.selectAllInf");
				return list;
			}
			public void insertInf(InformationInfo inf){
				sqlSession.insert("com.neu.entity.UserMapper.insertInf",inf);
			}
			public void deleteInf(int in_id){
				sqlSession.delete("com.neu.entity.UserMapper.deleteInf",in_id);
			}
			public List<InformationInfo> getInfByTitle(String in_title){
				List<InformationInfo> list = sqlSession.selectList("com.neu.entity.UserMapper.getInfByTitle",in_title);
				return list;
			}
			public FadInfo selectAdById(int fa_id){
				FadInfo list = sqlSession.selectOne("com.neu.entity.UserMapper.selectAdById",fa_id);
				return list;
			}
			public void updateAdByemail(FadInfo fif){
				sqlSession.update("com.neu.entity.UserMapper.updateAdByemail",fif);
			}
			public BadInfo selectBAdById(int ba_id){
				BadInfo list = sqlSession.selectOne("com.neu.entity.UserMapper.selectBAdById",ba_id);
				return list;
			}
			public void updateBAD(BadInfo bif){
				sqlSession.update("com.neu.entity.UserMapper.updateBAD",bif);
			}
}
