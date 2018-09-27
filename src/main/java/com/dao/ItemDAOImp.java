package com.dao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beans.Item;

@Repository
public class ItemDAOImp implements ItemDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public List<Item> getItemsByCategory(int cat) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Item where categorie = :cat order by date desc");
		query.setParameter("cat", cat);

		return query.list();
	}

	@Transactional
	public Item getItemById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Item where idItem = :id");
		query.setParameter("id", id);

		return (Item) query.uniqueResult();
	}

	@Transactional
	public boolean createItem(Item item) {
		try {
			Session session = sessionFactory.getCurrentSession();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-mm-dd");
			LocalDateTime now = LocalDateTime.now();
			String currentDate = dtf.format(now);
			item.setDate(currentDate);
			session.persist(item);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return true;
	}

	@Transactional
	public List<Item> getAllItems() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Item order by idItem");

		return query.list();
	}

}
