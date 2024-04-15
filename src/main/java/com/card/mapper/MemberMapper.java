package com.card.mapper;

import com.card.dto.AuthDTO;
import com.card.dto.MemberDTO;

import java.util.HashMap;
import java.util.List;

public interface MemberMapper {
    // 사용자 정보 조회
    public MemberDTO read(String userId);
    // 회원가입 정보 등록
    public void memberJoin(MemberDTO member);
    // 회원 권한 등록
    public void authJoin(AuthDTO auth);
    // 사용자 아이디로 회원 정보 조회
    public MemberDTO findById(String userId);
    // 회원 정보 수정
    public void update(MemberDTO member);
    // 회원 탈퇴
    public void memberDelete(String userId);
    // 회원 권한 삭제
    public void authDelete(String userId);
    // 아이디 중복 체크
    public int idDuplChk(String userId);
    // 회원 수 조회
    public int count(HashMap<String, Object> hm);
    // 모든 회원 목록 조회
    public List<MemberDTO> findAll(HashMap<String, Object> hm);
    // 사용자 이름 조회
    public String getUserName(String userId);
    // 사용자 프로필 조회
    public String getProfile(String userId);
    // 사용자 아이디 조회
    public String[] getUserId();
}
