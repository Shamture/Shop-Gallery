package com.service;

import com.beans.User;

public interface UserService {

	public boolean authentifier(String login, String password);

	public boolean updateuser(User user);

	public void recoverUser(String email);

	public User getuserByLogin(String login);

}
