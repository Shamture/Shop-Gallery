package com.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Tableau;
import com.dao.TableauDAO;

@Service
public class TableauServiceImpl implements TableauService {

	@Autowired
	private TableauDAO tabDAO;

	public void ajouterTableau(Tableau tab) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDateTime now = LocalDateTime.now();
		tab.setDate(dtf.format(now));

		tab.setTaille(tab.getTaille() + "cm");
		tabDAO.ajouterTableau(tab);

	}

	public Tableau getTableau(int id) {
		return tabDAO.getTableau(id);
	}

	public List<Tableau> getListTableau() {
		return tabDAO.getListTableau();
	}

	public int getLastId() {
		List<Tableau> list = tabDAO.getDefaultList();
		return list.get(list.size() - 1).getId();
	}

	public List<Tableau> getListByCateg(int categ) {
		return tabDAO.getListByCateg(categ);
	}

}
