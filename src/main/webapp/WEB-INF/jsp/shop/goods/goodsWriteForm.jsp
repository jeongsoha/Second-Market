<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<meta charset="UTF-8">
<style type="text/css">
#main-container
{
   min-height: 200px;
   margin: auto;
   padding: 20px;
   background-color: #fff;
   border: 1px solid #888;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<div id="content">
	<div id="main-container">
	<center><img src="./../resources/images/form_tgoods.png"></center>
		<form  method="post" id="frm" name="frm" enctype="multipart/form-data" onsubmit="return formCheck();">
		<table class="tbl_type">
		<colgroup>
            <col width="10%">
            <col width="*"/>
            <col width="10%">
            <col width="*%">
         </colgroup>
		<tr>
			<td>
	      		<img src="./../resources/images/form_category.png">
	      	</td>
	      	<td>
	      		<select name="GOODS_CATEGORY" id="GOODS_CATEGORY">
					<option value="" selected disabled hidden>==선택하세요==</option>
				    <option value="1">의류</option>
				    <option value="2">전자기기</option>
				    <option value="3">악세서리</option>
				    <option value="4">기타</option>
				</select>
	      	</td>
	      	<td>
				<img src="./../resources/images/form_hash.png"><br/>
			</td>
			<td>
				<input type="text" id="GOODS_HASH" name="GOODS_HASH" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_HASH}"</c:if>>
			</td>
		</tr>
		<tr>
			<td>
				<img src="./../resources/images/form_title.png"><br/>
			</td>
			<td>
				<input type="text" id="GOODS_TITLE" name="GOODS_TITLE" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_TITLE}"</c:if>>
				<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}">
			</td>
	      	<td>
	      		<img src="./../resources/images/form_pstatus.png">
	      	</td>
	      	<td>
	      		<select name="GOODS_STATUS" id="GOODS_STATUS">
					<option value="" selected disabled hidden>==선택하세요==</option>
				    <option value="1">A</option>
				    <option value="2">B</option>
				    <option value="3">C</option>
				    <option value="4">D</option>
				</select>
	      	</td>
		</tr>
		<tr>
			<td>
				<img src="./../resources/images/form_price.png"><br/>
			</td>
			<td>
				<input type="text" id="GOODS_PRICE" name="GOODS_PRICE" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_PRICE}"</c:if>>
			</td>
			<td>
				<img src="./../resources/images/form_dprice.png"><br/>
			</td>
			<td>
				<input type="text" id="GOODS_DCOST" name="GOODS_DCOST" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_DCOST}"</c:if>>
			</td>
		</tr>
		<tr>
			<td>
				<img src="./../resources/images/form_brand.png"><br/>
			</td>
			<td>
				<input type="text" id="GOODS_BRAND" name="GOODS_BRAND" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_BRAND}"</c:if>>
			</td>
			<td>
				<img src="./../resources/images/form_area.png"><br/>
			</td>
			<td>
				<input type="text" id="GOODS_REGION" name="GOODS_REGION" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_REGION}"</c:if>>
			</td>
		</tr>
		<tr>
			<td colspan="4">
               <img src="./../resources/images/form_pinfo.png"> <br/>
            </td>
        </tr>
        <tr>
        	<td colspan="4">
               <textarea name="GOODS_CONTENT" id="GOODS_CONTENT" rows="30" cols="100"><c:if test="${request_type eq 'modify'}">${map.GOODS_CONTENT}</c:if></textarea>
			</td>
		</tr>
      </ul>
	  </table>
	  
      	<p align="left">
      		<c:if test="${request_type eq 'modify'}"><a href="#this" class="btn" id="updateBtn"><button class="bttn-bordered bttn-xs bttn-primary">수정하기</button></a></c:if>
			<c:if test="${request_type eq 'write'}"><a href="#this" class="btn" id="addBtn"><button class="bttn-bordered bttn-xs bttn-primary">작성하기</button></a></c:if>
			<a href="#this" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
			
      	</p>
	  
	  <c:if test="${request_type eq 'modify'}"><input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}"></c:if>
      </form>
	</div>
</div>

<script type="text/javascript">
	var gfv_count = 1;
	
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼
			e.preventDefault();
			fn_openGoodsList();
		});
		
		$("#addBtn").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			if(fn_formCheck()){
				fn_insertGoods();	
			}
		});
		$("#updateBtn").on("click", function(e){ //수정하기 버튼
			e.preventDefault();
			if(fn_formCheck()){
				fn_updateGoods();	
			}
		});
	});
	
    $(function(){
		CKEDITOR.replace('GOODS_CONTENT',{
            width:'100%',
            height:'600px',
			filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
		});
	});
	
	function fn_openGoodsList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shop/allGoodsList' />");
		comSubmit.submit();
	}
	
	function fn_insertGoods(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/shop/goodsWrite' />");
		
     	// 게시글 카테고리 필요
        if(!$("#GOODS_CATEGORY").val()){
            alert("카테고리를 입력해주세요.");
            $("#GOODS_CATEGORY").focus();
            return false;
        }
     	// 게시글 중고상태 필요
        if(!$("#GOODS_STATUS").val()){
            alert("중고상태를 입력해주세요.");
            $("#GOODS_STATUS").focus();
            return false;
        }
        // 게시글 제목 필요
        if(!$("#GOODS_TITLE").val()){
            alert("제목를 입력해주세요.");
            $("#GOODS_TITLE").focus();
            return false;
        }
   	 	// 게시글 내용 필요
        if(CKEDITOR.instances.GOODS_CONTENT.getData() =='' 
                || CKEDITOR.instances.GOODS_CONTENT.getData().length ==0){
            alert("내용을 입력해주세요.");
            $("#GOODS_CONTENT").focus();
            return false;
        }
   	 	
     	// 게시글 가격입력 필요
        if(!$("#GOODS_PRICE").val()){
            alert("가격을 입력해주세요.");
            $("#GOODS_PRICE").focus();
            return false;
        }
     	// 게시글 배송비 필요
        if(!$("#GOODS_DCOST").val()){
            alert("배송비를 입력해주세요.");
            $("#GOODS_DCOST").focus();
            return false;
        }
     	// 게시글 브랜드 필요
        if(!$("#GOODS_BRAND").val()){
            alert("브랜드를 입력해주세요.");
            $("#GOODS_BRAND").focus();
            return false;
        }
     	// 게시글 해시태그 필요
        if(!$("#GOODS_HASH").val()){
            alert("해시태그를 입력해주세요.");
            $("#GOODS_HASH").focus();
            return false;
        }
     	// 게시글 판매지역 필요
        if(!$("#GOODS_REGION").val()){
            alert("판매지역을 입력해주세요.");
            $("#GOODS_REGION").focus();
            return false;
        }
     	
     	
		
		comSubmit.submit();
	} 
	
	function fn_updateGoods(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/shop/goodsModify' />");
		comSubmit.submit();
	} 
	
	function fn_formCheck() {
		// submit을 제외한 모든 input태그의 갯수를 가져옴
	    var length = document.frm.length;
	 
	    for ( var i = 0; i < length; i++) { // 길이만큼 루프를 돌면서
	 		if(document.frm[i] = 'file'){
	 			continue;
	 		}
	        if (document.frm[i].value == null || document.frm[i].value == "") {
	            // 경고창을 띄우고
	            alert("값을 입력하세요.");
	            //alert(document.frm[i].name + "을(를) 입력하세요.");
	            // null인 태그에 포커스를 줌
	            document.frm[i].focus();
	            return false;
	        }//end if
	    }//end for
	    return true;
		}
</script>
</body>
</html>