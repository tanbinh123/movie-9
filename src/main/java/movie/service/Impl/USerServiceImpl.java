package movie.service.Impl;

import movie.mapper.UserMapper;
import movie.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

// 表示这是service业务逻辑层
@Service
public class USerServiceImpl implements IUserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public int insertUser(Map<String, Object> map) {
        return userMapper.insertUser(map);
    }

    @Override
    public int deleteUserByIds(List idList) {
        return userMapper.deleteUserByIds(idList);
    }

    @Override
    public int selectUserCount(Map<String, Object> map) {
        return userMapper.selectUserCount(map);
    }

    @Override
    public List<Map<String, Object>> selectUserList(Map<String, Object> map) {
        return userMapper.selectUserList(map);
    }

    @Override
    public int insertVideo(Map<String, Object> map) {
        System.out.println("map--"+map);
        int id = userMapper.insertVideo(map);
        System.out.println("sql:"+id);
        return id;
    }


}
