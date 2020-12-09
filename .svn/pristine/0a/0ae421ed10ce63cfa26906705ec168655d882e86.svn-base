package org.ulis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String userAgent = request.getHeader("User-Agent") != null ? request.getHeader("User-Agent") : "";
		HttpSession httpSession = request.getSession(true);

		if (userAgent.indexOf("Windows") > -1) {
			Object id = httpSession.getAttribute("id");
			if (id != null) {
				return super.preHandle(request, response, handler);
			}
		} else if (userAgent.indexOf("okhttp") > -1) {
			return true;
		} else {
		}

		response.sendRedirect(request.getContextPath() + "/login");
		return false;
	}
}