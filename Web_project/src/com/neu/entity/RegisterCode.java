package com.neu.entity;

import java.io.Serializable;

public class RegisterCode implements Serializable{
	private int rc_id;
	private String rc_no;
	private String rc_name;
	private String rc_code;
	private String rc_college;
	public int getRc_id() {
		return rc_id;
	}
	public void setRc_id(int rc_id) {
		this.rc_id = rc_id;
	}
	public String getRc_no() {
		return rc_no;
	}
	public void setRc_no(String rc_no) {
		this.rc_no = rc_no;
	}
	public String getRc_name() {
		return rc_name;
	}
	public void setRc_name(String rc_name) {
		this.rc_name = rc_name;
	}
	public String getRc_code() {
		return rc_code;
	}
	public void setRc_code(String rc_code) {
		this.rc_code = rc_code;
	}
	public String getRc_college() {
		return rc_college;
	}
	public void setRc_college(String rc_college) {
		this.rc_college = rc_college;
	}
	

}
