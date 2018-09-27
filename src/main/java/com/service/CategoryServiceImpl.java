package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Categorie;
import com.dao.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO categDAO;

	public List<Categorie> getListCategorys() {
		return categDAO.getListCategorys();
	}

}
