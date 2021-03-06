package cn.com.depstock.service.information.pictures.impl;

import cn.com.depstock.dao.DaoSupport;
import cn.com.depstock.entity.Page;
import cn.com.depstock.service.information.pictures.PicturesManager;
import cn.com.depstock.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * 图片管理
 */
@Service("picturesService")
public class PicturesService implements PicturesManager {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * 列表
     *
     * @param page
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("PicturesMapper.datalistPage", page);
    }

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd) throws Exception {
        dao.save("PicturesMapper.save", pd);
    }

    /**
     * 删除
     *
     * @param pd
     * @throws Exception
     */
    public void delete(PageData pd) throws Exception {
        dao.delete("PicturesMapper.delete", pd);
    }

    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception {
        dao.update("PicturesMapper.edit", pd);
    }

    /**
     * 通过id获取数据
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("PicturesMapper.findById", pd);
    }

    /**
     * 批量删除
     *
     * @param ArrayDATA_IDS
     * @throws Exception
     */
    public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
        dao.delete("PicturesMapper.deleteAll", ArrayDATA_IDS);
    }

    /**
     * 批量获取
     *
     * @param ArrayDATA_IDS
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<PageData> getAllById(String[] ArrayDATA_IDS) throws Exception {
        return (List<PageData>) dao.findForList("PicturesMapper.getAllById", ArrayDATA_IDS);
    }

    /**
     * 删除图片
     *
     * @param pd
     * @throws Exception
     */
    public void delTp(PageData pd) throws Exception {
        dao.update("PicturesMapper.delTp", pd);
    }

    /**
     * 查询占用总数
     *
     * @param pd
     * @throws Exception
     */
    public PageData findCount(PageData pd) throws Exception {
        return (PageData) dao.findForObject("PicturesMapper.findCount", pd);
    }
}

