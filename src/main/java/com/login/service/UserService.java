package com.login.service;

import org.springframework.dao.DataAccessException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.roo.addon.RooFlexScaffold;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.login.entity.AuthorityEntity;
import com.login.entity.UserEntity;

@RooFlexScaffold(entity = UserEntity.class)
@RemotingDestination
@Service
public class UserService implements UserDetailsService {
	
	@Override
	public UserEntity loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		
		UserEntity user = showByUsername(username);
		
		if (user == null) throw new UsernameNotFoundException("User not found!");
		
		if (!user.hasProperRole()) throw new UsernameNotFoundException("User has no proper role!");

		return user;		
	}	
}
