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
import com.duoduo.busi.domain.BusiTagDO;
import com.duoduo.busi.service.BusiTagService;
import com.duoduo.common.utils.Result;

/**
 * 
 * <pre>
 * 标签表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Controller
@RequestMapping("/busi/busiTag")
public class BusiTagController extends AdminBaseController {
	@Autowired
	private BusiTagService busiTagService;
	
	@GetMapping()
	@RequiresPermissions("busi:busiTag:busiTag")
	String BusiTag(){
	    return "busi/busiTag/busiTag";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("busi:busiTag:busiTag")
	public Result<Page<BusiTagDO>> list(BusiTagDO busiTagDTO){
        Wrapper<BusiTagDO> wrapper = new EntityWrapper<BusiTagDO>().orderBy("id", false);
        Page<BusiTagDO> page = busiTagService.selectPage(getPage(BusiTagDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("busi:busiTag:add")
	String add(){
	    return "busi/busiTag/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("busi:busiTag:edit")
	String edit(@PathVariable("id") String id,Model model){
		BusiTagDO busiTag = busiTagService.selectById(id);
		model.addAttribute("busiTag", busiTag);
	    return "busi/busiTag/edit";
	}
	
	@Log("添加标签表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("busi:busiTag:add")
	public Result<String> save( BusiTagDO busiTag){
		busiTagService.insert(busiTag);
        return Result.ok();
	}
	
	@Log("修改标签表")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("busi:busiTag:edit")
	public Result<String>  update( BusiTagDO busiTag){
		boolean update = busiTagService.updateById(busiTag);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除标签表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("busi:busiTag:remove")
	public Result<String>  remove( String id){
		busiTagService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除标签表")
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("busi:busiTag:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") String[] ids){
		busiTagService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
