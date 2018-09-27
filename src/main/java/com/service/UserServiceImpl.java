package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.User;
import com.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	public boolean authentifier(String login, String password) {
		return userDAO.authentifier(login, password);
	}

	public boolean updateuser(User user) {
		return userDAO.updateUser(user);
	}

	public void recoverUser(String email) {
		// TODO Auto-generated method stub

	}

	public User getuserByLogin(String login) {
		return userDAO.getuserByLogin(login);
	}

}
