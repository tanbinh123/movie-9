package movie.mapper;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TeacherMapper {

    public int insertTeacher(Map<String,Object> map);

    public int deleteTeacherByIds(List idList);

    public int selectTeacherCount(Map<String,Object> map);

    public List<Map<String,Object>> selectTeacherList(Map<String,Object> map);
}
