package com.dao;

import java.util.List;

import com.beans.Item;

public interface ItemDAO {

	public List<Item> getItemsByCategory(int cat);

	public Item getItemById(int id);

	public boolean createItem(Item item);

	public List<Item> getAllItems();

}
