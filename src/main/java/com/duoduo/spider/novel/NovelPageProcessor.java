package com.duoduo.spider.novel;

import org.springframework.stereotype.Component;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

@Component
public class NovelPageProcessor implements PageProcessor {

    private NovelSpiderExecutor novelSpiderExecutor;

    public void setNovelSpiderExecutor(NovelSpiderExecutor novelSpiderExecutor) {
        this.novelSpiderExecutor = novelSpiderExecutor;
    }

    @Override
    public void process(Page page) {
        novelSpiderExecutor.getBookNameAndUrl(page);
        novelSpiderExecutor.getBookDesc(page);
        novelSpiderExecutor.getBookCatalog(page);
        try {
            novelSpiderExecutor.DownBook(page);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Site getSite() {
        return novelSpiderExecutor.getSite();
    }
}
