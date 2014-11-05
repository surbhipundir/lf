package com.lionfart.persistence.service;

import javax.ejb.Local;

import com.lionfart.persistence.entities.User;

@Local
public interface DataService {

	public User createUser(User newUser);
}
