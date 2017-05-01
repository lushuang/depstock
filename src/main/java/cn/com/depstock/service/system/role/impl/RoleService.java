package cn.com.depstock.service.system.role.impl;

import cn.com.depstock.dao.DaoSupport;
import cn.com.depstock.entity.system.Role;
import cn.com.depstock.service.system.role.RoleManager;
import cn.com.depstock.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色
 */
@Service("roleService")
public class RoleService implements RoleManager {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * 列出此组下级角色
     *
     * @param pd
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Role> listAllRolesByPId(PageData pd) throws Exception {
        return (List<Role>) dao.findForList("RoleMapper.listAllRolesByPId", pd);
    }

    /**
     * 通过id查找
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public PageData findObjectById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("RoleMapper.findObjectById", pd);
    }

    /**
     * 添加
     *
     * @param pd
     * @throws Exception
     */
    public void add(PageData pd) throws Exception {
        dao.save("RoleMapper.insert", pd);
    }

    /**
     * 保存修改
     *
     * @param pd
     * @throws Exception
     */
    public void edit(PageData pd) throws Exception {
        dao.update("RoleMapper.edit", pd);
    }

    /**
     * 删除角色
     *
     * @param ROLE_ID
     * @throws Exception
     */
    public void deleteRoleById(String ROLE_ID) throws Exception {
        dao.delete("RoleMapper.deleteRoleById", ROLE_ID);
    }

    /**
     * 给当前角色附加菜单权限
     *
     * @param role
     * @throws Exception
     */
    public void updateRoleRights(Role role) throws Exception {
        dao.update("RoleMapper.updateRoleRights", role);
    }

    /**
     * 通过id查找
     *
     * @param roleId
     * @return
     * @throws Exception
     */
    public Role getRoleById(String ROLE_ID) throws Exception {
        return (Role) dao.findForObject("RoleMapper.getRoleById", ROLE_ID);
    }

    /**
     * 给全部子角色加菜单权限
     *
     * @param pd
     * @throws Exception
     */
    public void setAllRights(PageData pd) throws Exception {
        dao.update("RoleMapper.setAllRights", pd);
    }

    /**
     * 权限(增删改查)
     *
     * @param msg 区分增删改查
     * @param pd
     * @throws Exception
     */
    public void saveB4Button(String msg, PageData pd) throws Exception {
        dao.update("RoleMapper." + msg, pd);
    }

}
