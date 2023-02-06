package com.my.commute.service;

import com.my.commute.model.Member;

public interface MemberService {
    int joinMember(Member member);
    int idCheck(String id);
    String login(String id);
    String findId(String phone);
    int findPwd(String id, String phone);
    void updatePwd(Member member);
    Member myPage(String id);
}
