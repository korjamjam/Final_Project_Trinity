package com.project.trinity.community.summernote.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/createPost")
    public String moveToCreatePostPage() {
        return "community/summernote"; // summernote.jsp 페이지로 이동
    }
}
