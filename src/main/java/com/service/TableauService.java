package com.service;

import java.util.List;

import com.beans.Tableau;

public interface TableauService {

	public void ajouterTableau(Tableau tab);

	public Tableau getTableau(int id);

	public List<Tableau> getListTableau();

	public List<Tableau> getListByCateg(int categ);

	public int getLastId();
}
