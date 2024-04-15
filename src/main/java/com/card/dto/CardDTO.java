package com.card.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class CardDTO {
    private int cardId;     // 번호
    private String cardName;       // 카드 이름
    private String cardImg;     // 카드 사진
    private String card_company;    // 카드사
    private String anual_fee;      // 연회비
    private String achievement;     // 실적
    private String benefit1;     // 혜택1
    private String benefit2;     // 혜택2
    private String benefit3;     // 혜택3
    private String cardUrl;      // 카드 신청 링크
    private String companyCode;     // 카드사 코드
}
