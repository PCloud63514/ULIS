package org.ulis.persistence;

import java.util.List;

import org.ulis.domain.NoticeBoardFile;

public interface NoticeBoardFileMapper {
    public List<NoticeBoardFile> select(NoticeBoardFile noticeBoardFile);
    public void insert(NoticeBoardFile noticeBoardFile);
    public void update(NoticeBoardFile noticeBoardFile);
    public void delete(NoticeBoardFile noticeBoardFile);
    public NoticeBoardFile download(NoticeBoardFile noticeBoard);
}
