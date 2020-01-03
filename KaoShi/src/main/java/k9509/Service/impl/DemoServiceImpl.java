package k9509.Service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import k9509.Service.DemoService;
import k9509.domain.Category;
import k9509.domain.CategoryId;
import k9509.domain.Entry;
import k9509.mapper.CategoryMapper;
import k9509.mapper.EntryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DemoServiceImpl  implements DemoService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private EntryMapper entryMapper;


    @Override
    public List<Category> findAllCategory() {
        return categoryMapper.queryAllCategory();
    }

    @Override
    public PageInfo findByCategoryId(CategoryId categoryid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Entry> entryList = entryMapper.queryByCategoryId(categoryid);
        PageInfo pageInfo = new PageInfo(entryList);
        return pageInfo;
    }

    @Override
    public boolean addEntry(Entry entry) {
        return entryMapper.insert(entry)>0?true:false;
    }

    @Override
    public Entry findById(Integer id) {
        return entryMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateEntryByEntry(Entry entry) {
        return entryMapper.updateByPrimaryKeySelective(entry)>0?true:false;
    }

    @Override
    public boolean delete(Integer id) {
        return entryMapper.deleteByPrimaryKey(id)>0?true:false;
    }

    @Override
    public PageInfo findAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Entry> entryList = entryMapper.queryAll();
        PageInfo pageInfo = new PageInfo(entryList);
        return pageInfo;
    }

}
