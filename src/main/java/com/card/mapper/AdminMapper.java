package com.card.mapper;

import com.card.dto.CardDTO;
import com.card.dto.CompanyDTO;
import java.util.List;

public interface AdminMapper {
	// 카드사 목록 조회
	public List<CompanyDTO> company();
	// 카드 등록
	public void cardRegister(CardDTO card);
	// 카드 정보 수정
	public void cardUpdate(CardDTO card);
	// 카드 삭제
	public void cardDelete(int cardId);
}
