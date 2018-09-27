package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Contact;
import com.dao.ContactDAO;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactDAO contactDAO;

	public void ajouterContact(Contact con) {
		contactDAO.ajouterContact(con);

	}

	public List<Contact> getlistNonVue() {
		return contactDAO.getlistNonVue();
	}

	public Contact getContact(int id) {
		return contactDAO.getContact(id);
	}

}
