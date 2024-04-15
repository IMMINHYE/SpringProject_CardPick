<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>--%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="resources/css/ion.rangeSlider.css"/>
    <link rel="stylesheet" href="resources/css/ion.rangeSlider.skinFlat.css"/>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
        #star a {
            text-decoration: none;
            color: gray;
        }

        #star a.on {
            color: #FFDC3C;
        }
    </style>
</head>

<body>

<!-- header -->
<jsp:include page="include/header.jsp"/>

<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
    <div class="container">
        <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
                <h1>Card View</h1>
                <!-- 		<nav class="d-flex align-items-center">
                            <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                            <a href="single-product.html">product-details</a>
                        </nav> -->
            </div>
        </div>
    </div>
</section>
<!-- End Banner Area -->

<!--================Single Product Area =================-->
<div class="product_image_area">
    <div class="container">
        <div class="row s_product_inner">
            <div class="col-lg-6">
                <div class="single-prd-item d-flex justify-content-end">
                    <img class="img-fluid" src="${view.cardImg}" alt="">
                </div>
            </div>
            <input type="hidden" id="cardId" value="${view.cardId}">
            <div class="col-lg-5 offset-lg-1">
                <div class="s_product_text">
                    <div class="card_area d-flex align-items-center">
                        <h2>${view.cardName}</h2>
                        <a class="icon_btn" href="#" id="favBtn"><i class="lnr lnr lnr-heart"></i></a>
                    </div>
                    <br/>
                    <ul class="list">
                        <h4><span>🎁 혜택</span></h4>
                        <li><span>${view.benefit1}</span></li>
                        <li><span>${view.benefit2}</span></li>
                        <li><span>${view.benefit3}</span></li>
                        <br/>
                        <h4><span>🏆 실적</span></h4>
                        <li><span>${view.achievement}</span></li>
                        <br/>
                        <h4><span>💰 연회비</span></h4>
                        <li><span>${view.anual_fee}</span></li>
                    </ul>
                    <br/>
                    <a href="" class="primary-btn" id="applyBtn">카드 신청</a>
                </div>
            </div>
        </div>
    </div>
    <!--================End Single Product Area =================-->

    <!--================Product Description Area =================-->
    <section class="product_description_area">
        <div class="container">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
                       aria-selected="true">Description</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                       aria-controls="profile"
                       aria-selected="false">Specification</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                       aria-controls="contact"
                       aria-selected="false">Comments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab"
                       aria-controls="review"
                       aria-selected="false">Reviews</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <p>Beryl Cook is one of Britain’s most talented and amusing artists .Beryl’s pictures feature women
                        of
                        all shapes
                        and sizes enjoying themselves .Born between the two world wars, Beryl Cook eventually left
                        Kendrick
                        School in
                        Reading at the age of 15, where she went to secretarial school and then into an insurance
                        office.
                        After moving to
                        London and then Hampton, she eventually married her next door neighbour from Reading, John Cook.
                        He
                        was an
                        officer in the Merchant Navy and after he left the sea in 1956, they bought a pub for a year
                        before
                        John took a
                        job in Southern Rhodesia with a motor company. Beryl bought their young son a box of
                        watercolours,
                        and when
                        showing him how to use it, she decided that she herself quite enjoyed painting. John
                        subsequently
                        bought her a
                        child’s painting set for her birthday and it was with this that she produced her first
                        significant
                        work, a
                        half-length portrait of a dark-skinned lady with a vacant expression and large drooping breasts.
                        It
                        was aptly
                        named ‘Hangover’ by Beryl’s husband and</p>
                    <p>It is often frustrating to attempt to plan meals that are designed for one. Despite this fact, we
                        are
                        seeing
                        more and more recipe books and Internet websites that are dedicated to the act of cooking for
                        one.
                        Divorce and
                        the death of spouses or grown children leaving for college are all reasons that someone
                        accustomed
                        to cooking for
                        more than one would suddenly need to learn how to adjust all the cooking practices utilized
                        before
                        into a
                        streamlined plan of cooking that is more efficient for one person creating less</p>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <h5>Width</h5>
                                </td>
                                <td>
                                    <h5>128mm</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Height</h5>
                                </td>
                                <td>
                                    <h5>508mm</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Depth</h5>
                                </td>
                                <td>
                                    <h5>85mm</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Weight</h5>
                                </td>
                                <td>
                                    <h5>52gm</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Quality checking</h5>
                                </td>
                                <td>
                                    <h5>yes</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Freshness Duration</h5>
                                </td>
                                <td>
                                    <h5>03days</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>When packeting</h5>
                                </td>
                                <td>
                                    <h5>Without touch of hand</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5>Each Box contains</h5>
                                </td>
                                <td>
                                    <h5>60pcs</h5>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="comment_list">
                                <div class="review_item">
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="resources/img/product/review-1.png" alt="">
                                        </div>
                                        <div class="media-body">
                                            <h4>Blake Ruiz</h4>
                                            <h5>12th Feb, 2018 at 05:56 pm</h5>
                                            <a class="reply_btn" href="#">Reply</a>
                                        </div>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                        incididunt ut labore et
                                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                        laboris nisi ut aliquip ex ea
                                        commodo</p>
                                </div>
                                <div class="review_item reply">
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="resources/img/product/review-2.png" alt="">
                                        </div>
                                        <div class="media-body">
                                            <h4>Blake Ruiz</h4>
                                            <h5>12th Feb, 2018 at 05:56 pm</h5>
                                            <a class="reply_btn" href="#">Reply</a>
                                        </div>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                        incididunt ut labore et
                                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                        laboris nisi ut aliquip ex ea
                                        commodo</p>
                                </div>
                                <div class="review_item">
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="resources/img/product/review-3.png" alt="">
                                        </div>
                                        <div class="media-body">
                                            <h4>Blake Ruiz</h4>
                                            <h5>12th Feb, 2018 at 05:56 pm</h5>
                                            <a class="reply_btn" href="#">Reply</a>
                                        </div>
                                    </div>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                        incididunt ut labore et
                                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                        laboris nisi ut aliquip ex ea
                                        commodo</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="review_box">
                                <h4>Post a comment</h4>
                                <form class="row contact_form" action="contact_process.php" method="post"
                                      id="contactForm"
                                      novalidate="novalidate">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="name" name="name"
                                                   placeholder="Your Full name">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" class="form-control" id="email" name="email"
                                                   placeholder="Email Address">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="number" name="number"
                                                   placeholder="Phone Number">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                        <textarea class="form-control" name="message" id="message" rows="1"
                                                  placeholder="Message"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12 text-right">
                                        <button type="submit" value="submit" class="btn primary-btn">Submit Now</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row total_rate">
                                <div class="col-6">
                                    <div class="box_total">
                                        <h5>별점 평균</h5>
                                        <h4>${avg}</h4>
                                        <h6>(${count} Reviews)</h6>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="rating_list">
                                        <h3>Based on ${count} Reviews</h3>
                                        <ul class="list">
                                            <li><a href="#">5 Star <i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i class="fa fa-star"></i> ${star5}</a></li>
                                            <li><a href="#">4 Star <i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i
                                                    class="fa fa-star"></i> ${star4}</a></li>
                                            <li><a href="#">3 Star <i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i><i
                                                    class="fa fa-star"></i> ${star3}</a></li>
                                            <li><a href="#">2 Star <i class="fa fa-star"></i><i
                                                    class="fa fa-star"></i> ${star2}</a></li>
                                            <li><a href="#">1 Star <i class="fa fa-star"></i> ${star1}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- 리뷰리스트 -->

                            <div class="review_list">
                                <c:forEach items="${review}" var="review">
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="${review.profile}" alt="" width="70" ,height="70"
                                                     class="author_img rounded-circle">
                                            </div>
                                            <div class="media-body">
                                                <h4>${review.userId}</h4>

                                                <c:choose>
                                                    <c:when test="${review.rating==5}">
                                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                            class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                            class="fa fa-star"></i>
                                                    </c:when>
                                                    <c:when test="${review.rating==4}">
                                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                            class="fa fa-star"></i> <i class="fa fa-star"></i>
                                                    </c:when>
                                                    <c:when test="${review.rating==3}">
                                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                            class="fa fa-star"></i>
                                                    </c:when>
                                                    <c:when test="${review.rating==2}">
                                                        <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa fa-star"></i>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>
                                        <p>${review.content}</p>
                                        <p>
                                            <sec:authorize access="isAuthenticated()">
                                                <sec:authentication property="principal.username" var="userId"/>
                                            <c:if test="${review.userId ==userId}">
                                            <a href="" class="genric-btn default circle" id="deleteReviewBtn"
                                               data-reviewId="${review.reviewId}">삭제</a>
                                            </c:if>
                                            </sec:authorize>
                                    </div>
                                </c:forEach>


                                <!-- 이전 -->
                                <nav class="blog-pagination justify-content-center d-flex">
                                    <ul class="pagination">
                                        <c:if test="${pageDto.totalCount gt 0}">
                                            <li class="page-item">
                                                <c:if test="${pageDto.startPage gt pageDto.pageBlock }">
                                                    <a href="cardView?cardId=${cardId}&strPageNum=${pageDto.startPage - pageDto.pageBlock}"
                                                       class="page-link" aria-label="Previous">
										<span aria-hidden="true">
                                            <span class="lnr lnr-chevron-left"></span>
                                        </span>
                                                    </a>
                                                </c:if></li>
                                            <!-- 페이지번호 -->
                                            <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}"
                                                       step="1">
                                                <c:if test="${i==pageDto.pageNum}">
                                                    <li class="page-item active"><a
                                                            href="cardView?cardId=${cardId}&strPageNum=${i}"
                                                            class="page-link">${i}</a></li>
                                                </c:if>
                                                <c:if test="${i!=pageDto.pageNum }">
                                                    <li class="page-item"><a
                                                            href="cardView?cardId=${cardId}&strPageNum=${i}"
                                                            class="page-link">${i}</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <!-- 다음 -->
                                            <li class="page-item">
                                                <c:if test="${pageDto.endPage lt pageDto.pageCount }">
                                                    <a href="cardView?cardId=${cardId}&strPageNum=${pageDto.startPage + pageDto.pageBlock}"
                                                       class="page-link" aria-label="Next">
										<span aria-hidden="true">
					                       <span class="lnr lnr-chevron-right"></span>
					                    </span>
                                                    </a>
                                                </c:if>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>


                            </div>
                        </div>

                        <!-- 리뷰폼 -->
                        <sec:authorize access="isAnonymous()">
                            <div class="col-lg-6">
                                <div class="review_box">
                                    리뷰를 남기시려면 로그인해주세요
                                </div>
                            </div>
                        </sec:authorize>

                        <sec:authorize access="isAuthenticated()">
                            <div class="col-lg-6">
                                <div class="review_box">
                                    <form class="row contact_form" action="reviewRegister" method="post"
                                          id="contactForm"
                                          novalidate="novalidate">
                                        <h4>Add a Review</h4> &nbsp&nbsp&nbsp
                                        <p>Your Rating:</p>
                                        <p id="star">
                                            <a href="#" value="1" id="star1" name="star1" class="on">★</a>
                                            <a href="#" value="2" id="star2" name="star2" class="on">★</a>
                                            <a href="#" value="3" id="star3" name="star3" class="on">★</a>
                                            <a href="#" value="4" id="star4" name="star4" class="on">★</a>
                                            <a href="#" value="5" id="star5" name="star5" class="on">★</a>
                                        </p>

                                        <input type="hidden" id="rating" name="rating" value="5">
                                        <br>

                                        <input type="hidden" name="cardId" value="${view.cardId}">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                        <textarea class="form-control" name="content" id="content" rows="1"
                                                  placeholder="Review" onfocus="this.placeholder = ''"
                                                  onblur="this.placeholder = 'Review'"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12 text-right">
                                            <a href="" class="primary-btn" id="reviewBtn">등록</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </sec:authorize>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Product Description Area =================-->


    <!-- footer -->
    <jsp:include page="include/footer.jsp"/>

    <!-- js -->
    <jsp:include page="include/js.jsp"/>


    <script>
        //별점
        $('#star a').click(function () {
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */


            if ($('[name="star5"]').attr('class') == "on") {
                $('#rating').val('5');
            } else if ($('[name="star4"]').attr('class') == "on") {
                $('#rating').val('4');
            } else if ($('[name="star3"]').attr('class') == "on") {
                $('#rating').val('3');
            } else if ($('[name="star2"]').attr('class') == "on") {
                $('#rating').val('2');
            } else {
                $('#rating').val('1');
            }

            return false;
        });

        //보관함담기
        $("#favBtn").click(function () {
            var cardId = $("#cardId").val();
            var data = {cardId: cardId};
            $.ajax({
                url: "addFav",
                type: "post",
                data: data,
                success: function (result) {
                    if (result == 1) {
                        alert("상품을 보관함에 담았습니다");
                    } else if (result == 2) {
                        alert("이미 보관함에 담았습니다");
                    } else {
                        alert("로그인 해주세요");
                        location.href = "customLogin";
                    }
                },
                error: function () {
                    alert("이미 보관함에 담았습니다");
                }
            });
        });


        //리뷰등록
        $("#reviewBtn").click(function () {
            var cardId = $("#cardId").val();
            var content = $("#content").val();
            var rating = $("#rating").val();
            var data = {
                cardId: cardId,
                content: content,
                rating: rating
            };
            $.ajax({
                url: "reviewRegister",
                type: "post",
                data: data,
                success: function (result) {
                    if (result == 1) {
                        alert("리뷰가 등록되었습니다");
                        location.href = "cardView?cardId=" + cardId;
                    } else if (result == 2) {
                        alert("이미 리뷰를 작성하셨습니다");
                        location.href = "cardView?cardId=" + cardId;
                    } else {
                        alert("로그인 해주세요");
                        location.href = "cardView?cardId=" + cardId;
                    }
                },
                error: function () {
                    alert("이미 리뷰를 작성하셨습니다");
                    location.href = "cardView?cardId=" + cardId;
                }
            });
        });


        //리뷰삭제
        $("#deleteReviewBtn").click(function () {
            var confirm_val = confirm("정말 삭제하시겠습니까?");
            var cardId = $("#cardId").val();

            if (confirm_val) {
                var reviewId = $(this).attr("data-reviewId");

                $.ajax({
                    url: "deleteReview",
                    type: "get",
                    data: {reviewId: reviewId},
                    success: function () {
                        location.href = "cardView?cardId=" + cardId;
                    }
                });
            }
        });


    </script>


</body>

</html>