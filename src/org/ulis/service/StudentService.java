package org.ulis.service;

import java.util.List;
import java.util.Map;

import org.ulis.domain.Student;

public interface StudentService {
	public Map<String,Object> view(String studentNo);
	public void update(Student student);
	public List<Map<String, Object>> find(int subjectNo);
	public void edit(Student student);
	public boolean check(String password);
}
