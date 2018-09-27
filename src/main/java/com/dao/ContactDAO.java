package com.dao;

import java.util.List;

import com.beans.Contact;

public interface ContactDAO {

	public void ajouterContact(Contact con);

	public List<Contact> getlistNonVue();

	public Contact getContact(int id);

}
