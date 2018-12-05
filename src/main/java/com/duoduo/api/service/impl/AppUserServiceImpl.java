package com.duoduo.api.service.impl;

import com.duoduo.api.config.JWTConfigProperties;
import com.duoduo.api.exception.IFastApiException;
import com.duoduo.api.pojo.vo.TokenVO;
import com.duoduo.api.service.AppUserService;
import com.duoduo.api.util.JWTUtil;
import com.duoduo.common.base.CoreServiceImpl;
import com.duoduo.common.config.CacheConfiguration;
import com.duoduo.common.exception.IFastException;
import com.duoduo.common.type.EnumErrorCode;
import com.duoduo.common.utils.MD5Utils;
import com.duoduo.common.utils.SpringContextHolder;
import com.duoduo.sys.dao.UserDao;
import com.duoduo.sys.domain.UserDO;
import org.apache.commons.lang.StringUtils;
import org.springframework.cache.Cache;
import org.springframework.stereotype.Service;

/**
 * <pre>
 * </pre>
 *
 * <small> 2018年4月27日 | Aron</small>
 */
@Service
public class AppUserServiceImpl extends CoreServiceImpl<UserDao, UserDO> implements AppUserService {
	/** Holder for lazy-init */
	private static class Holder {
		static final JWTConfigProperties jwtConfig = SpringContextHolder.getBean(JWTConfigProperties.class);
		static final Cache logoutTokens = CacheConfiguration.dynaConfigCache(jwtConfig.getExpireTokenKeyPrefix(), jwtConfig
                .getRefreshTokenExpire());
	}

	@Override
    public TokenVO getToken(String username, String passwd) {
		UserDO user = findOneByKv("username", username);
		if (null == user || !user.getPassword().equals(MD5Utils.encrypt(username, passwd))) {
            throw new IFastApiException(EnumErrorCode.apiAuthorizationLoginFailed.getCodeStr());
        }
        return createToken(user);
    }

    @Override
	public void verifyToken(String token, boolean isRefreshToken) {
        ensureAvailable(token, isRefreshToken);
	}

	@Override
	public TokenVO refreshToken(String uname, String refreshToken) {

        ensureAvailable(refreshToken, true);

        UserDO user = findOneByKv("username", uname);
        if(user == null){
            throw new IFastApiException(EnumErrorCode.apiAuthorizationInvalid.getCodeStr());
        }

		return createToken(user);
	}

	@Override
	public void logoutToken(String token, String refreshToken) {
        Holder.logoutTokens.putIfAbsent(token, null);
        Holder.logoutTokens.putIfAbsent(refreshToken, null);
	}

	private TokenVO createToken(UserDO user) {
        TokenVO vo = new TokenVO();
        String token        = JWTUtil.sign(user.getId() + "", user.getUsername() + user.getPassword(), Holder.jwtConfig.getExpireTime());
        String refreshToken = JWTUtil.sign(user.getId() + "", user.getUsername() + user.getPassword(), Holder.jwtConfig.getExpireTime(), true);
        vo.setToken(token);
        vo.setRefleshToken(refreshToken);
        vo.setTokenExpire(Holder.jwtConfig.getExpireTime());
        vo.setRefreshTokenExpire(Holder.jwtConfig.getRefreshTokenExpire());
        return vo;
	}

	private void ensureAvailable(String token, boolean isRefreshToken) {
        if(StringUtils.isBlank(token)){
            throw new IFastException(EnumErrorCode.apiAuthorizationInvalid.getCodeStr());
        }
        String userId = JWTUtil.getUserId(token);
        if(StringUtils.isBlank(userId)){
            throw new IFastException(EnumErrorCode.apiAuthorizationInvalid.getCodeStr());
        }
        if(Holder.logoutTokens.get(token) != null){
            throw new IFastApiException(EnumErrorCode.apiAuthorizationLoggedout.getCodeStr());
        }

        UserDO userDO = selectById(userId);

        if(userDO == null){
            throw new IFastException(EnumErrorCode.apiAuthorizationInvalid.getCodeStr());
        }

        if(isRefreshToken){
            JWTUtil.verify(token, userDO.getId() + "", userDO.getUsername() + userDO.getPassword(), true);
        }else{
            JWTUtil.verify(token, userDO.getId() + "", userDO.getUsername() + userDO.getPassword());
        }
	}
}
