package com.service;

import java.util.List;

import com.beans.Item;

public interface ItemService {

	public List<Item> getItemsByCategory(int cat);

	public Item getItemById(int id);

	public boolean createItem(Item item);

	public int getLastitemId();

	public List<Item> getAllItems();

}
