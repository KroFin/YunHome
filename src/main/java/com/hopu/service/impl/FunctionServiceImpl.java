package com.hopu.service.impl;

import com.hopu.service.FunctionService;
import com.hopu.utils.MD5Util;
import com.hopu.utils.RedisClient;
import com.hopu.utils.SmsUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.concurrent.TimeUnit;

@Service
public class FunctionServiceImpl implements FunctionService {
    @Override
    public String createAVerifyNumber(String value) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i <6 ; i++) {
            stringBuffer.append(new Random().nextInt(9) + 1);
        }
        String code=stringBuffer.toString();

        String newCode = MD5Util.encodeByMd5(code);

        RedisTemplate redisTemplate = RedisClient.getRedisTemplate();

        redisTemplate.opsForValue().set( value + "verifyCode",newCode,10, TimeUnit.MINUTES);

        return newCode;
    }
}
