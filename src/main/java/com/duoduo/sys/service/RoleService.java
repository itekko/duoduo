package com.duoduo.sys.service;

import com.duoduo.common.base.CoreService;
import com.duoduo.sys.domain.RoleDO;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * <pre>
 * </pre>
 * <small> 2018年3月23日 | Aron</small>
 */
@Service
public interface RoleService extends CoreService<RoleDO> {
    List<RoleDO> findAll();
    List<RoleDO> findListStatusByUserId(Serializable id);
    List<RoleDO> findListByUserId(Serializable id);
}
