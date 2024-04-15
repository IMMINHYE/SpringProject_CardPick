package com.card.controller;

import com.card.dto.*;
import com.card.service.CardService;
import com.card.service.MemberService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

@Log4j2
@Controller
public class CardController {
    @Autowired
    private CardService cardService;

    @Autowired
    private MemberService memberService;

    // 모든 카드 목록 조회 페이지
    @GetMapping("cardAllList")
    public String cardAllList(Model model, String field, String word, String strPageNum) {
        strPageNum = (strPageNum == null) ? "1" : strPageNum ;
        int pageNum = Integer.parseInt(strPageNum);
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("field",field);
        hm.put("word",word);

        // 전체 카드 수 계산 및 페이지 처리
        int totalCount = cardService.getCardAllCount(hm);
        int pageSize= 6;
        int pageBlock= 5;
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
        List<CardDTO> list = cardService.cardAllList(hm);

        model.addAttribute("list",list);
        model.addAttribute("count",totalCount);
        model.addAttribute("pageDto",pageDto);
        model.addAttribute("field",field);
        model.addAttribute("word",word);
        model.addAttribute("companyCode",null);

        return "cardList";
    }

    // 카드 목록 조회 페이지
    @GetMapping(value = "cardList")
    public String cardList(@RequestParam(value = "companyCode") String companyCode,
                           String strPageNum,
                           Model model){
        // 페이지 및 회사 코드 처리
        System.out.println("companyCode:"+companyCode);
        strPageNum = (strPageNum == null) ? "1" : strPageNum ;
        int pageNum = Integer.parseInt(strPageNum);
        HashMap<String, Object> hm = new HashMap<>();

        // 카드 수 계산 및 페이지 처리
        int totalCount = cardService.getCompanyCount(companyCode);
        int pageSize= 6;
        int pageBlock= 5;
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
        hm.put("companyCode", companyCode);
        List<CardDTO> list = cardService.cardList(hm);

        model.addAttribute("list",list);
        model.addAttribute("count",totalCount);
        model.addAttribute("pageDto",pageDto);
        model.addAttribute("companyCode",companyCode);

        return "cardList";
    }

    // 카드 상세 조회 페이지
    @GetMapping("cardView")
    public String cardView(int cardId, Model model, String strPageNum) {
        CardDTO view = cardService.cardView(cardId);
        model.addAttribute("view",view);

        // 리뷰 평점 및 통계 처리
        int[] stars = cardService.getReviewStar(cardId);
        int count = cardService.getReviewCount(cardId);
        int sum = 0;
        int star1 = 0;
        int star2 = 0;
        int star3 = 0;
        int star4 = 0;
        int star5 = 0;

        for(int i : stars) {
            sum += i;
            if(i==5) star5 +=1;
            else if(i==4) star4 +=1;
            else if(i==3) star3 +=1;
            else if(i==2) star2 +=1;
            else star1 +=1;
        }

        double avg = (double)sum/(double)count;
        if (Double.isNaN(avg)) avg=0;
        String avg1 = String.format("%.1f", avg);

        model.addAttribute("avg",avg1);
        model.addAttribute("count",count);
        model.addAttribute("star1",star1);
        model.addAttribute("star2",star2);
        model.addAttribute("star3",star3);
        model.addAttribute("star4",star4);
        model.addAttribute("star5",star5);

        // 리뷰 페이징 처리
        strPageNum = (strPageNum == null) ? "1" : strPageNum ;
        int pageNum = Integer.parseInt(strPageNum);
        HashMap<String, Object> hm = new HashMap<>();

        int totalCount = cardService.getReviewCount(cardId);
        int pageSize= 3;
        int pageBlock= 5;
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
        hm.put("cardId", cardId);
        List<ReviewDTO> review = cardService.reviewList(hm);
        System.out.println("reviewList: "+review);

        model.addAttribute("review",review);
        model.addAttribute("count",totalCount);
        model.addAttribute("pageDto",pageDto);
        model.addAttribute("cardId",cardId);

        return "cardView";
    }

    @ResponseBody
    @PostMapping("reviewRegister")
    public int reviewRegister(ReviewDTO review, Principal principal) {
        int result = 0;
        System.out.println("review: "+review);
        System.out.println("principal: "+principal);
        System.out.println("principal name: "+principal.getName());
        System.out.println("principal profile: "+memberService.getProfile(principal.getName()));


        if(principal != null) {
            String userId = principal.getName();
            review.setUserId(userId);
            int reviewCheck = cardService.reviewCheck(review);
                System.out.println("reviewCheck: " + reviewCheck);
            if(reviewCheck==0) {
                System.out.println("------s");
                review.setProfile(memberService.getProfile(userId));
                System.out.println("------d");
                cardService.reviewRegister(review);
                System.out.println("------f");
                result=1;
            }else {
                result=2;
            }
        }
        System.out.println("reviewRegister test: " + result);
        return result;
    }

    @ResponseBody
    @GetMapping("deleteReview")
    public void deleteReview(int reviewId,Principal principal) {
        String userId = principal.getName();
        cardService.deleteReview(reviewId);
    }

    @ResponseBody
    @PostMapping("addFav")
    public int addFav(FavDTO fav, Principal principal) {
        int result =0;

        if(principal != null) {
            String userId = principal.getName();
            fav.setUserId(userId);
            int favCheck = cardService.favCheck(fav);
            if(favCheck==0) {
                cardService.addFav(fav);
                result = 1;
            }else {
                result=2;
            }
        }
        System.out.println(result);
        return result;
    }

    @GetMapping("fav")
    public String favList(Model model, Principal principal) {
        if(principal != null) {
            String userId = principal.getName();
            MemberDTO member = memberService.findById(userId);
            model.addAttribute("member",member);

            List<FavListDTO> favList = cardService.favList(userId);
            model.addAttribute("favList", favList);
        }
        return "member/fav";
    }


    @ResponseBody
    @PostMapping("favDelete")
    public void favDelete(int favId) {
        cardService.favDelete(favId);
    }

}
