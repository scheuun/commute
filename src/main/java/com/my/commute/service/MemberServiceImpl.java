package com.my.commute.service;

import com.my.commute.dao.map.MemberMap;
import com.my.commute.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberMap memberMap;

    @Override
    public int joinMember(Member member) {
        return memberMap.joinMember(member);
    }

    @Override
    public int idCheck(String id) {
        return memberMap.idCheck(id);
    }

    @Override
    public String login(String id) {
        return memberMap.login(id);
    }

    @Override
    public String findId(String phone) {
        return memberMap.findId(phone);
    }

    @Override
    public int findPwd(String id, String phone) {
        return memberMap.findPwd(id, phone);
    }

    @Override
    public void updatePwd(Member member) {
        memberMap.updatePwd(member);
    }

    @Override
    public Member myPage(String id) {
        return memberMap.myPage(id);
    }
}
