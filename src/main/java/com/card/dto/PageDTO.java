package com.card.dto;

import lombok.Data;

@Data
public class PageDTO {
    private int totalCount;
    private int pageCount;
    private int pageBlock;
    private int startPage;
    private int endPage;
    private int pageNum;
}
