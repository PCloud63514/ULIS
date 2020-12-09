package org.ulis.service;

import java.io.IOException;

import org.ulis.domain.NoticeBoardFile;

public interface FileService {
	public NoticeBoardFile download(String physicsfileName) throws IOException;
}
