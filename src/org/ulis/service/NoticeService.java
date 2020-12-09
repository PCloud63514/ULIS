package org.ulis.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.ulis.domain.NoticeBoard;
import org.ulis.domain.NoticeBoardFile;

public interface NoticeService {
	public List<NoticeBoard> find(NoticeBoard noticeBoard);
	
	public int count(NoticeBoard noticeBoard);
	
	public void setGrade(NoticeBoard noticeBoard);
	
	public Boolean isNoticeBoardAddNull(NoticeBoard noticeBoard);
	
	public int addNotice(NoticeBoard noticeBoard);
	
	public void addFile(MultipartFile multipartFile, String division,int noticeSEQ) throws Exception;
	
	public Map<String, Object> view(NoticeBoard noticeBoard);
	
	public void remove(int noticeBoardNo);
	
	public Map<String, Object> edit(NoticeBoard noticeBoard);
	
	public void alarm(int grade);
	
	public NoticeBoardFile imageView(String physicsfileName, HttpServletResponse httpServletResponse);
	
	public NoticeBoardFile download(String physicsfileName) throws IOException;
}
