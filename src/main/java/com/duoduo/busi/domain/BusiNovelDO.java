package com.duoduo.busi.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.duoduo.common.base.BaseDO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * <pre>
 * 小说表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("t_busi_novel")
@EqualsAndHashCode(callSuper=true) 
public class BusiNovelDO extends BaseDO {
	@TableId
	private Long id;

    /** 小说名称 */
    private String novelname;

    /** 作者 */
    private String author;

    /** 备注 */
    private String remarks;

    /** 评分 */
    private Double rank;

    /** 字数，单位-万字 */
    private Double count;

    /** 点击数，单位-万次 */
    private Double clicks;

    /** 删除标识，0--正常，1--删除 */
    private Integer activeFlag;

    /** 创建时间 */
    private Date createTime;

    /** 创建人ID */
    private String createId;

    /** 更新时间 */
    private Date updateTime;

    /** 更新人ID */
    private String updateId;

}
