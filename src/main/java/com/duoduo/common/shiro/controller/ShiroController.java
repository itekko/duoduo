package com.duoduo.common.shiro.controller;

import com.duoduo.common.type.EnumErrorCode;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.duoduo.common.base.AdminBaseController;
import com.duoduo.common.utils.Result;

/**
 * <pre>
 * </pre>
 * 
 * <small> 2018年5月1日 | Aron</small>
 */
@RestController
@RequestMapping("/shiro")
public class ShiroController extends AdminBaseController {

    @RequestMapping("/405")
    public Result<String> http405() {
        return Result.build(EnumErrorCode.apiAuthorizationInvalid.getCode(), EnumErrorCode.apiAuthorizationInvalid.getMsg());
    }
    
    @RequestMapping("/500")
    public Result<String> http500() {
        return Result.build(EnumErrorCode.unknowFail.getCode(), EnumErrorCode.unknowFail.getMsg());
    }
}
