<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>--%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <jsp:include page="include/head.jsp"/>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body id="company">

<!-- header -->
<jsp:include page="include/header.jsp"/>



<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
    <div class="container">
        <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
                <h1>신용카드</h1>
                <!-- 	<nav class="d-flex align-items-center">
                        <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="productAllList">국내도서 리스트</a>
                    </nav> -->
            </div>
        </div>
    </div>
</section>
<!-- End Banner Area -->
<div class="container">
    <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">

            <c:if test="${companyCode==null || companyCode<200}">
                <div class="sidebar-categories">
                    <div class="head">카드사</div>
                    <ul class="main-categories">
                        <li class="main-nav-list"><a href="cardList?companyCode=101" ><span
                                class="lnr lnr-arrow-right"></span>신한카드<span class="number"></span></a>
                        </li>
                        <li class="main-nav-list"><a href="cardList?companyCode=102" ><span
                                class="lnr lnr-arrow-right"></span>현대카드<span class="number"></span></a>
                        </li>
                        <li class="main-nav-list"><a href="cardList?companyCode=103" ><span
                                class="lnr lnr-arrow-right"></span>삼성카드<span class="number"></span></a>
                        </li>
                        <li class="main-nav-list"><a href="cardList?companyCode=104" ><span
                                class="lnr lnr-arrow-right"></span>국민카드<span class="number"></span></a>
                        </li>
                        <li class="main-nav-list"><a href="cardList?companyCode=105" ><span
                                class="lnr lnr-arrow-right"></span>롯데카드<span class="number"></span></a>
                        </li>
                        <li class="main-nav-list"><a href="cardList?companyCode=106" ><span
                                class="lnr lnr-arrow-right"></span>하나카드<span class="number"></span></a>
                        </li>
                        <li class="main-nav-list"><a href="cardList?companyCode=107" ><span
                                class="lnr lnr-arrow-right"></span>우리카드<span class="number"></span></a>
                        </li>
                        <li class="main-nav-list"><a href="cardList?companyCode=108" ><span
                                class="lnr lnr-arrow-right"></span>농협카드<span class="number"></span></a>
                        </li>
                    </ul>
                </div>
            </c:if>

            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div>
                    <a href="cardRegister" class="genric-btn primary e-large" style="margin:50px 0 0px 50px">카드등록</a>
                </div>
            </sec:authorize>

        </div>

        <div class="col-xl-9 col-lg-8 col-md-7">
            <!-- Start Filter Bar -->
            <div class="filter-bar d-flex flex-wrap align-items-center">
                <!--  	<div class="sorting">
                        <select>
                            <option value="1">Default sorting</option>
                            <option value="1">Default sorting</option>
                            <option value="1">Default sorting</option>
                        </select>
                    </div>
                    <div class="sorting mr-auto">
                        <select>
                            <option value="1">Show 6</option>
                            <option value="1">Show 6</option>
                            <option value="1">Show 6</option>
                        </select>
                    </div> -->

                <div class="sorting">
                    <form action="productAllList">
                        <select name="field" >
                            <option value="cardName">카드명</option>
                        </select>
                        &nbsp<input type="text" name="word" style="height:40px;">
                        <input type="submit" value="검색" class="genric-btn primary radius" >
                    </form>
                </div>
                <div class="sorting mr-auto">
                </div>


                <c:if test="${companyCode!=null}">
                    <div class="pagination">
                        <!-- 이전 -->
                        <c:if test="${pageDto.totalCount gt 0}">

                            <c:if test="${pageDto.startPage gt pageDto.pageBlock }">
                                <a href="cardList?companyCode=${companyCode}&strPageNum=${pageDto.startPage - pageDto.pageBlock}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                            </c:if>
                            <!-- 페이지번호 -->
                            <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
                                <c:if test="${i==pageDto.pageNum}">
                                    <a href="cardList?companyCode=${companyCode}&strPageNum=${i}" class="active">${i}</a>
                                </c:if>
                                <c:if test="${i!=pageDto.pageNum }">
                                    <a href="cardList?companyCode=${companyCode}&strPageNum=${i}">${i}</a>
                                </c:if>
                            </c:forEach>
                            <!-- 다음 -->

                            <c:if test="${pageDto.endPage lt pageDto.pageCount }">
                                <a href="cardList?companyCode=${companyCode}&strPageNum=${pageDto.startPage + pageDto.pageBlock}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                            </c:if>
                        </c:if>
                    </div>
                </c:if>


                <c:if test="${companyCode==null}">
                    <div class="pagination">
                        <!-- 이전 -->
                        <c:if test="${pageDto.totalCount gt 0}">

                            <c:if test="${pageDto.startPage gt pageDto.pageBlock }">
                                <a href="cardAllList&strPageNum=${pageDto.startPage - pageDto.pageBlock}&field=${field}&word=${word}" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                            </c:if>
                            <!-- 페이지번호 -->
                            <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
                                <c:if test="${i==pageDto.pageNum}">
                                    <a href="cardAllList?strPageNum=${i}&field=${field}&word=${word}" class="active">${i}</a>
                                </c:if>
                                <c:if test="${i!=pageDto.pageNum }">
                                    <a href="cardAllList?strPageNum=${i}&field=${field}&word=${word}">${i}</a>
                                </c:if>
                            </c:forEach>
                            <!-- 다음 -->

                            <c:if test="${pageDto.endPage lt pageDto.pageCount }">
                                <a href="cardAllList?strPageNum=${pageDto.startPage + pageDto.pageBlock}&field=${field}&word=${word}" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                            </c:if>
                        </c:if>
                    </div>
                </c:if>

            </div>
            <!-- End Filter Bar -->
            <!-- Start Best Seller -->
            <section class="lattest-product-area pb-40 category-list">
                <div class="row">
                    <!-- single product -->
                    <c:forEach items="${list}" var="list">
                        <input type="hidden" id="cardId" value="${list.cardId}">
                        <div class="col-lg-4 col-md-6">
                            <div class="single-product">
                                <img class="img-fluid" src="${list.cardImg}" alt="">
