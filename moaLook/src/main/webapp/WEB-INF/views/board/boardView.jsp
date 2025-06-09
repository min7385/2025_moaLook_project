<%--
/**
 * <pre>
 * 1. 프로젝트명 : moa Look
 * 2. 작성일 : 2025. 4. 15. 오후 5:33:09
 * 3. 작성자 : kmh
 * 4. 화면ID : 화면정의서 화면ID
 * 5. 화면명 : 내 옷장
 * 6. 설명 : 메뉴-'내 옷장'을 게시판 형식으로 구현
 * </pre>
 */
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>moaLook</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    </head>
    <body>
    	
    	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    	
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">내 옷장</h1>
                    <p class="lead fw-normal text-white-50 mb-0">기록한 스타일을 보고 '그때 그 느낌'을 다시 만나보세요!</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    <!-- boardList의 데이터 수만큼 갤러리 카드를 반복하여 생성 -->
                    <c:forEach items="${boardList}" var="board">
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                            <!-- Product image-->
								<c:if test="${not empty board.boardImgPath}">
					                <img src="${pageContext.request.contextPath}/uploaded_images/${board.boardImgPath}"
					                     class="card-img-top" alt="게시글 이미지"
					                     style="width: 100%; height: 200px; object-fit: cover;">
					            </c:if>
					            <c:if test="${empty board.boardImgPath}">
					                <img src="${pageContext.request.contextPath}/resources/img/default_board_img.png"
					                     class="card-img-top" alt="기본 이미지"
					                     style="width: 100%; height: 200px; object-fit: cover;">
					            </c:if>	                            
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
                                		<!-- Look image -->	
	                                    <h5 class="fw-bolder">${board.boardTitle}</h5>
	                                    <h6>${board.styleTypeName}</h6>
	                                    <h6>${board.createDate}</h6>                              	
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<c:url value="/boardDetailView?boardNo=${board.boardNo}"/>">상세보기</a></div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
                <div class="col-12 text-end mt-4">
                	<button class="btn btn-primary btn-xl" type="button" onclick="location.href='${pageContext.request.contextPath}/boardWriteView'">글작성</button>
                </div>
            </div>
			<!-- 페이지네이션 UI 시작 -->
	        <div class="pagination-container">
	            <nav aria-label="Page navigation">
	                <ul class="pagination justify-content-center">
	                    <!-- 이전 페이지 그룹 (예: << 버튼) -->
	                    <c:if test="${searchVO.firstPage > 1}">
	                        <li class="page-item">
	                            <a class="page-link" href="<c:url value="/boardView">
	                                <c:param name="curPage" value="${searchVO.firstPage - 1}"/>
	                                <c:param name="rowSizePerPage" value="${searchVO.rowSizePerPage}"/>
	                                <c:param name="searchType" value="${searchVO.searchType}"/>
	                                <c:param name="searchWord" value="${searchVO.searchWord}"/>
	                                <c:param name="searchCategory" value="${searchVO.searchCategory}"/>
	                            </c:url>" aria-label="Previous">
	                                <span aria-hidden="true">&laquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	
	                    <!-- 페이지 번호들 (1, 2, 3, ...) -->
	                    <c:forEach begin="${searchVO.firstPage}" end="${searchVO.lastPage}" var="i">
	                        <li class="page-item <c:if test="${i eq searchVO.curPage}">active</c:if>">
	                            <a class="page-link" href="<c:url value="/boardView">
	                                <c:param name="curPage" value="${i}"/>
	                                <c:param name="rowSizePerPage" value="${searchVO.rowSizePerPage}"/>
	                                <c:param name="searchType" value="${searchVO.searchType}"/>
	                                <c:param name="searchWord" value="${searchVO.searchWord}"/>
	                                <c:param name="searchCategory" value="${searchVO.searchCategory}"/>
	                            </c:url>">${i}</a>
	                        </li>
	                    </c:forEach>
	
	                    <!-- 다음 페이지 그룹 (예: >> 버튼) -->
	                    <c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
	                        <li class="page-item">
	                            <a class="page-link" href="<c:url value="/boardView">
	                                <c:param name="curPage" value="${searchVO.lastPage + 1}"/>
	                                <c:param name="rowSizePerPage" value="${searchVO.rowSizePerPage}"/>
	                                <c:param name="searchType" value="${searchVO.searchType}"/>
	                                <c:param name="searchWord" value="${searchVO.searchWord}"/>
	                                <c:param name="searchCategory" value="${searchVO.searchCategory}"/>
	                            </c:url>" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                </ul>
	            </nav>
	        </div>
	        <!-- 페이지네이션 UI 끝 -->
        </section>
        
        <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
     
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
