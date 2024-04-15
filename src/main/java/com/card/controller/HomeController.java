package com.card.controller;

import com.card.dto.CardDTO;
import com.card.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private CardService cardService;

    // 홈 페이지
    @GetMapping("/home")
    public String home(Model model) {
        // 최신 카드 목록 조회
        List<CardDTO> latestList = cardService.getLatestCard();
        model.addAttribute("latestList",latestList);
        return "home";
    }

    // 로그인 페이지
    @GetMapping("/login")
    public String login() {
        return "member/login";
    }

    // 로그아웃 페이지
    @GetMapping("/logout")
    public String logout() {
        return "member/logout";
    }
}