<%--                                <div style="image: url('${list.cardImg}');"></div>--%>
                                <div class="product-details">
                                    <h6><a href="cardView?cardId=${list.cardId}">${list.cardName}</a></h6>
                                    <div class="prd-bottom">

                                        <a href="" class="social-info" id="cartBtn" data-cardId="${list.cardId}">
                                            <span class="ti-bag" ></span>
                                            <p class="hover-text">Apply</p>
                                        </a>
                                        <a href="" class="social-info" id="favBtn" data-cardId="${list.cardId}">
                                            <span class="lnr lnr-heart"></span>
                                            <p class="hover-text">Wishlist</p>
                                        </a>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <a href="cardUpdateForm?cardId=${list.cardId}" class="social-info">
                                                <span class="lnr lnr-sync"></span>
                                                <p class="hover-text">update</p>
                                            </a>
                                            <a href="cardDelete?cardId=${list.cardId}" class="social-info">
                                                <span class="lnr lnr-move"></span>
                                                <p class="hover-text">delete</p>
                                            </a>
                                        </sec:authorize>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </section>
            <!-- End Best Seller -->

        </div>
    </div>
</div>





<!-- footer -->
<jsp:include page="include/footer.jsp"/>

<!-- Modal Quick Product View -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="container relative">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="product-quick-view">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="quick-view-carousel">
                            <div class="item" style="background: url(img/organic-food/q1.jpg);">

                            </div>
                            <div class="item" style="background: url(img/organic-food/q1.jpg);">

                            </div>
                            <div class="item" style="background: url(img/organic-food/q1.jpg);">

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="quick-view-content">
                            <div class="top">
                                <h3 class="head">Mill Oil 1000W Heater, White</h3>
                                <div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span></div>
                                <div class="category">Category: <span>Household</span></div>
                                <div class="available">Availibility: <span>In Stock</span></div>
                            </div>
                            <div class="middle">
                                <p class="content">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are
                                    looking for something that can make your interior look awesome, and at the same time give you the pleasant
                                    warm feeling during the winter.</p>
                                <a href="#" class="view-full">View full Details <span class="lnr lnr-arrow-right"></span></a>
                            </div>
                            <div class="bottom">
                                <div class="color-picker d-flex align-items-center">Color:
                                    <span class="single-pick"></span>
                                    <span class="single-pick"></span>
                                    <span class="single-pick"></span>
                                    <span class="single-pick"></span>
                                    <span class="single-pick"></span>
                                </div>
                                <div class="quantity-container d-flex align-items-center mt-15">
                                    Quantity:
                                    <input type="text" class="quantity-amount ml-15" value="1" />
                                    <div class="arrow-btn d-inline-flex flex-column">
                                        <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                        <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                    </div>

                                </div>
                                <div class="d-flex mt-20">
                                    <a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
                                    <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                    <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- js -->
<jsp:include page="include/js.jsp"/>

<script>
    $(document).ready(function(){


        //보관함담기
        $(document).on("click", "#favBtn", function(){
            var cardId = $(this).attr("data-cardId");
            var data = {cardId : cardId};
            $.ajax({
                url : "addFav",
                type : "post",
                data : data,
                success : function(result){
                    if(result==1){
                        alert("상품을 보관함에 담았습니다");
                    }else if(result==2){
                        alert("이미 보관함에 담았습니다");
                    }else{
                        alert("로그인 해주세요");
                    }
                },
                error : function(){
                    alert("이미 보관함에 담았습니다");
                }
            });
        });


    });

</script>
</body>

</html>