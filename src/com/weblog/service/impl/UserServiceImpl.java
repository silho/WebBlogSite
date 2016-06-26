package com.weblog.service.impl;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weblog.base.DaoSupportImpl;
import com.weblog.domain.User;
import com.weblog.service.UserService;

@Service
@Transactional
public class UserServiceImpl extends DaoSupportImpl<User> implements UserService {

	

	public User findByLoginNameAndPassword(String loginName, String password) {
		// 使用密码的MD5摘要进行对比
		String md5Digest = DigestUtils.md5Hex(password);

		return  (User) getSession().createQuery(//
				"FROM User u WHERE u.username=? AND u.password=?")//
				.setString(0, loginName)//
				.setString(1, md5Digest)//
				.uniqueResult();

	}

	public boolean trySave(User user) {
		// 将密码转换为MD5
		String md5Digest = DigestUtils.md5Hex(user.getPassword());
		user.setPassword(md5Digest);
		// 判断用户是否存在
		if (getByName(user.getUsername()) != null) {
			
			return false;
		} else {
			save(user);
			return true;
		}
	}

	

	@Override
	public User getByName(String username) {
		return (User) getSession().createQuery(//
				"FROM User u WHERE u.username=?")//
				.setParameter(0, username)//
				.uniqueResult();
	}

}
