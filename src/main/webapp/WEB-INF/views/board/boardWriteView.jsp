<%--
/**
 * <pre>
 * 1. 프로젝트명 : 에코알라 프로젝트
 * 2. 작성일 : 2025. 4. 16. 오후 3:44:03
 * 3. 작성자 : kmh
 * 4. 화면ID : (화면정의서에 따라)
 * 5. 화면명 : 내 Look 등록
 * 6. 설명 : 내 옷장 목록에서 글 작성 버튼을 클릭하면 접근 가능
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
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
        <style>
            /* 필요에 따라 추가적인 CSS 스타일을 여기에 정의합니다. */
            /* 예시: 라디오 버튼 레이아웃 조정 */
            .form-check {
                margin-bottom: 10px; /* 라디오 버튼 간 간격 */
            }
            .form-check-input {
                margin-right: 5px; /* 라디오 버튼과 텍스트 사이 간격 */
            }
            /* 이미지 미리보기 스타일 */
            /* 이미지 미리보기를 감싸는 mb-3 div에 overflow: hidden 추가 */
            .mb-3.image-upload-section { /* 이 클래스가 HTML에 적용되어야 합니다. */
                overflow: hidden !important; /* 자식 요소가 넘칠 경우 숨김 처리 */
                /* border: 2px solid red; /* 디버깅용: 이 div의 실제 경계를 확인 */
            }

            #imagePreviewContainer {
                width: 100%; /* 부모 요소의 전체 너비를 사용하도록 명시 */
                /* border: 1px dashed blue; /* 디버깅용: 컨테이너 경계 확인 */
            }

            #imagePreviewContainer img {
                max-width: 100%; /* 이미지가 직계 부모 요소인 #imagePreviewContainer의 너비를 넘지 않도록 합니다. */
                height: auto;    /* 이미지의 가로세로 비율을 자동으로 유지합니다. */
                display: block;  /* 이미지 아래에 생기는 여백을 제거하고 블록 요소로 만듭니다. */
                margin-top: 10px; /* 파일 입력 필드와의 간격을 줍니다. */
                border-radius: 8px; /* 둥근 모서리로 보기 좋게 만듭니다. */
                box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* 은은한 그림자 효과를 줍니다. */
            }
        </style>
    </head>
    <body>
        
        <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
        
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">moaLook</h1>
                    <p class="lead fw-normal text-white-50 mb-0">당신의 스타일을 등록하세요!</p>
                </div>
            </div>
        </header>
        <section class="py-5">
            <div class="container" style="margin-top: 100px;">
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글 작성</h2>
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form action="<c:url value='/boardWriteDo' />" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="boardTitle" class="form-label">제목</label>
                                <input class="form-control" id="boardTitle" name="boardTitle" type="text" required />
                            </div>
<!-- 필요없어보여서 일단 주석처리                            <div class="mb-3">
                                <label for="boardContent" class="form-label">내용</label>
                                <textarea class="form-control" id="boardContent" name="boardContent" rows="5" required style="height: 20rem"></textarea>
                            </div> -->
                            
                            <div class="mb-3 image-upload-section"> <%-- <-- 이 div에 image-upload-section 클래스가 올바르게 적용되었습니다. --%>
                                <input class="form-control" type="file" id="boardImg" name="boardImg" accept="image/*">
                                <div id="imagePreviewContainer" class="mt-2">
                                    </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label d-block">스타일 선택</label>
                                <div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="styleType" id="styleType1" value="1">
                                        <label class="form-check-label" for="styleOption1">캐주얼/비즈니스 캐주얼</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="styleType" id="styleType2" value="2">
                                        <label class="form-check-label" for="styleOption2">댄디/미니멀</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="styleType" id="styleType3" value="3">
                                        <label class="form-check-label" for="styleOption3">클래식</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="styleType" id="styleType4" value="4">
                                        <label class="form-check-label" for="styleOption4">스트릿/빈티지</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="styleType" id="styleType5" value="5">
                                        <label class="form-check-label" for="styleOption5">스포티</label>
                                    </div>
                                </div>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <button class="btn btn-primary btn-xl" type="submit">등록</button>
                                <button class="btn btn-outline-secondary btn-xl" type="button" onclick="location.href='${pageContext.request.contextPath}/boardView'">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>        
        </section>
        
        <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <script src="js/scripts.js"></script>
        
        <script>
            document.getElementById('boardImg').addEventListener('change', function(event) {
                const file = event.target.files[0]; // 선택된 파일 가져오기
                const previewContainer = document.getElementById('imagePreviewContainer');
                previewContainer.innerHTML = ''; // 이전 미리보기 삭제

                if (file) {
                    const reader = new FileReader(); // FileReader 객체 생성

                    reader.onload = function(e) {
                        const img = document.createElement('img'); // img 태그 생성
                        img.src = e.target.result; // Data URL을 이미지 src로 설정
                        img.alt = 'Image Preview'; // alt 속성 추가
                        previewContainer.appendChild(img); // 미리보기 컨테이너에 이미지 추가
                    };

                    reader.readAsDataURL(file); // 파일을 Data URL로 읽기 시작
                }
            });
        </script>
    </body>
</html>
