package com.duoduo.sys.service;

import com.duoduo.common.base.CoreService;
import com.duoduo.common.domain.Tree;
import com.duoduo.sys.domain.DeptDO;

/**
 * <pre>
 * 部门管理
 * </pre>
 * <small> 2018年3月23日 | Aron</small>
 */
public interface DeptService extends CoreService<DeptDO> {
    
	Tree<DeptDO> getTree();
	
	boolean checkDeptHasUser(Long deptId);
}
