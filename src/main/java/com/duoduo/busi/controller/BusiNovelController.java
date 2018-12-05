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
import com.duoduo.busi.domain.BusiNovelDO;
import com.duoduo.busi.service.BusiNovelService;
import com.duoduo.common.utils.Result;

/**
 * 
 * <pre>
 * 小说表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Controller
@RequestMapping("/busi/busiNovel")
public class BusiNovelController extends AdminBaseController {
	@Autowired
	private BusiNovelService busiNovelService;
	
	@GetMapping()
	@RequiresPermissions("busi:busiNovel:busiNovel")
	String BusiNovel(){
	    return "busi/busiNovel/busiNovel";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("busi:busiNovel:busiNovel")
	public Result<Page<BusiNovelDO>> list(BusiNovelDO busiNovelDTO){
        Wrapper<BusiNovelDO> wrapper = new EntityWrapper<BusiNovelDO>().orderBy("id", false);
        Page<BusiNovelDO> page = busiNovelService.selectPage(getPage(BusiNovelDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("busi:busiNovel:add")
	String add(){
	    return "busi/busiNovel/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("busi:busiNovel:edit")
	String edit(@PathVariable("id") String id,Model model){
		BusiNovelDO busiNovel = busiNovelService.selectById(id);
		model.addAttribute("busiNovel", busiNovel);
	    return "busi/busiNovel/edit";
	}
	
	@Log("添加小说表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("busi:busiNovel:add")
	public Result<String> save( BusiNovelDO busiNovel){
		busiNovelService.insert(busiNovel);
        return Result.ok();
	}
	
	@Log("修改小说表")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("busi:busiNovel:edit")
	public Result<String>  update( BusiNovelDO busiNovel){
		boolean update = busiNovelService.updateById(busiNovel);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除小说表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("busi:busiNovel:remove")
	public Result<String>  remove( String id){
		busiNovelService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除小说表")
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("busi:busiNovel:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") String[] ids){
		busiNovelService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
