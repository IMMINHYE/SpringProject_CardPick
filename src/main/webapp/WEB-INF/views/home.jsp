<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <title>CardPick</title>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/ion.rangeSlider.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/ion.rangeSlider.skinFlat.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/magnific-popup.css">
</head>
<body>

<!-- header -->
<jsp:include page="include/header.jsp"/>

<!-- start Card Area -->
<section class="owl-carousel active-product-area section_gap">
    <!-- single Card slide -->
    <div class="single-product-slider">
        <div class="container">
            <div class="row">

                <c:forEach items="${latestList}" var="latestList">
                    <!-- single product -->
                    <div class="col-lg-3 col-md-6">
                        <div class="single-product">
                            <a href="cardView?cardId=${latestList.cardId}">
                                <img class="img-fluid" src="${latestList.cardImg}" alt="">
                            </a>
                            <div class="product-details">
                                <h6>${latestList.cardName}</h6>
                                <div class="price">
                                </div>
                                <div class="prd-bottom">

                                    <a href="" class="social-info">
                                        <span class="ti-bag"></span>
                                        <p class="hover-text">add to bag</p>
                                    </a>
                                    <a href="" class="social-info">
                                        <span class="lnr lnr-heart"></span>
                                        <p class="hover-text">Wishlist</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>
    </div>
</section>
<!-- end Card Area -->

<!-- footer -->
<jsp:include page="include/footer.jsp"/>

<!-- js -->
<jsp:include page="include/js.jsp"/>

</body>
</html>