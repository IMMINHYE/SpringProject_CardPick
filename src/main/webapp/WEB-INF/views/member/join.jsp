<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <jsp:include page="../include/head.jsp"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/addressapi.js"></script>
</head>

<body>
<jsp:include page="../include/header.jsp"/>

<!-- Start Banner Area -->
<section class="banner-area organic-breadcrumb">
    <div class="container">
        <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
                <h1>Register</h1>
                <!-- 		<nav class="d-flex align-items-center">
                            <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="category.html">Join</a>
                        </nav> -->
            </div>
        </div>
    </div>
</section>
<!-- End Banner Area -->

<br><br>
<div class="whole-wrap pb-100" style="margin:10px 0 10px 350px">
    <div class="container">

        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <h3 class="mb-30">회원가입</h3>
                    <form action="join" method="post" id="frm">
                        <input type="hidden" id="auth" name="auth" value="USER">
                        <div class="mt-10">
                            <input type="text" name="userId" id="userId" placeholder="id"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'id'"
                                   required class="single-input" oninput="checkId()">
                            <span id="chkMsg"></span>
                        </div>
                        <div class="mt-10">
                            <input type="text" name="username" id="username" placeholder="name"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'name'"
                                   required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password" name="userpass" id="userpass" placeholder="password"
                                   oninput="pwCheck(userpass.value)" onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = 'password'"
                                   required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password" name="userpass_check" id="userpass_check"
                                   placeholder="password confirm" onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = 'password confirm'"
                                   required class="single-input">
                        </div>
                        <p id="pwCheckF" style="color: #FF6600; margin: 0;"></p>
                        <p id="pwCheckFF" style="color: #FF6600; margin: 0;"></p>
                        <div class="mt-10">
                            <input type="text" name="userphone" id="userphone" placeholder="phone number"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'phone number'"
                                   required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="email" name="useremail" id="useremail" placeholder="Email address"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'"
                                   required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="button" onclick="execPostCode();" value="주소검색"
                                   class="genric-btn primary small"/>
                        </div>
                        <div class="mt-10">
                            <input type="text" id="useraddr2" name="useraddr2" placeholder="도로명주소" class="single-input"
                                   readonly="readonly">
                        </div>
                        <div class="mt-10">
                            <input type="text" id="useraddr3" name="useraddr3" placeholder="상세주소" class="single-input">
                        </div>


                        <div class="mt-10">
                            프로필 사진:
                            <img src="resources/img/profile/p1.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p1.png"
                                   checked>
                            <img src="resources/img/profile/p2.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p2.png">
                            <img src="resources/img/profile/p3.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p3.png">
                            <img src="resources/img/profile/p4.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p4.png">
                            <img src="resources/img/profile/p5.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p5.png">
                            <img src="resources/img/profile/p6.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p6.png">
                            <img src="resources/img/profile/p9.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p8.png">
                            <img src="resources/img/profile/p8.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p9.png">
                            <img src="resources/img/profile/p11.png" width="50" ,height="50">
                            <input type="radio" id="profile" name="profile" value="resources/img/profile/p11.png">
                        </div>
                        <br>
                        <input type="submit" value="회원가입" class="genric-btn success medium">
                        <br><br>
                    </form>
                </div>
            </div>
        </div>


    </div>
</div>
<!-- End Align Area -->


<!-- footer -->
<jsp:include page="../include/footer.jsp"/>


<!-- js -->
<jsp:include page="../include/js.jsp"/>


<script>
    //아이디 중복체크
    function checkId() {
        var userId = $('#userId').val();
        $.ajax({
            url: 'idDuplChk',
            type: 'post',
            data: {userId: $('#userId').val()},
            success: function (data) {
                if ($.trim(data) == 0) {
                    $('#chkMsg').html("사용가능").css('color', 'green');
                } else {
                    $('#chkMsg').html("사용불가").css('color', 'red');
                }
            },
            error: function () {
                alert("에러입니다");
            }
        });
    };

    //비밀번호 체크
    $(document).ready(function () {
        $('#userpass').keyup(function () {
            $('#pwCheckFF').text('');
        });

        $('#userpass_check').keyup(function () {
            if ($('#userpass').val() != $('#userpass_check').val()) {
                $('#pwCheckFF').text('');
                $('#pwCheckFF').html("<font color='red'>패스워드 불일치");
            } else {
                $('#pwCheckFF').text('');
                $('#pwCheckFF').html("<font color='green'>패스워드 일치</font>");
            }
        });
    });

    //비밀번호 유효성 체크
    function pwCheck(pw) {
        $.ajax({
            type: "POST",
            url: "pwCheck",
            data: {pw: pw},
            success: function (result) {
                if (result == true) {
                    //	pwCheckF.innerHTML = "유효성 체크 문제 없음";
                    $('#pwCheckF').text('');
                    $('#pwCheckF').html("<font color='green'>유효성 체크 완료</font>");
                } else {
                    //	pwCheckF.innerHTML = "문자와 숫자를 조합하여 8자 이상 입력해주세요";
                    $('#pwCheckF').text('');
                    $('#pwCheckF').html("<font color='red'>최소 8자, 최소 하나의 숫자를 입력해주세요</font>");
                }
            },
            error: function (request, status) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    }

    function execPostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);


                $("[name=useraddr1]").val(data.zonecode);
                $("[name=useraddr2]").val(fullRoadAddr);

                document.getElementById('useraddr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('useraddr2').value = fullRoadAddr;
            }
        }).open();
    }


</script>

</body>

</html>