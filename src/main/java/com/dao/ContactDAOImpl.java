package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beans.Contact;

@Repository
public class ContactDAOImpl implements ContactDAO {

	@Autowired
	private SessionFactory sessionFac;

	@Transactional
	public void ajouterContact(Contact con) {
		Session session = sessionFac.getCurrentSession();
		session.persist(con);

	}

	@Transactional
	public List<Contact> getlistNonVue() {
		Session session = sessionFac.getCurrentSession();
		Query sql = session.createQuery("from Contact where vue=0");
		return sql.list();
	}

	@Transactional
	public Contact getContact(int id) {
		Session session = sessionFac.getCurrentSession();
		Query sql = session.createQuery("from Contact where idContact= :id");
		sql.setParameter("id", id);
		Contact cont = (Contact) sql.uniqueResult();
		cont.setVue(1);
		session.update(cont);
		return cont;
	}

}
