package movie.service.Impl;

import movie.mapper.UserMapper;
import movie.service.IUserService;
import movie.util.ToolUtil;
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

    @Override
    public int insertListVideo(List<Map<String, Object>> list) {
        return userMapper.insertListVideo(list);
    }

    @Override
    public List<Map<String, Object>> selectVideoList() {
        List<Map<String,Object>> list=userMapper.selectVideoList();
        //String name1= ToolUtil.getFileSuffixName(name);
        for(int i=0;i<list.size();i++){
            Map<String,Object> map=list.get(i);
            String name=map.get("video_movie_url").toString();
            //获取后缀
            String name1= ToolUtil.getFileSuffixName(name);
            map.put("suffixName",name1);
        }
        System.out.println(list);
        return list;
    }


}
