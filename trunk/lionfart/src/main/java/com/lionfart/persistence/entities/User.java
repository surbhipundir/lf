package com.lionfart.persistence.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="user")
@NamedQueries({
	@NamedQuery(name= "User.findByUserName", 
			query="select u from User u "
					+ "where u.userName = :userName ")
})
public class User extends CommonEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3972264286358578750L;
	private String userName = null;
	private String passWord = null;
	private String email    = null;
	
	private String firstName= null;
	private String lastName = null;
	
	public User(){
		
	}
	
	public User(String username2, String password2, String email2, String createdBy2) {
		this.userName = username2;
		this.passWord = password2;
		this.email    = email2;
		this.setCreatedBy(createdBy2);
	}
	
	@Column(name="USER_NAME",length=16)
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name="PASSWORD",length=16)
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	@Column(name="EMAIL",length=32)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="FIRST_NAME",length=32)
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	@Column(name="LAST_NAME",length=32)
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
}
