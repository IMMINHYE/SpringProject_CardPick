package com.card.mapper;

import com.card.dto.*;

import java.util.HashMap;
import java.util.List;

public interface CardMapper {
    // 모든 카드 목록 조회
    public List<CardDTO> cardAllList(HashMap<String, Object> hm);
    // 특정 회사의 카드 목록 조회
    public List<CardDTO> cardList(HashMap<String, Object> hm);
    // 카드 상세 정보 조회
    public CardDTO cardView(int cardId);
    // 리뷰 등록
    public void reviewRegister(ReviewDTO review);
    // 리뷰 목록 조회
    public List<ReviewDTO> reviewList(HashMap<String, Object> hm);
    // 즐겨찾기 추가
    public void addFav(FavDTO fav);
    // 즐겨찾기 목록 조회
    public List<FavListDTO> favList(String userId);
    // 즐겨찾기 삭제
    public void favDelete(int favId);
    // 리뷰 삭제
    public void deleteReview(int reviewId);
    // 리뷰 중복 체크
    public int reviewCheck(ReviewDTO review);
    // 즐겨찾기 중복 체크
    public int favCheck(FavDTO fav);
    // 카드의 평균 별점과 별점 개수 배열 반환
    public int[] getReviewStar(int cardId);
    // 카드의 리뷰 개수 반환
    public int getReviewCount(int cardId);
    // 카드사 수 반환
    public int getCompanyCount(String companyCode);
    // 전체 카드 개수 반환
    public int getCardAllCount(HashMap<String, Object> hm);
    // 최신 카드 목록 조회
    public List<CardDTO> getLatestCard();
    // 카드에 해당하는 회사 정보 조회
    public CardCompanyDTO cardCompany(int cardId);

}
