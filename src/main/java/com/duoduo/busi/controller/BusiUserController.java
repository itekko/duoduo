package com.duoduo.busi.controller;


import java.util.Arrays;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.duoduo.common.annotation.Log;
import com.duoduo.common.base.AdminBaseController;
import com.duoduo.busi.domain.BusiUserDO;
import com.duoduo.busi.service.BusiUserService;
import com.duoduo.common.utils.Result;

/**
 * 
 * <pre>
 * 小说用户表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Controller
@RequestMapping("/busi/busiUser")
public class BusiUserController extends AdminBaseController {
	@Autowired
	private BusiUserService busiUserService;
	
	@GetMapping()
	@RequiresPermissions("busi:busiUser:busiUser")
	String BusiUser(){
	    return "busi/busiUser/busiUser";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("busi:busiUser:busiUser")
	public Result<Page<BusiUserDO>> list(BusiUserDO busiUserDTO){
        Wrapper<BusiUserDO> wrapper = new EntityWrapper<BusiUserDO>().orderBy("id", false);
        Page<BusiUserDO> page = busiUserService.selectPage(getPage(BusiUserDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("busi:busiUser:add")
	String add(){
	    return "busi/busiUser/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("busi:busiUser:edit")
	String edit(@PathVariable("id") String id,Model model){
		BusiUserDO busiUser = busiUserService.selectById(id);
		model.addAttribute("busiUser", busiUser);
	    return "busi/busiUser/edit";
	}
	
	@Log("添加小说用户表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("busi:busiUser:add")
	public Result<String> save( BusiUserDO busiUser){
		busiUserService.insert(busiUser);
        return Result.ok();
	}
	
	@Log("修改小说用户表")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("busi:busiUser:edit")
	public Result<String>  update( BusiUserDO busiUser){
		boolean update = busiUserService.updateById(busiUser);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除小说用户表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("busi:busiUser:remove")
	public Result<String>  remove( String id){
		busiUserService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除小说用户表")
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("busi:busiUser:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") String[] ids){
		busiUserService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
