package com.lionfart.persistence.service;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import com.lionfart.persistence.entities.User;

@Stateless(name="dataService")
public class DataServiceImpl implements DataService{
	@PersistenceContext(unitName = "LFPU", type = PersistenceContextType.TRANSACTION)
	private EntityManager entityManager;
	public EntityManager getEntityManager(){
		return entityManager;
	}
	
	@Override
	public User createUser(User newUser) {
		try{
			return getEntityManager().merge(newUser);
		}
		catch(Exception e){
			
			return null;
		}
	}

}
