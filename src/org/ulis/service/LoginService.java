package org.ulis.service;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	public Object login(String userNo, String password, String userToken);
	public void logout(HttpServletRequest request);

}
