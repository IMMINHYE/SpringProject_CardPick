package com.card.domain;

import com.card.dto.MemberDTO;
import com.card.dto.MemberDTO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.stream.Collectors;


@Getter @Setter
public class CustomUser extends User {
	private MemberDTO member;
	
	public CustomUser(MemberDTO vo) {
		super(vo.getUserId(),vo.getUserpass(),vo.getAuthList().stream().map(auth->new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList())
		);
		this.member=vo;
	}
	

}
