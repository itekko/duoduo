package com.duoduo.common.config;

import java.net.UnknownHostException;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
@ConditionalOnProperty(prefix="spring.redis", name="host", havingValue="false", matchIfMissing=true)
public class RedisConfig {
	@Bean("jsonRedisTemplate")
	public RedisTemplate<Object, Object> redisTemplate(
			RedisConnectionFactory redisConnectionFactory)
					throws UnknownHostException {
		RedisTemplate<Object, Object> template = new RedisTemplate<Object, Object>();
		template.setConnectionFactory(redisConnectionFactory);
		template.setDefaultSerializer(new GenericJackson2JsonRedisSerializer());
		
		return template;
	}
	
	@Bean("strKeyRedisTemplate")
	public RedisTemplate<Object, Object> strKeyRedisTemplate(
			RedisConnectionFactory redisConnectionFactory)
					throws UnknownHostException {
		RedisTemplate<Object, Object> template = new RedisTemplate<Object, Object>();
		template.setConnectionFactory(redisConnectionFactory);
		RedisSerializer<String> stringSerializer = new StringRedisSerializer();
		template.setKeySerializer(stringSerializer);
		
		return template;
	}
}
