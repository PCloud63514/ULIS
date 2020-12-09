package org.ulis.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.ulis.domain.NoticeBoardFile;
import org.ulis.persistence.NoticeBoardFileMapper;

@Service
public class FileServiceImpl implements FileService{
	@Resource
	private NoticeBoardFileMapper noticeBoardFileMapper;
	
	@Override
    public NoticeBoardFile download(String physicsfileName) throws IOException {
		NoticeBoardFile downloadItem = new NoticeBoardFile();
        downloadItem.setPhysicsfileName(physicsfileName);
        
        downloadItem = this.noticeBoardFileMapper.download(downloadItem);
        
        return downloadItem;
    }
}
