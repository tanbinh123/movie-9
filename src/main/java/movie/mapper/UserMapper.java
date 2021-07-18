package movie.mapper;

import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface UserMapper {

    public int insertUser(Map<String,Object> map);

    public int deleteUserByIds(List idList);

    public int selectUserCount(Map<String,Object> map);

    public List<Map<String,Object>> selectUserList(Map<String,Object> map);

    public int insertVideo(Map<String,Object> map);

    public int insertListVideo(List<Map<String,Object>> list);

    public List<Map<String,Object>> selectVideoList();
}
