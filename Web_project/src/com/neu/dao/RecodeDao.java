package com.neu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neu.entity.RegisterCode;

@Repository(value="RecodeDao")
public class RecodeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<RegisterCode> getAllCode(){
		List<RegisterCode> list = sqlSession.selectList("com.neu.entity.CodeMapper.getAllCode");
		return list;
	}
	public List<RegisterCode> getCodeByNo(String rc_no){
		List<RegisterCode> list = sqlSession.selectList("com.neu.entity.CodeMapper.getCodeByNo",rc_no);
		return list;
	}
	public List<RegisterCode> validateNo(RegisterCode gpi){
		List<RegisterCode> temp = sqlSession.selectList("com.neu.entity.CodeMapper.validateNo",gpi);
		return temp;
	}
	public List<RegisterCode> validateCode(RegisterCode gpi){
		List<RegisterCode> temp = sqlSession.selectList("com.neu.entity.CodeMapper.validateCode",gpi);
		return temp;
	}
	public void insertCode(RegisterCode rcd){
		sqlSession.insert("com.neu.entity.CodeMapper.insertCode", rcd);
	}
	public int selectID(){
		int rc_id = sqlSession.selectOne("com.neu.entity.CodeMapper.selectID");
		return rc_id;
	}
	public void deleteCode(String rc_no){
		sqlSession.delete("com.neu.entity.CodeMapper.delCodeById",rc_no);
	}
	public void updateCodeInfo(RegisterCode rcd){
		sqlSession.update("com.neu.entity.CodeMapper.updateCodeInfo",rcd);
	}
	public void deleteCodeByID(int rc_id){
		sqlSession.delete("com.neu.entity.CodeMapper.delCodeByID",rc_id);
	}
}
