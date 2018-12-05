package com.duoduo.busi.domain;


import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.duoduo.common.base.BaseDO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * <pre>
 * 标签小说中间表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("t_busi_notag")
@EqualsAndHashCode(callSuper=true) 
public class BusiNotagDO extends BaseDO {
	@TableId
	private Long id;

    /** 标签ID */
    private String tagId;

    /** 小说ID */
    private String novelId;

}
