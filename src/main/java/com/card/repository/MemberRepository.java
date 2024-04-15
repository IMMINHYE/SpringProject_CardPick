package com.card.repository;

import com.card.dto.AuthDTO;
import com.card.dto.MemberDTO;
import com.card.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private MemberMapper memberMapper;

    public void userJoin(MemberDTO member) {
        memberMapper.memberJoin(member);
    }

    public void userAuth(AuthDTO auth) {
        memberMapper.authJoin(auth);
    }

    public MemberDTO findById(String userId) {
        return memberMapper.findById(userId);
    }

    public void update(MemberDTO member) {
        memberMapper.update(member);
    }


    public void memberDelete(String userId) {
        memberMapper.memberDelete(userId);
    }

    public void authDelete(String userId) {
        memberMapper.authDelete(userId);
    }

    //���̵��ߺ�üũ
    public int idDuplChk(String userId) {
        return memberMapper.idDuplChk(userId);
    }

    public int getCount(HashMap<String, Object> hm) {
        return memberMapper.count(hm);
    }

    public List<MemberDTO> findAll(HashMap<String, Object> hm) {
        return memberMapper.findAll(hm);
    }

    public String getUserName(String userId) {
        return memberMapper.getUserName(userId);
    }

    public String getProfile(String userId) {
        return memberMapper.getProfile(userId);
    }

    public String[] getUserId() {
        return memberMapper.getUserId();
    }

}
