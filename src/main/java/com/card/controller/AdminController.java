package com.card.controller;

import com.card.dto.*;
import com.card.service.AdminService;
import com.card.service.CardService;
import com.card.service.MemberService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
public class AdminController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CardService cardService;

	// 카드 등록 페이지
	@GetMapping("cardRegister")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String cardRegister(Model model) {
		// 카드 회사 정보를 가져와서 모델에 추가
		List<CompanyDTO> category = adminService.company();
		model.addAttribute("category", JSONArray.fromObject(category));
		return "cardRegister";
	}

	// 카드 등록 처리
	@PostMapping("cardRegister")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String cardRegister(CardDTO card, HttpServletRequest request) throws IOException {
		adminService.cardRegister(card);
		return "redirect:cardAllList";
	}

	// 사용자 목록 페이지
	@GetMapping("userList")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String userList(Model model, String field, String word, String strPageNum) {
		// 페이지 번호 및 검색어 처리
		strPageNum = (strPageNum == null) ? "1" : strPageNum ;
		int pageNum = Integer.parseInt(strPageNum);
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("field",field);
		hm.put("word",word);

		// 사용자 수 계산 및 페이지 처리
		int totalCount = memberService.getCount(hm);
		int pageSize= 5;
		int pageBlock= 10;
		int pageCount = (int) Math.ceil((double) totalCount / pageSize);
		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		PageDTO pageDto = new PageDTO();
		pageDto.setPageCount(pageCount);
		pageDto.setPageBlock(pageBlock);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		pageDto.setTotalCount(totalCount);
		pageDto.setPageNum(pageNum);
		
		int startRow =(pageNum-1)*pageSize;
		hm.put("startRow",startRow);
		hm.put("pageSize", pageSize);
		List<MemberDTO> list = memberService.findAll(hm);
		
		model.addAttribute("userList",list);
		model.addAttribute("count",totalCount);
		model.addAttribute("pageDto",pageDto);
		model.addAttribute("field",field);
		model.addAttribute("word",word);

		return "member/userList";
	}

	// 카드 수정 폼 페이지
	@GetMapping("cardUpdateForm")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String cardUpdateForm(int cardId, Model model) {
		// 카드 정보 및 카드 회사 정보를 가져와서 모델에 추가
		CardCompanyDTO card = cardService.cardCompany(cardId);
		model.addAttribute("card",card);
		List<CompanyDTO> company = adminService.company();
		model.addAttribute("company", JSONArray.fromObject(company));
		return "admin/product/updateForm";
	}

	// 카드 수정 처리
	@PostMapping("cardUpdate")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String cardUpdate(CardDTO card, HttpServletRequest request) {
		adminService.cardUpdate(card);
		return "redirect:cardAllList";
	}

	// 카드 삭제 처리
	@GetMapping("cardDelete")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String cardDelete(int cardId, HttpServletRequest request) {
		CardDTO card = cardService.cardView(cardId);
		adminService.cardDelete(cardId);
		return "redirect:cardAllList";
	}

}