package com.lionfart.controllers;

import java.io.Serializable;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.apache.commons.lang3.StringUtils;

import com.lionfart.persistence.entities.User;
import com.lionfart.persistence.service.DataService;

@ManagedBean(name="signupController")
@ViewScoped
public class SignUpController implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@EJB
	protected DataService dataSvc;
	
	private String username;
	private String password;
	private String email;

	public void onSignUp(){
		if(!StringUtils.isEmpty(username) &&
		   !StringUtils.isEmpty(password) &&
		   !StringUtils.isEmpty(email)){
			
			
			User savedUser = dataSvc.createUser(new User(username,password,email,username));
		
		}
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
