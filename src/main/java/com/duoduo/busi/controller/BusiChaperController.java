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
import com.duoduo.busi.domain.BusiChaperDO;
import com.duoduo.busi.service.BusiChaperService;
import com.duoduo.common.utils.Result;

/**
 * 
 * <pre>
 * 章节表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Controller
@RequestMapping("/busi/busiChaper")
public class BusiChaperController extends AdminBaseController {
	@Autowired
	private BusiChaperService busiChaperService;
	
	@GetMapping()
	@RequiresPermissions("busi:busiChaper:busiChaper")
	String BusiChaper(){
	    return "busi/busiChaper/busiChaper";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("busi:busiChaper:busiChaper")
	public Result<Page<BusiChaperDO>> list(BusiChaperDO busiChaperDTO){
        Wrapper<BusiChaperDO> wrapper = new EntityWrapper<BusiChaperDO>().orderBy("id", false);
        Page<BusiChaperDO> page = busiChaperService.selectPage(getPage(BusiChaperDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("busi:busiChaper:add")
	String add(){
	    return "busi/busiChaper/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("busi:busiChaper:edit")
	String edit(@PathVariable("id") String id,Model model){
		BusiChaperDO busiChaper = busiChaperService.selectById(id);
		model.addAttribute("busiChaper", busiChaper);
	    return "busi/busiChaper/edit";
	}
	
	@Log("添加章节表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("busi:busiChaper:add")
	public Result<String> save( BusiChaperDO busiChaper){
		busiChaperService.insert(busiChaper);
        return Result.ok();
	}
	
	@Log("修改章节表")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("busi:busiChaper:edit")
	public Result<String>  update( BusiChaperDO busiChaper){
		boolean update = busiChaperService.updateById(busiChaper);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除章节表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("busi:busiChaper:remove")
	public Result<String>  remove( String id){
		busiChaperService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除章节表")
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("busi:busiChaper:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") String[] ids){
		busiChaperService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
