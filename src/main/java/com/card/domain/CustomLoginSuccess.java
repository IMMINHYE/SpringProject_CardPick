package com.card.domain;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
public class CustomLoginSuccess implements AuthenticationSuccessHandler{
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 로그인 성공 핸들러
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		// 비밀번호 인코딩
		String encPwd = passwordEncoder.encode(request.getParameter("password"));
		System.out.println("password:"+encPwd);

		// 사용자 역할 가져오기
		List<String> roleNames = new ArrayList();
		authentication.getAuthorities().forEach(authority->roleNames.add(authority.getAuthority()));

		System.out.println("roleNames:"+roleNames);

		// 사용자 역할에 따라 페이지 리다이렉트
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/home");
			return;
		}
		if(roleNames.contains("ROLE_MANAGER")) {
			response.sendRedirect("/home");
			return;
		}
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/home");
		}
	}
}
