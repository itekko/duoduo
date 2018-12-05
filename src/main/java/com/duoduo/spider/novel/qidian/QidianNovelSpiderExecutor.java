/*
package com.duoduo.spider.novel.qidian;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.duoduo.busi.entity.Chaper;
import com.duoduo.busi.service.ChaperService;
import com.duoduo.busi.service.NovelService;
import com.duoduo.spider.novel.NovelSpiderExecutor;
import com.duoduo.spider.novel.entity.Novel;
import com.duoduo.spider.novel.entity.NovelUrl;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Request;
import us.codecraft.webmagic.Site;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

@Slf4j
@Component
public class QidianNovelSpiderExecutor implements NovelSpiderExecutor {

    private String url;

    private String prefix = "https:";

    */
/**
     * key--bookName,value = list
     *//*

    private Map<String,List<Novel>> map = new ConcurrentHashMap<>();

    private Map<String,AtomicInteger> indexMap = new ConcurrentHashMap<>();

    private List<NovelUrl> novelUrls = new CopyOnWriteArrayList<>();

    private final AtomicInteger novelIndex = new AtomicInteger(0);

    @Autowired
    private NovelService novelService;

    @Autowired
    private ChaperService chaperService;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public void getBookNameAndUrl(Page page) {
        if(page.getUrl().toString().equals(url)){
            List<String> catalogs = page.getHtml().xpath("//*[@class=\"book-list\"]/ul/li/strong/a").all();
            for (String catalog :catalogs ) {
                Document doc = Jsoup.parse(catalog);
                Element e_title = doc.getElementsByTag("a").get(0);
                String bookName = e_title.text();
                String bookHref = prefix + e_title.attr("href");
                if(bookHref.contains("book.qidian.com")){
                    map.put(bookName,new CopyOnWriteArrayList<>());
                    indexMap.put(bookName,new AtomicInteger(0));
                    NovelUrl novelUrl = new NovelUrl();
                    novelUrl.setBookName(bookName);
                    novelUrl.setBookHref(bookHref);
                    novelUrls.add(novelUrl);
                }
            }

            if(!CollectionUtils.isEmpty(novelUrls)){
                NovelUrl firstNovelUrl = novelUrls.get(0);
                Request request = new Request(firstNovelUrl.getBookHref()).putExtra("bookName", firstNovelUrl.getBookName());
                page.addTargetRequest(request);
                novelIndex.incrementAndGet();
            }

        }
    }

    private boolean isExistBook(String bookName) {
        int count = novelService.count(new QueryWrapper<com.duoduo.busi.entity.Novel>().eq("novelname",bookName));
        return  count > 0 ? true:false;
    }

    @Override
    public void getBookDesc(Page page) {
        if (page.getUrl().regex("https://book\\.qidian\\.com/info/").toString() != null) {
            String imgurl = prefix + page.getHtml().xpath("//div[@class=\"book-information cf\"]/div[@class=\"book-img\"]/a/img/@src").toString();

            String bookname = page.getHtml().xpath("//div[@class=\"book-information cf\"]/div[@class=\"book-info\"]/h1/em").get();
            Document doc = Jsoup.parse(bookname);
            String name = doc.getElementsByTag("em").get(0).text();

            String author = page.getHtml().xpath("//div[@class=\"book-information cf\"]/div[@class=\"book-info\"]/h1/span/a").get();
            Document authorDoc = Jsoup.parse(author);
            String authorName = authorDoc.getElementsByTag("a").get(0).text();


            List<String> tags = page.getHtml().xpath("//div[@class=\"book-information cf\"]/div[@class=\"book-info\"]/p/span").all();
            for(String tag : tags){
                Document doc_tag = Jsoup.parse(tag);
                String tagName = doc_tag.getElementsByTag("span").get(0).text();
            }

            List<String> types = page.getHtml().xpath("//div[@class=\"book-information cf\"]/div[@class=\"book-info\"]/p/a").all();
            for(String type : types){
                Document doc_tag = Jsoup.parse(type);
                String typeName = doc_tag.getElementsByTag("a").get(0).text();
            }

            String desc = page.getHtml().xpath("//div[@class=\"book-information cf\"]/div[@class=\"book-info\"]/p[@class=\"intro\"]").toString();
            Document doc_desc = Jsoup.parse(desc);
            String descInfo = doc_desc.getElementsByTag("p").get(0).text();

            synchronized (this){
                if(!isExistBook(name)){
                    com.duoduo.busi.entity.Novel novel = new com.duoduo.busi.entity.Novel();
                    novel.setActiveFlag(0);
                    novel.setNovelname(name);
                    novel.setAuthor(authorName);
                    novel.setRemarks(descInfo);
                    novel.setCreateTime(LocalDateTime.now());
                    novel.setUpdateTime(LocalDateTime.now());
                    novelService.save(novel);
                }
            }

        }


    }

    @Override
    public void getBookCatalog(Page page) {

        if (page.getUrl().regex("https://book\\.qidian\\.com/info/").toString() != null) {
            String  bookName = page.getRequest().getExtra("bookName").toString();
            List<String> chapers = page.getHtml().xpath("//div[@class=\"wrap\"]/div[@class=\"book-detail-wrap center990\"]/div[@class=\"catalog-content-wrap\"]/div[@class=\"volume-wrap\"]/div[@class=\"volume\"]/ul/li/a").all();
            com.duoduo.busi.entity.Novel book = novelService.getOne(new QueryWrapper<com.duoduo.busi.entity.Novel>().eq("novelname",bookName));
            if(book != null){
                int count = chaperService.count(new QueryWrapper<Chaper>().eq("novel_id",book.getId()));
                indexMap.get(bookName).addAndGet(count);
                if(count != chapers.size()){
                    for (int i = count; i < chapers.size(); i++) {
                        Document doc = Jsoup.parse(chapers.get(i));
                        Element e_chaper = doc.getElementsByTag("a").get(0);
                        String chaperName = e_chaper.text();

                        Novel novel = new Novel();
                        novel.setChaperName(chaperName);
                        map.get(bookName).add(novel);
                        String chaperHref = prefix + e_chaper.attr("href");
                        Request request = new Request(chaperHref).putExtra("bookName", bookName);
                        page.addTargetRequest(request);
                    }
                }else{
                    map.remove(bookName);
                    indexMap.remove(bookName);

                    NovelUrl nextNovelUrl = novelUrls.get(novelIndex.get());
                    Request request = new Request(nextNovelUrl.getBookHref()).putExtra("bookName", nextNovelUrl.getBookName());
                    page.addTargetRequest(request);
                    novelIndex.incrementAndGet();
                }

            }
        }



    }

    private boolean isExistChaper(String id, String chaperName) {
        int count = chaperService.count(new QueryWrapper<Chaper>().eq("novel_id",id).eq("chapername",chaperName));
        return  count > 0 ? true:false;
    }

    @Override
    public void DownBook(Page page)throws Exception {
        if (page.getUrl().regex("https://read\\.qidian\\.com/chapter/").toString() != null
                //&& page.getRequest().getExtra("bookName").toString().trim().equals("同桌凶猛")
                ) {
            String chaperNameDoc = page.getHtml().xpath("//div[@class=\"wrap\"]/div[@class=\"read-main-wrap font-family01\"]/div/div[@class=\"text-wrap\"]/div[@class=\"main-text-wrap\"]/div[@class=\"text-head\"]/h3").toString();
            Document doc = Jsoup.parse(chaperNameDoc);
            Element e_chaper = doc.getElementsByTag("h3").get(0);
            String chaperName = e_chaper.text();


            String  bookName = page.getRequest().getExtra("bookName").toString();
            String chaperContent = page.getHtml().xpath("//div[@class=\"wrap\"]/div[@class=\"read-main-wrap font-family01\"]/div/div[@class=\"text-wrap\"]/div[@class=\"main-text-wrap\"]/div[@class=\"read-content j_readContent\"]").toString();
            Document content_doc = Jsoup.parse(chaperContent);
            Element content_chaper = content_doc.getElementsByTag("div").get(0);
            String content = content_chaper.text();

            String allContent = chaperName+"\r\n"+content+"\r\n";


            List<Novel> list =  map.get(bookName);
            list.stream().forEach((item) -> {
                if(chaperName.equals(item.getChaperName()) && StringUtils.isEmpty(item.getContent())){
                    item.setContent(allContent);
                    indexMap.get(bookName).incrementAndGet();
                }
            });

                if(indexMap.get(bookName).get() == list.size() && list.size() != 0){
                    FileWriter writer = null;
                    try {
                        File file = new File("/Users/ekko/Desktop/" +bookName + ".txt");
                        // 创建文件
                        if(!file.exists()){
                            file.createNewFile();
                        }
                        writer = new FileWriter(file,true);
                        List<Chaper> chaperList = new ArrayList<>(list.size());
                        Chaper chaper = null;
                        com.duoduo.busi.entity.Novel book = novelService.getOne(new QueryWrapper<com.duoduo.busi.entity.Novel>().eq("novelname",bookName));
                        if(book != null){
                            for (Novel novel: list) {
                                writer.append(novel.getContent());

                                chaper = new Chaper();
                                chaper.setNovelId(book.getId());
                                chaper.setChapername(novel.getChaperName());
                                chaper.setContent(novel.getContent());
                                chaper.setActiveFlag(0);
                                chaper.setCreateTime(LocalDateTime.now());
                                chaper.setUpdateTime(LocalDateTime.now());
                                chaperList.add(chaper);
                            }
                            chaperService.saveBatch(chaperList);
                        }



                    } catch (IOException e) {
                        e.printStackTrace();
                    }finally {
                        writer.close();
                    }

                    map.remove(bookName);
                    indexMap.remove(bookName);

                    synchronized (this){
                        if(!CollectionUtils.isEmpty(novelUrls) && novelUrls.size() != novelIndex.get()){
                            NovelUrl nextNovelUrl = novelUrls.get(novelIndex.get());
                            Request request = new Request(nextNovelUrl.getBookHref()).putExtra("bookName", nextNovelUrl.getBookName());
                            page.addTargetRequest(request);
                            novelIndex.incrementAndGet();
                        }
                    }
                    if(!CollectionUtils.isEmpty(novelUrls) && novelUrls.size() == novelIndex.get()){
                        log.info("*************{}已经下载完成*******************",bookName);
                    }
                }
            }

    }

    @Override
    public Site getSite() {
        return Site.me().setRetryTimes(5).setSleepTime(5000);
    }

}
*/
