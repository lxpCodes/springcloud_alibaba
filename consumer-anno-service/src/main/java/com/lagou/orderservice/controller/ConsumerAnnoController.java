package com.lagou.orderservice.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;

@RestController
public class ConsumerAnnoController {

    private Logger logger = LoggerFactory.getLogger(ConsumerAnnoController.class);

    @Resource
    private RestTemplate restTemplate;

    @GetMapping("/consumer/msg")
    public String getProviderMessage(){
        // 关键点：将原有IP:端口替换为服务名，RestTemplate便会在通信前自动利用Ribbon查询可用provider-service实例列表
        // 再根据负载均衡策略选择节点实例
        String result = restTemplate.getForObject("http://provider-service/provider/msg", String.class);
        logger.info("consumer-service获得数据:" + result);
        return   "consumer-service获得数据:" + result;
    }


}
