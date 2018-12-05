package com.duoduo.spider.novel;


import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;

public interface NovelSpiderExecutor {

    /**
     * 获得首页书籍的名称和url地址
     * @param page
     */
    public void getBookNameAndUrl(Page page);

    /**
     * 获得书籍的页面链接
     * @param page
     */
    public void getBookDesc(Page page);


    /**
     * 获得书籍目录和章节URL地址
     * @param page
     */
    public void getBookCatalog(Page page);

    /**
     * 获得最终页面进行下载
     * @param page
     */
    public void DownBook(Page page) throws Exception;


    public Site getSite();
}
