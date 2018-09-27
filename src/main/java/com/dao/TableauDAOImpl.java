package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beans.Tableau;

@Repository
public class TableauDAOImpl implements TableauDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void ajouterTableau(Tableau tab) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(tab);

	}

	@Transactional
	public Tableau getTableau(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Tableau where idTableau = :id");
		query.setParameter("id", id);

		return (Tableau) query.uniqueResult();
	}

	@Transactional
	public List<Tableau> getListTableau() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Tableau order by date desc");
		return query.list();
	}

	@Transactional
	public List<Tableau> getDefaultList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Tableau order by idTableau");
		return query.list();
	}

	@Transactional
	public List<Tableau> getListByCateg(int categ) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Tableau where categorie = :categ order by date desc");
		query.setParameter("categ", categ);
		return query.list();
	}

}
