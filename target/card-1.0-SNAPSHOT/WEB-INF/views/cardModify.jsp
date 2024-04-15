<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <jsp:include page="include/head.jsp"/>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body>

<!-- header -->
<jsp:include page="include/header.jsp"/>


<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
    <div class="container">
        <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
                <h1>Admin</h1>
                <!-- 	<nav class="d-flex align-items-center">
                        <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="category.html">Admin</a>
                    </nav> -->
            </div>
        </div>
    </div>
</section>
<!-- End Banner Area -->


<br><br>
<section class="sample-text-area">
    <div class="container">
        <div class="comment-form">
            <h4>카드 정보 수정</h4>
            <form action="cardRegister" method="post" enctype="multipart/form-data">
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="cardName" placeholder="카드명"
                           onfocus="this.placeholder = ''"
                           onblur="this.placeholder = '카드명'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="cardImg" placeholder="카드 사진"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '카드 사진'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="card_company" placeholder="카드사"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '카드사'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="anual_fee" placeholder="연회비"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '연회비'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="achievement" placeholder="실적"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '실적'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="benefit1" placeholder="혜택1"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '혜택1'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="benefit2" placeholder="혜택2"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '혜택2'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="benefit3" placeholder="혜택3"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '혜택3'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="cardUrl" placeholder="카드 신청 링크"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '카드 신청 링크'">
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control" name="companyCode" placeholder="카드사 코드"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '카드사 코드'">
                </div>
        </div>
        <input type="submit" value="수정" class="genric-btn primary circle arrow">
        <input type="submit" value="목록" class="genric-btn circle arrow">
        </form>
    </div>
    </div>
</section>


<!-- footer -->
<jsp:include page="include/footer.jsp"/>

<!-- js -->
<script src="resources/js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
<script src="resources/js/vendor/bootstrap.min.js"></script>
<script src="resources/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/nouislider.min.js"></script>
<script src="resources/js/countdown.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main2.js"></script>


<script>

    var jsonData = JSON.parse('${category}');
    console.log(jsonData);

    var cate1Arr = new Array();
    var cate1Obj = new Object();

    // 1차 분류 셀렉트 박스에 삽입할 데이터 준비
    for (var i = 0; i < jsonData.length; i++) {

        if (jsonData[i].categoryCodeRef == "") {
            cate1Obj = new Object();  //초기화
            cate1Obj.categoryCode = jsonData[i].categoryCode;
            cate1Obj.categoryName = jsonData[i].categoryName;
            cate1Arr.push(cate1Obj);
        }
    }

    // 1차 분류 셀렉트 박스에 데이터 삽입
    var cate1Select = $("select.category1")

    for (var i = 0; i < cate1Arr.length; i++) {
        cate1Select.append("<option value='" + cate1Arr[i].categoryCode + "'>"
            + cate1Arr[i].categoryName + "</option>");
    }


    //2차분류
    $(document).on("change", "select.category1", function () {

        var cate2Arr = new Array();
        var cate2Obj = new Object();

        // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
        for (var i = 0; i < jsonData.length; i++) {

            if (jsonData[i].categoryCodeRef != "") {
                cate2Obj = new Object();
                cate2Obj.categoryCode = jsonData[i].categoryCode;
                cate2Obj.categoryName = jsonData[i].categoryName;
                cate2Obj.categoryCodeRef = jsonData[i].categoryCodeRef;

                cate2Arr.push(cate2Obj);
                //   console.log(cate2Obj);
            }
        }


        var cate2Select = $("select.category2");
        cate2Select.children().remove();

        $("option:selected", this).each(function () {

            var selectVal = $(this).val();
            cate2Select.append("<option value='" + selectVal + "'>전체</option>");

            for (var i = 0; i < cate2Arr.length; i++) {
                if (selectVal == cate2Arr[i].categoryCodeRef) {
                    cate2Select.append("<option value='" + cate2Arr[i].categoryCode + "'>"
                        + cate2Arr[i].categoryName + "</option>");
                }
            }

        });

    });


</script>


</body>

</html>