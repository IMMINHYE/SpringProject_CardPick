<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!-- Start Header Area -->
<header class="header_area sticky-header">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light main_box">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand logo_h" href="home"><img src="/resources/img/logo3.png" alt="" height="50"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">카드사</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="cardAllList">전체</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=101">신한카드</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=102">현대카드</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=103">삼성카드</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=104">국민카드</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=105">롯데카드</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=106">하나카드</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=107">우리카드</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardList?companyCode=108">농협카드</a></li>
                            </ul>
                        </li>
                        <sec:authorize access="isAnonymous()">
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true"
                                   aria-expanded="false">로그인</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
                                    <li class="nav-item"><a class="nav-link" href="join">회원가입</a></li>
                                </ul>
                            </li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_USER')">
                        <li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">관리자페이지</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
                                <li class="nav-item"><a class="nav-link" href="userList">회원관리</a></li>
                                <li class="nav-item"><a class="nav-link" href="cardRegister">카드관리</a>
                            </ul>
                        </li>
                        </sec:authorize>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="search_input" id="search_input_box">
        <div class="container">
            <form class="d-flex justify-content-between">
                <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                <button type="submit" class="btn"></button>
                <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
            </form>
        </div>
    </div>
</header>
<!-- End Header Area -->
	
