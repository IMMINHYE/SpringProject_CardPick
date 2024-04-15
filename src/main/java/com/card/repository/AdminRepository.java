package com.card.repository;

import com.card.dto.CardDTO;
import com.card.dto.CompanyDTO;
import com.card.mapper.AdminMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminRepository {
	@Autowired
	private AdminMapper adminMapper;
	
	//ī�װ�
	public List<CompanyDTO> company(){
		return adminMapper.company();
	}
	
	//��ǰ���
	public void cardRegister(CardDTO card) {
		adminMapper.cardRegister(card);
	}
	
	//��ǰ ����
	public void cardUpdate(CardDTO card) {
		adminMapper. cardUpdate(card);
	}
	
	//��ǰ ����
	public void cardDelete(int cardId) {
		adminMapper.cardDelete(cardId);
	}

}
