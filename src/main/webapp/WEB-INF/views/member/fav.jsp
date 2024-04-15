<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <jsp:include page="../include/head.jsp"/>
    <link rel="stylesheet" href="/resources/css/ion.rangeSlider.css"/>
    <link rel="stylesheet" href="/resources/css/ion.rangeSlider.skinFlat.css"/>
</head>

<body>

<!-- header -->
<jsp:include page="../include/header.jsp"/>

<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
    <div class="container">
        <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
                <h1>Mypage</h1>
                <!--    <nav class="d-flex align-items-center">
                        <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="category.html">Mypage</a>
                    </nav> -->
            </div>
        </div>
    </div>
</section>
<!-- End Banner Area -->

<!--================Content Area =================-->
<section class="blog_area single-post-area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 posts-list">
                <div class="single-post row">


                    <div class="col-lg-12">
                        <h2>보관함</h2> <br><br>

                        <div class="cart_inner">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">카드 정보</th>
                                        <th scope="col">버튼</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${favList}" var="favList">
                                        <tr>
                                            <td>
                                                <div class="media">
                                                    <div class="media-body">
                                                        <a href="cardView?cardId=${favList.fav.cardId}"><img
                                                                class="img-fluid" src="${favList.card.cardImg}" alt=""></a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="cardView?cardId=${favList.fav.cardId}">
                                                    <h4>${favList.card.cardName}</h4></a><br>
                                                <h6>💳카드사 : ${favList.card.card_company}</h6><br>
                                                <h6>💰연회비 : ${favList.card.anual_fee}</h6><br>
                                                <h6>🏆실적 : ${favList.card.achievement}</h6><br>
                                            </td>
                                            <td>
                                                <a href="" id="favDeleteBtn" data-favId="${favList.fav.favId}"
                                                   class="genric-btn info small">삭제</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>


                    </div>
                </div>


            </div>


            <div class="col-lg-4">
                <div class="blog_right_sidebar">

                    <aside class="single_sidebar_widget author_widget">
                        <img class="author_img rounded-circle" src="${member.profile}" alt="" width="200" ,height="200">
                        <h4>${member.username}</h4>

                        <div class="br"></div>
                    </aside>


                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">나의 계정</h4>
                        <ul class="list cat-list">
                            <li>
                                <a href="info" class="d-flex justify-content-between">
                                    <p>회원정보관리</p>
                                </a>
                            </li>
                            <li>
                                <a href="fav" class="d-flex justify-content-between">
                                    <p>보관함</p>
                                </a>
                            </li>

                        </ul>
                    </aside>


                </div>
            </div>
        </div>
    </div>
</section>
<!--================Content Area =================-->

<!-- footer -->
<jsp:include page="../include/footer.jsp"/>

<!-- js -->
<jsp:include page="../include/js.jsp"/>

<script>
    $(document).ready(function () {


        //보관함 삭제
        $(document).on("click", "#favDeleteBtn", function () {
            var confirm_val = confirm("정말 삭제하시겠습니까?");

            if (confirm_val) {
                var favId = $(this).attr("data-favId");
                var data = {favId: favId};
                $.ajax({
                    url: "favDelete",
                    type: "post",
                    data: data,
                    success: function () {
                        location.href = "fav";
                    }
                });
            }
        });


    });


</script>

</body>

</html>