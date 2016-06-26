package com.weblog.service;

import com.weblog.base.DaoSupport;
import com.weblog.domain.User;

public interface UserService extends DaoSupport<User>{
	/***
	 * 根据登录名与密码查询用户
	 * 
	 * @param loginName
	 * @param password
	 *            明文密码
	 * @return
	 */
	User findByLoginNameAndPassword(String loginName, String password);

	/***
	 * 尝试保存一个新的用户
	 * @param user 新用户
	 * @return　true 成功　false 失败
	 */
	boolean trySave(User user);
	/***
	 * 通过用户的名字查找用户
	 * @param username
	 * @return
	 */
	User getByName(String username);
}
