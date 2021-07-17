package movie.service;

import java.util.List;
import java.util.Map;

public interface ITeacherService {

    public int insertTeacher(Map<String,Object> map);
    public int deleteTeacherByIds(List idList);

    public int selectTeacherCount(Map<String,Object> map);

    public List<Map<String, Object>> selectTeacherList(Map<String,Object> map);
}
