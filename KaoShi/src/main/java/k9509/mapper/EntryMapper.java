package k9509.mapper;

import k9509.domain.CategoryId;
import k9509.domain.Entry;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface EntryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Entry record);

    int insertSelective(Entry record);

    Entry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Entry record);

    int updateByPrimaryKey(Entry record);

    List<Entry> queryByCategoryId(CategoryId categoryid);

    @Select("select * from entry")
    List<Entry> queryAll();
}