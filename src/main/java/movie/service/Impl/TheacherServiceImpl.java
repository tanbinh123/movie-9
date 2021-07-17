package movie.service.Impl;

import movie.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

// 表示这是service业务逻辑层
@Service
public class TheacherServiceImpl implements ITeacherService {

    @Autowired
    movie.mapper.TeacherMapper TeacherMapper;

    @Override
    public int insertTeacher(Map<String, Object> map) {
        return TeacherMapper.insertTeacher(map);
    }

    @Override
    public int deleteTeacherByIds(List idList) {
        return TeacherMapper.deleteTeacherByIds(idList);
    }

    @Override
    public int selectTeacherCount(Map<String, Object> map) {
        return TeacherMapper.selectTeacherCount(map);
    }

    @Override
    public List<Map<String, Object>> selectTeacherList(Map<String, Object> map) {
        return TeacherMapper.selectTeacherList(map);
    }
}
