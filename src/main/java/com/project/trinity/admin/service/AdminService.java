package com.project.trinity.admin.service;

import com.project.trinity.member.model.vo.Member;
import java.util.List;

public interface AdminService {
    List<Member> getAllMembers(); // 모든 회원을 가져오는 메서드 선언
}
