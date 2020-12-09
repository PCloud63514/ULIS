package org.ulis.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.ulis.domain.Administrator;
import org.ulis.domain.Student;
import org.ulis.persistence.AdministratorMapper;
import org.ulis.persistence.StudentMapper;

@Service
public class LoginServiceImpl implements LoginService {
	@Resource
	private StudentMapper studentMapper;

	@Resource
	private AdministratorMapper administratorMapper;

	@Override
	public Object login(String userNo, String password, String userToken){
		ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder
				.currentRequestAttributes();
		HttpServletRequest request = servletRequestAttribute.getRequest();
		
		String userAgent = request.getHeader("User-Agent");
		
		if (userAgent.indexOf("Windows") > -1) {
			Administrator administrator = new Administrator();
			administrator.setAdministratorNo(userNo);
			administrator.setPassword(password);
			
			administrator = this.administratorMapper.select(administrator);
			if (administrator != null) {
				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("agentType", "W");
				httpSession.setAttribute("roleType", "A");
				httpSession.setAttribute("id", administrator.getAdministratorNo());
				httpSession.setAttribute("subjectNo", administrator.getSubjectNo());
				httpSession.setAttribute("administratorName", administrator.getAdministratorName());
				
				return administrator;
			}
		} else if (userAgent.indexOf("okhttp") > -1) {
			Student student = new Student();
			student.setStudentNo(userNo);
			student.setPassword(password);

			student = this.studentMapper.select(student);
			if (student != null) {
				student.setFcmToken(userToken);

				this.studentMapper.updateFcm(student);
				String subjectName = this.studentMapper.selectSubject(student);
				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("agentType", "A");
				httpSession.setAttribute("roleType", "S");
				httpSession.setAttribute("id", student.getStudentNo());
				httpSession.setAttribute("subjectNo", student.getSubjectNo());
				
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("student", student);
				map.put("subjectName", subjectName);
				return map;
			}
		} 
		
		return null;
	}

	@Override
	public void logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession(false);
		if (httpSession != null) {
			httpSession.invalidate();
		}
	}
}