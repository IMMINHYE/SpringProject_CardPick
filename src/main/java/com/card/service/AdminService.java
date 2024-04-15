package com.card.service;

import com.card.dto.CardDTO;
import com.card.dto.CompanyDTO;
import com.card.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminService {
	@Autowired
	private AdminRepository adminRepository;
	
	//ī�װ�
	public List<CompanyDTO> company(){
		return adminRepository.company();
	}
	
	//��ǰ���
	public void cardRegister(CardDTO card) {
		adminRepository.cardRegister(card);
	}
	
	//��ǰ ����
	public void cardUpdate(CardDTO card) {
		adminRepository. cardUpdate(card);
	}
	

	public void cardDelete(int cardId) {
		adminRepository.cardDelete(cardId);
	}
}
