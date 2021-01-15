# Second Market

- MVC패턴을 활용한 중고물품 거래 및 커뮤니티 웹 사이트

- 2020.05.18 - 2020.06.17 (약 4주)

- 개발인원 : Backend 5명

<br/>

# Development Environment

- **Web Application Server** - Apache Tomcat 8.5

- **Language** - Java, JSP, JavaScript, Oracle SQL, HTML, CSS, Ajax

- **Tool** - Spring Tool Suite4, GitHub, SqlDeveloper

- **DB** - Oracle 11g

<br/>

# View

세컨트마켓.gif

<br/>

## 회원가입

<img src="https://user-images.githubusercontent.com/62328928/104753186-fb710400-579a-11eb-92a5-537a3a85fc10.png" width="400" height="444">

- Mybatis framework 사용

- Ajax를 이용해 실시간 아이디 중복여부 체크

- 이메일 인증 라이브러리(javax.mail)을 이용한 이메일 인증 기능

<br/>

## 로그인

<img src="https://user-images.githubusercontent.com/62328928/104753243-0deb3d80-579b-11eb-8b2a-95b93093f52c.png" width="300" height="337">

- Mybatis framework 사용

- 쿠키를 이용한 아이디 저장 기능 (체크박스를 해제 시 쿠키 만료일을 현재 날짜 하루 전으로 설정하여 쿠키 삭제 됨)

- Ajax를 이용해 입력한 정보 확인

<br/>

## 마이페이지

<img src="https://user-images.githubusercontent.com/62328928/104754864-117fc400-579d-11eb-8f50-fea77f03064b.png" width="450" height="370">

- Mybatis framework 사용

- Ajax를 이용한 비밀번호 변경, 회원탈퇴 기능

<br/>

## 신고게시판

<img src="https://user-images.githubusercontent.com/62328928/104754933-23616700-579d-11eb-96dc-6ca6dfc59f99.png" width="700" height="250">
<img src="https://user-images.githubusercontent.com/62328928/104754996-396f2780-579d-11eb-91d0-157c904a8d7f.png" width="700" height="215">

- Mybatis framework를 사용한 페이징 처리

- CK Editor

- CRUD - 목록, 상세보기, 글쓰기, 수정 기능

<br/>

## ERROR Page

<left><img src="https://user-images.githubusercontent.com/62328928/104753424-4e4abb80-579b-11eb-8523-2b4923b7670e.png" width="440" height="215"></left>
<right><img src="https://user-images.githubusercontent.com/62328928/104753442-56a2f680-579b-11eb-8c6f-f18bba36cdf0.png" width="440" height="215"></right>

- 404ERROR Page (web.xml설정)

- 500ERROR Page (모든 Controller 설정)

<br/>

## 헤더, 푸터

<img src="https://user-images.githubusercontent.com/62328928/104753475-64f11280-579b-11eb-80ac-4a6cf7297082.png" width="700" height="180">
<img src="https://user-images.githubusercontent.com/62328928/104753503-70443e00-579b-11eb-98ea-d0f9527508fe.png" width="700" height="130">

- 로그인 여부에 따른 메뉴바 변경

- back, next 함수를 이용한 배너의 순차적 이동

