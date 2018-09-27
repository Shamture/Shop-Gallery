package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Item;
import com.dao.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDAO itemDAO;

	public List<Item> getItemsByCategory(int cat) {

		return itemDAO.getItemsByCategory(cat);
	}

	public Item getItemById(int id) {
		return itemDAO.getItemById(id);
	}

	public boolean createItem(Item item) {
		return itemDAO.createItem(item);
	}

	public int getLastitemId() {
		List<Item> list = itemDAO.getAllItems();
		System.err.println(list.get(list.size() - 1).getId());
		return list.get(list.size() - 1).getId();
	}

	public List<Item> getAllItems() {
		return itemDAO.getAllItems();
	}

}
