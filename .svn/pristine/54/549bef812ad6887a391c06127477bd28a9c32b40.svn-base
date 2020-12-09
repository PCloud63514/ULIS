package org.ulis.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.ulis.domain.Student;
import org.ulis.persistence.StudentMapper;

@Service
public class StudentServiceImpl implements StudentService {
	@Resource
	private StudentMapper studentMapper;

	@Override
	public List<Map<String, Object>> find(int subjectNo) {
		System.out.println("subjectNo:" + subjectNo);
		List<Map<String, Object>> studentList = null;
		Student student = new Student();
		student.setSubjectNo(subjectNo);

		studentList = studentMapper.selectList(student);

		System.out.println(studentList.toString());

		return studentList;
	}

	@Override
	public Map<String, Object> view(String studentNo) {

		Student studentOne = null;

		Student student = new Student();
		student.setStudentNo(studentNo);

		Map<String, Object> studentInfo = studentMapper.selectOne(student);

		Set<String> set = studentInfo.keySet();
		Iterator i = set.iterator();
		while (i.hasNext()) {
			System.out.println(i.next());
		}
		return studentInfo;
	}

	@Override
	public void update(Student student) {

		studentMapper.updateStudent(student);
	}

	@Override
	public void edit(Student student) { // 패스워드수정
		studentMapper.updateEdit(student);
	}

	@Override
	public boolean check(String password) {
		ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder
				.currentRequestAttributes();
		HttpServletRequest request = servletRequestAttribute.getRequest();
		HttpSession session = request.getSession(true);
		String studentNo = (String) session.getAttribute("id");
		Student student = new Student();
		student.setStudentNo(studentNo);
		student.setPassword(password);

		Student studentCheck = null; 
		studentCheck = studentMapper.select(student);
		if (studentCheck != null) {
			return true;
		}
		return false;
	}
}
