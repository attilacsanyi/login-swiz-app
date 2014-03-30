package com.login.service;

import org.springframework.flex.roo.addon.RooFlexScaffold;
import com.login.entity.AuthorityEntity;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Service;

@RooFlexScaffold(entity = AuthorityEntity.class)
@RemotingDestination
@Service
public class AuthorityService {
}
