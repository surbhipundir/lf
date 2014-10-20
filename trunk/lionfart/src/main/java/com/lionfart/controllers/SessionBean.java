package com.lionfart.controllers;

import java.io.IOException;
import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

@ManagedBean(name="sessionBean")
@SessionScoped
public class SessionBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6060961187669562286L; 
	
	/**
	 * 
	 * 
	 */
    public void logout(){    	
    		
    	HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    	if(session != null){
            session.invalidate();    
        }
    	try {
			FacesContext.getCurrentInstance().getExternalContext().redirect("/private/lionfart.xhtml");
		} catch (IOException e) {
			//log.error(e.getMessage());
		}    
    } 
}
