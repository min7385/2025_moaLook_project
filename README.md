# 2025_moaLook_project  
### 05.20(화) Hotfix: `registDo`

---

<details>
<summary><strong>문제</strong></summary>

`<form>` 태그의 `action` 속성이 `${pageContext.request.contextPath}/registDo`로 설정되어, 존재하지 않는 URL을 요청함.

</details>

<details>
<summary><strong>원인</strong></summary>

JavaScript 코드에서 `<form>` 태그의 `action` 속성을 동적으로 변경할 때 JSP의 EL 표기법(`${...}`)이 제대로 해석되지 않음.

</details>

<details>
<summary><strong>해결</strong></summary>

JSP의 `<head>` 태그 내에서 컨텍스트 경로를 JavaScript 변수 `contextPath`에 할당함.  
이후 JS 파일에서는 하드코딩된 경로 대신 해당 변수를 사용하여 `action` 속성을 설정함.

</details>
