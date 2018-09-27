package com.dao;

import com.beans.User;

public interface UserDAO {

	public boolean authentifier(String login, String password);

	public User getUserByEmail(String email);

	public boolean updateUser(User user);

	public User getuserByLogin(String login);

}
