package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beans.CategorieTab;

@Repository
public class CategoryTabDAOImpl implements CategoryTabDAO {

	@Autowired
	private SessionFactory sessionFac;

	@Transactional
	public List<CategorieTab> getList() {
		Session session = sessionFac.getCurrentSession();
		Query query = session.createQuery("from CategorieTab");

		return query.list();
	}

}
