package com.dao;

import java.util.List;

import com.beans.Tableau;

public interface TableauDAO {

	public void ajouterTableau(Tableau tab);

	public Tableau getTableau(int id);

	public List<Tableau> getListTableau();

	public List<Tableau> getListByCateg(int categ);

	public List<Tableau> getDefaultList();

}
