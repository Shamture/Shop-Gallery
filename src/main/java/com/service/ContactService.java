package com.service;

import java.util.List;

import com.beans.Contact;

public interface ContactService {

	public void ajouterContact(Contact con);

	public List<Contact> getlistNonVue();

	public Contact getContact(int id);

}
