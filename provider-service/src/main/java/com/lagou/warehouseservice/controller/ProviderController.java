package com.lagou.warehouseservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ProviderController {

    /**
     * 查询信息
     */
    @GetMapping("/provider/msg")
    public String sendMessage(){
        return "This is the message from provider service!";
    }
}
