package com.card.service;

import com.card.dto.*;
import com.card.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CardService {
    @Autowired
    private CardRepository cardRepository;

    public List<CardDTO> cardAllList(HashMap<String, Object> hm) {
        return cardRepository.cardAllList(hm);
    }

    public List<CardDTO> cardList(HashMap<String, Object> hm) {
        return cardRepository.cardList(hm);
    }
    public CardDTO cardView(int cardId) {
        return cardRepository.cardView(cardId);
    }
    public void reviewRegister(ReviewDTO review) {
        System.out.println("review" + review);
        cardRepository.reviewRegister(review);
        System.out.println("~~~~");
    }
    public List<ReviewDTO> reviewList(HashMap<String, Object> hm){
        return cardRepository.reviewList(hm);
    }

    public void addFav(FavDTO fav) {
        cardRepository.addFav(fav);
    }
    public List<FavListDTO> favList(String userId) {
        return cardRepository.favList(userId);
    }
    public void favDelete(int favId) {
        cardRepository.favDelete(favId);
    }
    public void deleteReview(int reviewId) {
        cardRepository.deleteReview(reviewId);
    }
    public int reviewCheck(ReviewDTO review) {
        return cardRepository.reviewCheck(review);
    }
    public int favCheck(FavDTO fav) {
        return cardRepository.favCheck(fav);
    }
    public int[] getReviewStar(int cardId) {
        return cardRepository.getReviewStar(cardId);
    }
    public int getReviewCount(int cardId) {
        return cardRepository.getReviewCount(cardId);
    }

    public int getCompanyCount(String companyCode) {
        return cardRepository.getCompanyCount(companyCode);
    }

    public int getCardAllCount(HashMap<String, Object> hm) {
        return cardRepository.getCardAllCount(hm);
    }
    public List<CardDTO> getLatestCard() {
        return cardRepository.getLatestCard();
    }
    public CardCompanyDTO cardCompany(int cardId) {
        return cardRepository.cardCompany(cardId);
    }

}
