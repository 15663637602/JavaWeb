package com.neu.entity;

import java.io.Serializable;

public class FadInfo implements Serializable{
	int fa_id;
	String fa_name;
	String fa_image;
	String fa_image2;
	String fa_h_email;
	String fa_class;
	
	public String getFa_class() {
		return fa_class;
	}
	public void setFa_class(String fa_class) {
		this.fa_class = fa_class;
	}
	public int getFa_id() {
		return fa_id;
	}
	public void setFa_id(int fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public String getFa_image() {
		return fa_image;
	}
	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	public String getFa_image2() {
		return fa_image2;
	}
	public void setFa_image2(String fa_image2) {
		this.fa_image2 = fa_image2;
	}
	public String getFa_h_email() {
		return fa_h_email;
	}
	public void setFa_h_email(String fa_h_email) {
		this.fa_h_email = fa_h_email;
	}
	
	
	
	
}