package com.xikang.dev.https;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: https
 * @description: 青萝请求
 * @author: Wangshihai
 * @create: 2018-11-13 13:46
 **/
@Controller
public class WebController {

    @RequestMapping("/test")
    String home() {
        return "index";
    }

}
