package com.login.service;

import java.util.Map;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.security3.AuthenticationResultUtils;
import org.springframework.stereotype.Service;

@RemotingDestination
@Service
public class SecurityService {

	public Map<String, Object> getAuthentication() {
		return AuthenticationResultUtils.getAuthenticationResult();
	}

}
