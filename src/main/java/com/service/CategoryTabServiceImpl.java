package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.CategorieTab;
import com.dao.CategoryTabDAO;

@Service
public class CategoryTabServiceImpl implements CategoryTabService {

	@Autowired
	private CategoryTabDAO categDAO;

	public List<CategorieTab> getList() {
		return categDAO.getList();
	}

}
