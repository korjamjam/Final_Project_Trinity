package com.project.trinity.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {

    @RequestMapping("community_main.me")
    public String showCommunityPage() {
        // "community_main" JSP로 포워딩
        return "community/community_main";
    }
}