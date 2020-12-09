package org.ulis.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.ulis.domain.IntegrationMessage;
import org.ulis.domain.Student;

public interface IntegrationMessageService {
	public Map<String,Object> view(int sendNo);
	public void send(String students, IntegrationMessage integrationMessage);
	public List<Map<String,Object>> find();
	public List<Student> searchGrade(int gradeNo, HttpServletRequest request);
	public boolean checkNull(IntegrationMessage integrationMessage,String students);
	
	
}
