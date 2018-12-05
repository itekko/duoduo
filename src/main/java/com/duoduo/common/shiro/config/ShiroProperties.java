package com.duoduo.common.shiro.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * <pre>
 *
 * </pre>
 * <small> 2018/8/27 21:50 | Aron</small>
 */
@Component
@ConfigurationProperties(prefix = "duoduo.shiro")
@Data
public class ShiroProperties {
    private String sessionKeyPrefix = "duoduo:session";
    private String jsessionidKey = "SESSION";
}
