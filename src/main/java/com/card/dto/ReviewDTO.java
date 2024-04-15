package com.card.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ReviewDTO {
    private int reviewId;
    private int cardId;
    private String content;
    private String regdate;
    private int rating;
    private String profile;
    private String userId;
}
