package com.icloud.basecommon.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.icloud.basecommon.dao.BaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

public abstract class BaseServiceImp <M extends BaseMapper<T>, T> implements BaseService<T> {
    @Autowired
    protected M mapper;

    public void setMapper(M mapper) {
        this.mapper = mapper;
    }

    @Override
    public int save(T record) {
        return mapper.insert(record);
    }

    @Override
    public int update(T record)  {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<T> findList(T record)  {
        return mapper.findForList(record);
    }

    @Override
    public Integer findCount(T record)  {
        return mapper.findCount(record);
    }

    @Override
    public int delete(Long id)  {
       return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public T findByKey(Long id)  {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<T> findByPage(int pageNo, int pageSize, T t)  {
        PageHelper.startPage(pageNo, pageSize);
        PageInfo<T> page = new PageInfo<T>(mapper.findForList(t));
        return page;
    }

}
