package org.ulis.presentation;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.ulis.domain.NoticeBoardFile;
import org.ulis.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {
	@Resource
	FileService fileService;

	private String downloadPath = "C:\\Users\\com\\Downloads\\ULIS\\";

	@RequestMapping("/download/{physicsfileName}")
	public void download(@PathVariable String physicsfileName, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		NoticeBoardFile downloadItem = new NoticeBoardFile();
		downloadItem = this.fileService.download(physicsfileName);

		String[] filePaths = downloadItem.getFilePath().split(" ");
		
		String filePath = new File(downloadPath).getAbsolutePath() + File.separator + filePaths[0] + File.separator
				+ downloadItem.getPhysicsfileName();

		byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath));

		String clientBrowser = request.getHeader("user-agent");
		String fileName;
		
		if (clientBrowser.indexOf("MSIE") > -1 || clientBrowser.indexOf("Trident") > -1) {
			fileName = URLEncoder.encode(downloadItem.getLogicfileName(), "UTF-8").replaceAll("\\+", "%20");
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\";");
		} else if (clientBrowser.indexOf("Chrome") > -1) {
			fileName = new String(downloadItem.getLogicfileName().getBytes("UTF-8"), "8859_1");
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\";");
		} else if (clientBrowser.indexOf("Opera") > -1) {
			fileName = "\"" + new String(downloadItem.getLogicfileName().getBytes("UTF-8"), "8859_1") + "\"";
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\";");
		} else if (clientBrowser.indexOf("Firefox") > -1) {
			fileName = new String(downloadItem.getLogicfileName().getBytes("UTF-8"), "8859_1");
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\";");
		}
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
