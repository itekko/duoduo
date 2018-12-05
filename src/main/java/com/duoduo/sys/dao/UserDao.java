package com.duoduo.sys.dao;

import com.duoduo.common.base.BaseDao;
import com.duoduo.sys.domain.UserDO;

/**
 * <pre>
 * </pre>
 * <small> 2018年3月23日 | Aron</small>
 */
public interface UserDao extends BaseDao<UserDO> {
	
	Long[] listAllDept();

}
