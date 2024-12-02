package com.project.trinity.inquiry.service;

import java.util.List;

import com.project.trinity.community.board.model.vo.Board;

public interface InquiryService {
    List<Board> getNotices();
    List<Board> getReportes();
    List<Board> getFaqs();
    List<Board> getQnas();
}