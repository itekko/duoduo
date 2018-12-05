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
import com.duoduo.busi.domain.BusiNotagDO;
import com.duoduo.busi.service.BusiNotagService;
import com.duoduo.common.utils.Result;

/**
 * 
 * <pre>
 * 标签小说中间表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Controller
@RequestMapping("/busi/busiNotag")
public class BusiNotagController extends AdminBaseController {
	@Autowired
	private BusiNotagService busiNotagService;
	
	@GetMapping()
	@RequiresPermissions("busi:busiNotag:busiNotag")
	String BusiNotag(){
	    return "busi/busiNotag/busiNotag";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("busi:busiNotag:busiNotag")
	public Result<Page<BusiNotagDO>> list(BusiNotagDO busiNotagDTO){
        Wrapper<BusiNotagDO> wrapper = new EntityWrapper<BusiNotagDO>().orderBy("id", false);
        Page<BusiNotagDO> page = busiNotagService.selectPage(getPage(BusiNotagDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("busi:busiNotag:add")
	String add(){
	    return "busi/busiNotag/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("busi:busiNotag:edit")
	String edit(@PathVariable("id") String id,Model model){
		BusiNotagDO busiNotag = busiNotagService.selectById(id);
		model.addAttribute("busiNotag", busiNotag);
	    return "busi/busiNotag/edit";
	}
	
	@Log("添加标签小说中间表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("busi:busiNotag:add")
	public Result<String> save( BusiNotagDO busiNotag){
		busiNotagService.insert(busiNotag);
        return Result.ok();
	}
	
	@Log("修改标签小说中间表")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("busi:busiNotag:edit")
	public Result<String>  update( BusiNotagDO busiNotag){
		boolean update = busiNotagService.updateById(busiNotag);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除标签小说中间表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("busi:busiNotag:remove")
	public Result<String>  remove( String id){
		busiNotagService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除标签小说中间表")
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("busi:busiNotag:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") String[] ids){
		busiNotagService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
