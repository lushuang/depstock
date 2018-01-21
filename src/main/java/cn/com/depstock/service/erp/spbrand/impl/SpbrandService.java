package cn.com.depstock.service.erp.spbrand.impl;

import cn.com.depstock.dao.DaoSupport;
import cn.com.depstock.entity.Page;
import cn.com.depstock.service.erp.spbrand.SpbrandManager;
import cn.com.depstock.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 说明： 品牌管理
 */
@Service("spbrandService")
public class SpbrandService implements SpbrandManager {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd) throws Exception {
        dao.save("SpbrandMapper.save", pd);
    }

    /**
     * 删除
     *
     * @param pd
     * @throws Exception
     */
    public void delete(PageData pd) throws Exception {
        dao.delete("SpbrandMapper.delete", pd);
    }

    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception {
        dao.update("SpbrandMapper.edit", pd);
    }

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("SpbrandMapper.datalistPage", page);
    }

    /**
     * 列表(全部)
     *
     * @param pd
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> listAll(String USERNAME) throws Exception {
        return (List<PageData>) dao.findForList("SpbrandMapper.listAll", USERNAME);
    }

    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("SpbrandMapper.findById", pd);
    }

    @Override
    public PageData findByName(String name) throws Exception {
        return (PageData) dao.findForObject("SpbrandMapper.findByName", name);
    }

    /**
     * 批量删除
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
        dao.delete("SpbrandMapper.deleteAll", ArrayDATA_IDS);
    }

}

