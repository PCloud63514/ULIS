package org.ulis.persistence;

import java.util.List;
import java.util.Map;

import org.ulis.domain.Send;

public interface SendMapper {
    public Map<String,Object> selectOne(Send send);
    public List<Map<String,Object>> selectList(Send send);
    public void insert(Send send);
    public void update(Send send);
}
