package com.card.repository;

import com.card.dto.*;
import com.card.mapper.CardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class CardRepository {
    @Autowired
    private CardMapper cardMapper;

    public List<CardDTO> cardAllList(HashMap<String, Object> hm) {
        return cardMapper.cardAllList(hm);
    };

    public List<CardDTO> cardList(HashMap<String, Object> hm) {
        return cardMapper.cardList(hm);
    };

    public CardDTO cardView(int cardId) {
        return cardMapper.cardView(cardId);
    }

    public void reviewRegister(ReviewDTO review) {
        cardMapper.reviewRegister(review);
    }
    public List<ReviewDTO> reviewList(HashMap<String, Object> hm){
        return cardMapper.reviewList(hm);
    }
    public void addFav(FavDTO fav) {
        cardMapper.addFav(fav);
    }
    public List<FavListDTO> favList(String userId) {
        return cardMapper.favList(userId);
    }

    public void favDelete(int favId) {
        cardMapper.favDelete(favId);
    }
    public void deleteReview(int reviewId) {
        cardMapper.deleteReview(reviewId);
    }
    public int reviewCheck(ReviewDTO review) {
        return cardMapper.reviewCheck(review);
    }
    public int favCheck(FavDTO fav) {
        return cardMapper.favCheck(fav);
    }
    public int[] getReviewStar(int cardId) {
        return cardMapper.getReviewStar(cardId);
    }
    public int getReviewCount(int cardId) {
        return cardMapper.getReviewCount(cardId);
    }

    public int getCompanyCount(String companyCode) {
        return cardMapper.getCompanyCount(companyCode);
    }

    public int getCardAllCount(HashMap<String, Object> hm) {
        return cardMapper.getCardAllCount(hm);
    }
    public List<CardDTO> getLatestCard() {
        return cardMapper.getLatestCard();
    }
    public CardCompanyDTO cardCompany(int cardId) {
        return cardMapper.cardCompany(cardId);
    }
}
