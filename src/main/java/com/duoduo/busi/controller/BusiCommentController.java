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
import com.duoduo.busi.domain.BusiCommentDO;
import com.duoduo.busi.service.BusiCommentService;
import com.duoduo.common.utils.Result;

/**
 * 
 * <pre>
 * 小说评论表
 * </pre>
 * <small> 2018-11-30 17:40:11 | ekko</small>
 */
@Controller
@RequestMapping("/busi/busiComment")
public class BusiCommentController extends AdminBaseController {
	@Autowired
	private BusiCommentService busiCommentService;
	
	@GetMapping()
	@RequiresPermissions("busi:busiComment:busiComment")
	String BusiComment(){
	    return "busi/busiComment/busiComment";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("busi:busiComment:busiComment")
	public Result<Page<BusiCommentDO>> list(BusiCommentDO busiCommentDTO){
        Wrapper<BusiCommentDO> wrapper = new EntityWrapper<BusiCommentDO>().orderBy("id", false);
        Page<BusiCommentDO> page = busiCommentService.selectPage(getPage(BusiCommentDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("busi:busiComment:add")
	String add(){
	    return "busi/busiComment/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("busi:busiComment:edit")
	String edit(@PathVariable("id") String id,Model model){
		BusiCommentDO busiComment = busiCommentService.selectById(id);
		model.addAttribute("busiComment", busiComment);
	    return "busi/busiComment/edit";
	}
	
	@Log("添加小说评论表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("busi:busiComment:add")
	public Result<String> save( BusiCommentDO busiComment){
		busiCommentService.insert(busiComment);
        return Result.ok();
	}
	
	@Log("修改小说评论表")
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("busi:busiComment:edit")
	public Result<String>  update( BusiCommentDO busiComment){
		boolean update = busiCommentService.updateById(busiComment);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除小说评论表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("busi:busiComment:remove")
	public Result<String>  remove( String id){
		busiCommentService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除小说评论表")
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("busi:busiComment:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") String[] ids){
		busiCommentService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
