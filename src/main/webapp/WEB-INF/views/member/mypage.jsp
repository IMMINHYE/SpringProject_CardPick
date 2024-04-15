<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <jsp:include page="../include/head.jsp"/>
    <link rel="stylesheet" href="/resources/css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="/resources/css/ion.rangeSlider.skinFlat.css" />
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
            <div class="col-lg-6">
                <div class="blog_right_sidebar">

                    <aside class="single_sidebar_widget author_widget">
                        <img class="author_img rounded-circle" src="${member.profile}" alt="" width="200",height="200">
                        <h4>${member.username}</h4>


                        <div class="br"></div>
                    </aside>


                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">나의 계정</h4>
                        <ul class="list cat-list">
                            <li>
                                <a href="mypage" class="d-flex justify-content-between">
                                </a>
                            </li>
                            <li>
                                <a href="info" class="d-flex justify-content-between">
                                    <p>회원정보관리</p>
                                </a>
                            </li>
                            <li>
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
</body>

</html>