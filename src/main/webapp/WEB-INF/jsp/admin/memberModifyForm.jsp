<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>  
<head>
<script type="text/javascript">
$(document).ready(function() { //회원가입 버튼 클릭시
    $("#modify").on("click", function(e) {
       e.preventDefault();
       fn_check();
    });
 });
function fn_check() { //변경 버튼 클릭시(유효성검증, 데이터입력)
    var chk = $("input[name=agree_required]");
    if(!$("#MEM_PW").val()){
        alert("비밀번호를 입력해주세요.");
        $("#MEM_PW").focus();
        return false;
     }
    if(!$("#MEM_NAME").val()){
        alert("이름을 입력해주세요.");
        $("#MEM_NAME").focus();
        return false;
     }
    if(!$("#MEM_BIRTH").val()){
        alert("생일을 입력해주세요.");
        $("#MEM_BIRTH").focus();
        return false;
     }
    if(!$("#MEM_GEN").val()){
        alert("성별을 입력해주세요.");
        $("#MEM_GEN").focus();
        return false;
     }
    if(!$("#MEM_EMAIL").val()){
       alert("이메일을 입력해주세요.");
       $("#MEM_EMAIL").focus();
       return false;
    }
    
    if(!$("#MEM_PHONE").val()){
        alert("휴대전화를 입력해주세요.");
        $("#MEM_PHONE").focus();
        return false;
     }

    if(!$("#MEM_ADD1").val()){
        alert("집주소 입력해주세요.");
        $("#MEM_ADD1").focus();
        return false;
     }
    if(!$("#MEM_LEVEL").val()){
        alert("회원레벨을 입력해주세요.");
        $("#MEM_LEVEL").focus();
        return false;
     }

    var comSubmit = new ComSubmit("memberModifyForm");
    comSubmit.setUrl("<c:url value='/admin/memberModifyPro'/>");
    comSubmit.submit();
 }
 
 $("#memberModifyForm").on("submit",function(e){
 });


function back(){
   history.go(-1);
}

</script>
</head>

<!-- 메뉴 시작 -->

<div class="row" style="padding-left:50px;width:700px;">    
   <h1 class="page-header">회원수정</h1>
</div>

<div class="row" style="padding-left:50px;width:700px;">
   <div class="panel panel-default">
      <div class="panel-heading" >회원수정 페이지입니다.</div>
         <div class="panel-body">
            <form id="memberModifyForm" method="post">    
                        <div class="form-group">
                            <label>아이디</label>                            
                            <input type="text" class="form-control" name="MEM_ID" id="MEM_ID" value="${map.MEM_ID}" style="width:initial;" readonly/>                            
                        </div>
                       
                        <div class="form-group">
                            <label>비밀번호</label>
                            <input type="text" class="form-control" name="MEM_PW" id="MEM_PW"  value="${map.MEM_PW}" style="width:initial;"/>
                        </div>
                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" value="${map.MEM_NAME}" name="MEM_NAME" id="MEM_NAME" style="width:100px;"/>
                        </div>
                        <div class="form-group">
                            <label>생년월일</label><br/>
                            <input type="text" class="form-control" value="<fmt:formatDate value='${map.MEM_BIRTH}' pattern='YY.MM.dd'/>" name="MEM_BIRTH" id="MEM_BIRTH" style="width:250px;"/>                                                   
                        </div>
                        <div class="form-group">
                            <label>성별</label>
                            <input type="text" class="form-control" value="${map.MEM_GEN}" name="MEM_GEN" id="MEM_GEN" style="width:100px;"/>
                        </div>
                         <div class="form-group">
                            <label>이메일</label>
                            <input type="text" class="form-control" value="${map.MEM_EMAIL}" name="MEM_EMAIL" id="MEM_EMAIL" style="width:250px;"/>
                        </div>
                        <div class="form-group">
                            <label>휴대전화</label>
                            <input type="text" class="form-control" value="${map.MEM_PHONE}" name="MEM_PHONE" id="MEM_PHONE" style="width:initial;"/>
                            <p class="help-block">01000000000  ,- 없이 입력합니다</p>
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" class="form-control" value="${map.MEM_ADD1}" name="MEM_ADD1" id="MEM_ADD1" style="width:250px;"/>
                        </div>
                        <div class="form-group">
                            <label>가입일자</label>
                            <input type="text" class="form-control" value="<fmt:formatDate value='${map.MEM_JOINDATE}' pattern='YY.MM.dd'/>" name="MEM_JOINDATE" id="MEM_JOINDATE" style="width:250px;"/>                                                   
                        </div>
                        <div class="form-group">
                            <label>레벨</label>
                            <input type="text" class="form-control" value="${map.MEM_LEVEL}" name="MEM_LEVEL" id="MEM_LEVEL" style="width:250px;"/>
                        </div>
                  <button type="button" class="btn btn-success" id="modify">회원수정</button>
                  <button type="reset" class="btn btn-default" onclick="back();">작성취소</button>               
            </form>
         </div>
   </div>
</div>






<!-- // container -->