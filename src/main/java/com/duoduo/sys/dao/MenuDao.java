package com.duoduo.sys.dao;

import java.util.List;

import com.duoduo.common.base.BaseDao;
import com.duoduo.sys.domain.MenuDO;

/**
 * <pre>
 * 菜单管理
 * </pre>
 * <small> 2018年3月23日 | Aron</small>
 */
public interface MenuDao extends BaseDao<MenuDO> {
	
	List<MenuDO> listMenuByUserId(Long id);
	
	List<String> listUserPerms(Long id);
}
