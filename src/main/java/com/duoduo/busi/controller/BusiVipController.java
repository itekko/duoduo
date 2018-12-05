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
import com.duoduo.busi.domain.BusiVipDO;
import com.duoduo.busi.service.BusiVipService;
import com.duoduo.common.utils.Result;

/**
 * 
 * <pre>
 * vip表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Controller
@RequestMapping("/busi/busiVip")
public class BusiVipController extends AdminBaseController {
	@Autowired
	private BusiVipService busiVipService;
	
	@GetMapping()
	@RequiresPermissions("busi:busiVip:busiVip")
	String BusiVip(){
	    return "busi/busiVip/busiVip";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("busi:busiVip:busiVip")
	public Result<Page<BusiVipDO>> list(BusiVipDO busiVipDTO){
        Wrapper<BusiVipDO> wrapper = new EntityWrapper<BusiVipDO>().orderBy("id", false);
        Page<BusiVipDO> page = busiVipService.selectPage(getPage(BusiVipDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("busi:busiVip:add")
	String add(){
	    return "busi/busiVip/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("busi:busiVip:edit")
	String edit(@PathVariable("id") String id,Model model){
		BusiVipDO busiVip = busiVipService.selectById(id);
		model.addAttribute("busiVip", busiVip);
	    return "busi/busiVip/edit";
	}
	
	@Log("添加vip表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("busi:busiVip:add")
	public Result<String> save( BusiVipDO busiVip){
		busiVipService.insert(busiVip);
        return Result.ok();
	}
	
	@Log("修改vip表")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("busi:busiVip:edit")
	public Result<String>  update( BusiVipDO busiVip){
		boolean update = busiVipService.updateById(busiVip);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除vip表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("busi:busiVip:remove")
	public Result<String>  remove( String id){
		busiVipService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除vip表")
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("busi:busiVip:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") String[] ids){
		busiVipService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
