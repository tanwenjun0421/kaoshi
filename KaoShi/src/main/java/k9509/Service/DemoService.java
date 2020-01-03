package k9509.Service;


import com.github.pagehelper.PageInfo;
import k9509.domain.Category;
import k9509.domain.CategoryId;
import k9509.domain.Entry;

import java.util.List;

public interface DemoService {

    List<Category> findAllCategory();

    PageInfo findByCategoryId(CategoryId categoryid, Integer pageNum, Integer pageSize);

    boolean addEntry(Entry entry);

    Entry findById(Integer id);

    boolean updateEntryByEntry(Entry entry);

    boolean delete(Integer id);

    PageInfo findAll(Integer pageNum,Integer pageSize);

}
