package com.duoduo.oss.service.impl;

import com.duoduo.common.base.CoreServiceImpl;
import com.duoduo.common.config.IFastProperties;
import com.duoduo.common.utils.FileType;
import com.duoduo.oss.dao.FileDao;
import com.duoduo.oss.domain.FileDO;
import com.duoduo.oss.service.FileService;
import com.duoduo.common.component.oss.support.UploadServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <pre>
 * </pre>
 * 
 * <small> 2018年3月23日 | Aron</small>
 */
@Service
public class FileServiceImpl extends CoreServiceImpl<FileDao, FileDO> implements FileService {

    @Autowired
    private IFastProperties ifastConfig;
    @Autowired
    private UploadServer uploader;

    @Override
    public String upload(byte[] uploadBytes, String fileName) {
        //处理浏览器文件名获取兼容问题
        if(fileName == null) {
            fileName =  "";
        } else {
            int unixSep = fileName.lastIndexOf("/");
            int winSep = fileName.lastIndexOf("\\");
            int pos = winSep > unixSep?winSep:unixSep;
            fileName= pos != -1?fileName.substring(pos + 1):fileName;
        }
//        fileName = fileName.substring(0, fileName.indexOf(".")) + "-" + System.currentTimeMillis() + fileName.substring(fileName.indexOf("."));
//        fileName = ifastConfig.getProjectName() + "/" + DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN_8)
//                + "/" + fileName;
        String url = uploader.upload(uploadBytes, fileName);
        FileDO sysFile = new FileDO(FileType.fileType(fileName), url, new Date());
        super.insert(sysFile);
        return url;
    }
}
