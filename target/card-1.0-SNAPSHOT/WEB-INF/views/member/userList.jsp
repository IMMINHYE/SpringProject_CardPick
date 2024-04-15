<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<jsp:include page="../include/head.jsp" />
</head>

<body>

	<!-- header -->
	<jsp:include page="../include/header.jsp" />



	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
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

	<br>
	<br>

	<!--================Contact Area =================-->
	<section class="contact_area section_gap_bottom">
		<div class="container">
			<div class="col-lg-12">

				<span style="font-size: 30px; color: black;">회원목록(${count}) </span>

				<div class="cart_inner">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">연락처</th>
									<th scope="col">이메일</th>
									<th scope="col">주소</th>
									<th scope="col">가입일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="list">
									<tr>

										<td>${list.userId}</td>
										<td>${list.username}</td>
										<td>${list.userphone}</td>
										<td>${list.useremail}</td>
										<td>${list.useraddr2}${list.useraddr3}</td>
										<td>${list.regdate}</td>

									</tr>
								</c:forEach>

								<tr>

									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>


				<nav class="blog-pagination justify-content-center d-flex">
					<ul class="pagination">
						<!-- 이전 -->
						<c:if test="${pageDto.totalCount gt 0}">
							<li class="page-item"><c:if
									test="${pageDto.startPage gt pageDto.pageBlock }">
									<a class="page-link" aria-label="Previous"
										href="userList?strPageNum=${pageDto.startPage - pageDto.pageBlock}&field=${field}&word=${word}">
										<span aria-hidden="true"> <span
											class="lnr lnr-chevron-left"></span>
									</span>
									</a>
								</c:if></li>
							<!-- 페이지번호 -->
							<c:forEach var="i" begin="${pageDto.startPage}"
								end="${pageDto.endPage}" step="1">
								<c:if test="${i==pageDto.pageNum}">
									<li class="page-item active"><a class="page-link"
										href="userList?strPageNum=${i}&field=${field}&word=${word}">${i}</a></li>
								</c:if>
								<c:if test="${i!=pageDto.pageNum }">
									<li class="page-item"><a class="page-link"
										href="userList?strPageNum=${i}&field=${field}&word=${word}">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음 -->
							<li class="page-item"><c:if
									test="${pageDto.endPage lt pageDto.pageCount }">
									<a class="page-link" aria-label="Next"
										href="userList?strPageNum=${pageDto.startPage + pageDto.pageBlock}&field=${field}&word=${word}">
										<span aria-hidden="true"> <span
											class="lnr lnr-chevron-right"></span>
									</span>
									</a>
								</c:if></li>

						</c:if>
					</ul>
				</nav>
			</div>


			<div id="table_search">
				<form action="userList">
					<select name="field">
						<option value="userId">아이디</option>

					</select> <input type="text" name="word"> <input type="submit"
						value="검색" class="genric-btn success medium">
				</form>
			</div>

		</div>
	</section>
	<!--================Contact Area =================-->


	<!-- footer -->
	<jsp:include page="../include/footer.jsp" />

	<!-- js -->
	<jsp:include page="../include/js.jsp" />
</body>

</html>