package org.ulis.presentation;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.ulis.domain.NoticeBoard;
import org.ulis.domain.NoticeBoardFile;
import org.ulis.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	
	@RequestMapping(value = "/find/mobile", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<NoticeBoard>> findMobile(HttpServletRequest request) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(new MediaType("text", "json", Charset.forName("UTF-8")));
		HttpSession session = request.getSession(false);
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setSubjectNo((int) session.getAttribute("subjectNo"));

		List<NoticeBoard> noticeBoardList = this.noticeService.find(noticeBoard);
		return new ResponseEntity<List<NoticeBoard>>(noticeBoardList, httpHeaders, HttpStatus.OK);
	}
	
	
	
	
	
	// Agent
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public ModelAndView find(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setSubjectNo((int) session.getAttribute("subjectNo"));

		List<NoticeBoard> noticeBoardList = this.noticeService.find(noticeBoard);
		ModelAndView modelAndView = new ModelAndView("/notice/find");
		modelAndView.addObject("noticeBoardList", noticeBoardList);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		return new ModelAndView("/notice/add");
	}

	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request, NoticeBoard noticeBoard) throws Exception {
		HttpSession session = request.getSession(false);

		int subjectNo = session.getAttribute("subjectNo") != null ? (int) session.getAttribute("subjectNo") : 0;
		String administratorNo = session.getAttribute("id") != null ? (String) session.getAttribute("id") : "";

		noticeBoard.setSubjectNo(subjectNo);
		noticeBoard.setAdministratorNo(administratorNo);

		if (this.noticeService.isNoticeBoardAddNull(noticeBoard) == false) {
			return new ModelAndView("/notice/add");
		}

		int noticeBoardNo = this.noticeService.addNotice(noticeBoard);

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		MultipartFile imageFile = multipartRequest.getFile("image");
		if (!imageFile.isEmpty()) {
			this.noticeService.addFile(imageFile, "I", noticeBoardNo);
		}

		List<MultipartFile> attachFile = multipartRequest.getFiles("file");
		if (!attachFile.isEmpty() && !"".equals(attachFile.get(0).getOriginalFilename())) {
			for (int fileCount = 0; fileCount < attachFile.size(); fileCount++) {
				this.noticeService.addFile(attachFile.get(fileCount), "D", noticeBoardNo);
			}
		}

		return new ModelAndView(new RedirectView("/notice/find"));
	}

	@RequestMapping(value = "/view/mobile/{noticeBoardNo}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map> viewMobile(@PathVariable int noticeBoardNo, HttpServletRequest request) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(new MediaType("text", "json", Charset.forName("UTF-8")));
		
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setNoticeBoardNo(noticeBoardNo);
		
		Map map = this.noticeService.view(noticeBoard);
		
		return new ResponseEntity<Map>(map, httpHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/view/{noticeBoardNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int noticeBoardNo, HttpServletRequest request,
			HttpServletResponse response) {
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setNoticeBoardNo(noticeBoardNo);

		Map<String, Object> noticeViewMap = this.noticeService.view(noticeBoard);

		ModelAndView modelAndView = new ModelAndView("/notice/view");
		modelAndView.addObject("noticeBoard", noticeViewMap.get("noticeboard"));
		modelAndView.addObject("image", noticeViewMap.get("image"));
		modelAndView.addObject("document", noticeViewMap.get("document"));

		return modelAndView;
	}

	@RequestMapping(value = "/remove/{noticeBoardNo}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int noticeBoardNo) {
		this.noticeService.remove(noticeBoardNo);

		return new ModelAndView(new RedirectView("/notice/find"));
	}

	@RequestMapping(value = "/edit/{noticeBoardNo}", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable int noticeBoardNo) {
		NoticeBoard noticeBoard = new NoticeBoard();
		noticeBoard.setNoticeBoardNo(noticeBoardNo);

		Map<String, Object> noticeViewMap = this.noticeService.view(noticeBoard);

		ModelAndView modelAndView = new ModelAndView("/notice/edit");
		modelAndView.addObject("noticeBoard", noticeViewMap.get("noticeboard"));
		modelAndView.addObject("image", noticeViewMap.get("image"));
		modelAndView.addObject("document", noticeViewMap.get("document"));

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{noticeBoardNo}", method = RequestMethod.POST)
	public ModelAndView edit(@PathVariable int noticeBoardNo, NoticeBoard noticeBoard,
			HttpServletRequest httpServletRequest) {
		if (this.noticeService.isNoticeBoardAddNull(noticeBoard) == false) {
			return new ModelAndView(new RedirectView("/notice/edit/" + noticeBoardNo));
		}
		;
		noticeBoard.setNoticeBoardNo(noticeBoardNo);
		this.noticeService.edit(noticeBoard);
		return new ModelAndView(new RedirectView("/notice/view/" + noticeBoardNo));
	}

	public void alarm() {

	}

	@RequestMapping("/image/{physicsfileName}")
	public void image(@PathVariable String physicsfileName, HttpServletResponse httpServletResponse) {
		this.noticeService.imageView(physicsfileName, httpServletResponse);
	}

	@RequestMapping("/view/download/{physicsfileName}")
	public void download(@PathVariable String physicsfileName, HttpServletResponse response) throws IOException {
		NoticeBoardFile downloadItem = new NoticeBoardFile();
		downloadItem = this.noticeService.download(physicsfileName);

		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\Users\\COM\\Downloads\\ULIS\\"
				+ downloadItem.getFilePath() + "\\" + downloadItem.getPhysicsfileName()));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + URLEncoder.encode(downloadItem.getLogicfileName(), "UTF-8") + "\";");
		response.setHeader("Content-Ttransfere-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}
