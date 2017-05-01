package cn.com.depstock.service.system.dictionaries;

import cn.com.depstock.entity.Page;
import cn.com.depstock.entity.system.Dictionaries;
import cn.com.depstock.util.PageData;

import java.util.List;

/**
 * 说明： 数据字典接口类
 */
public interface DictionariesManager {

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    public void save(PageData pd) throws Exception;

    /**
     * 删除
     *
     * @param pd
     * @throws Exception
     */
    public void delete(PageData pd) throws Exception;

    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception;

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    public List<PageData> list(Page page) throws Exception;

    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findById(PageData pd) throws Exception;

    /**
     * 通过编码获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData findByBianma(PageData pd) throws Exception;

    /**
     * 通过ID获取其子级列表
     *
     * @param parentId
     * @return
     * @throws Exception
     */
    public List<Dictionaries> listSubDictByParentId(String parentId) throws Exception;

    /**
     * 获取所有数据并填充每条数据的子级列表(递归处理)
     *
     * @param MENU_ID
     * @return
     * @throws Exception
     */
    public List<Dictionaries> listAllDict(String parentId) throws Exception;

    /**
     * 排查表检查是否被占用
     *
     * @param pd
     * @throws Exception
     */
    public PageData findFromTbs(PageData pd) throws Exception;

}

