package movie.service;

import java.util.List;
import java.util.Map;

public interface IUserService {

    public int insertUser(Map<String,Object> map);
    public int deleteUserByIds(List idList);

    public int selectUserCount(Map<String,Object> map);

    public List<Map<String, Object>> selectUserList(Map<String,Object> map);

    public int insertVideo(Map<String,Object> map);

}
