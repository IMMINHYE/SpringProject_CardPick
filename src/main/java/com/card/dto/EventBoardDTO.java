package com.card.dto;

import lombok.Data;
import org.apache.ibatis.javassist.tools.rmi.StubGenerator;
@Data
public class EventBoardDTO {
    private int boardId;
    private String title;
    private String content;
    private String boardImg;
    private String regdate;
}
