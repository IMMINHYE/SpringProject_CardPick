package com.card.service;

import com.card.dto.AuthDTO;
import com.card.dto.MemberDTO;
import com.card.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Transactional
    public void join(MemberDTO member, AuthDTO auth) {
        member.setUserpass(passwordEncoder.encode(member.getUserpass()));
        memberRepository.userJoin(member);
        memberRepository.userAuth(auth);
    }

    public MemberDTO findById(String userId) {
        return memberRepository.findById(userId);
    }

    @Transactional
    public void update(MemberDTO member) {
        member.setUserpass(passwordEncoder.encode(member.getUserpass()));
        memberRepository.update(member);
    }

    @Transactional
    public void delete(String userId) {
        memberRepository.memberDelete(userId);
        memberRepository.authDelete(userId);
    }

    public int idDuplChk(String userId) {
        return memberRepository.idDuplChk(userId);
    }

    public int getCount(HashMap<String, Object> hm) {
        return memberRepository.getCount(hm);
    }

    public List<MemberDTO> findAll(HashMap<String, Object> hm) {
        return memberRepository.findAll(hm);
    }

    public String getUserName(String userId) {
        return memberRepository.getUserName(userId);
    }

    public String getProfile(String userId) {
        return memberRepository.getProfile(userId);
    }

    public String[] getUserId() {
        return memberRepository.getUserId();
    }

}
