package org.ulis.persistence;

import java.util.List;

import org.ulis.domain.NoticeBoard;

public interface NoticeBoardMapper {
    public List<NoticeBoard> list(NoticeBoard noticeBoard);
    public NoticeBoard select(NoticeBoard noticeBoard);
    public void insert(NoticeBoard noticeBoard);
    public void update(NoticeBoard noticeBoard);
    public void delete(NoticeBoard noticeBoard);
}
