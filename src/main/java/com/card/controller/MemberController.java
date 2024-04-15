package com.card.controller;

import com.card.dto.AuthDTO;
import com.card.dto.MemberDTO;
import com.card.service.CardService;
import com.card.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private CardService cardService;

    // 회원가입 페이지
    @GetMapping("join")
    public String join() {
        return "member/join";
    }

    // 회원가입 처리
    @PostMapping("join")
    public String join(MemberDTO member,AuthDTO auth) {
        auth.setAuth("ROLE_"+auth.getAuth());
        System.out.println("auth:"+auth.getAuth());
        memberService.join(member,auth);
        return "member/login";
    }

    // 회원정보 조회
    public void findById(String userId) {
        memberService.findById(userId);
    }

    // 회원탈퇴 처리
    @GetMapping("delete")
    public String delete(Principal principal, HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userId = principal.getName();
        memberService.delete(userId);
        if(auth!=null) {
            new SecurityContextLogoutHandler().logout(request,response,auth);
        }
        return "redirect:/";
    }

    // 아이디 중복 체크
    @RequestMapping(value = "idDuplChk" , method = RequestMethod.POST)
    @ResponseBody
    public String idDuplChk(@ModelAttribute MemberDTO member) throws Exception{
        int result = memberService.idDuplChk(member.getUserId());
        return String.valueOf(result);
    }

    // 비밀번호 형식 체크
    @RequestMapping(value = "pwCheck", method = RequestMethod.POST)
    @ResponseBody
    public boolean PwCheck(String pw) {

        boolean check = false;

        String pw_chk = "^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z[0-9]]{8,}$";

        Pattern pattern_symbol = Pattern.compile(pw_chk);
        Matcher matcher_symbol = pattern_symbol.matcher(pw);

        if(matcher_symbol.find()) {
            check = true;
        }
        return check;
    }

    // 마이페이지 조회
    @GetMapping("mypage")
    public String mypage(Principal principal, Model model) {
        String userId = principal.getName();
        MemberDTO member = memberService.findById(userId);
        model.addAttribute("member",member);

//        List<OrderDTO> orderList = pservice.orderList(userid);
//        model.addAttribute("orderList",orderList);
        //	System.out.println(orderList);
        return "member/mypage";
    }

    // 회원정보 조회 페이지
    @GetMapping("info")
    public String info(Principal principal,Model model) {
        String userId = principal.getName();
        MemberDTO member = memberService.findById(userId);
        model.addAttribute("member",member);

        return "member/info";
    }

    // 회원정보 수정 처리
    @PostMapping("infoUpdate")
    public String infoUpdate(MemberDTO member) {
        memberService.update(member);
        return "redirect:info";
    }
}
