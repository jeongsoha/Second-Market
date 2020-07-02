<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
th {
	height: 50px;
	width: 18%;
	padding-right: 20px;
	text-align: right;
    background-color: #f6f6f6;
} 
td {
	padding-left: 20px;
}
.area{
	width: 980px;
	height: 200px;
	resize:none;
	margin-top: 20px;
	margin-bottom: 10px;
}
.text_type{
	width: 500px;
    height: 40px;
    font-size: 15px;
}

.starR{
     background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
     background-size: auto 100%;
     width: 30px;
     height: 30px;
     display: inline-block;
     text-indent: -9999px;
     cursor: pointer;
   }
.starR.ons{background-position:0 0;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<div id="content">
	<div id="main-container">
<div style="padding: 0 20px; text-align: center;">
	<h1 style="letter-spacing:5px;">평점</h1>
</div>
<div id="content">
	<form  method="post" id="frm" name="frm" enctype="multipart/form-data" onsubmit="return formCheck();">
	<div>
			<table>
				
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>내가 줄 별점</th>
					
	
					<td style="padding: 5px;padding-left: 20px;"> 
						 <input type="text" id="RE_CONTENT" name="RE_CONTENT" placeholder="리뷰 내용" class="text_type"> 
					</td>
				</tr>
				
		
				<tr>
					<td>
						<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID} + 이게뭘까1?">
						<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${orderG.GOODS_NUM}+ 이게뭘까2?"/>
						
						<input type="hidden" id="GOODS_PRICE" name="GOODS_PRICE" value="${list.GOODS_SELLER} + 이게뭘까4?"/>
						<input type="hidden" id="orderNumber" name="orderNumber" value="${orderG.GOODS_NUM} + 이게뭘까5?" />
						<input type="hidden" id="GOODS_TCOST" name="GOODS_TCOST" value="${orderG.GOODS_PRICE+orderG.GOODS_DCOST} + 이게뭘까6?" />
						<input type="hidden" id="item_name" name="item_name" value="${orderG.GOODS_TITLE} + 이게뭘까7?"/>
					</td>
				</tr>
				 <tr>
                    <th scope="row">평점</th>
                    <td>
                        <div class="starRev">
                    <span class="starR ons">1</span>
                    <span class="starR">2</span>
                    <span class="starR">3</span>
                    <span class="starR">4</span>
                    <span class="starR">5</span>  
                    <input type="hidden" id="RE_LIKE" name="RE_LIKE" value="1"> 
                  </div>
                    </td>
                </tr>
            <tr>
			</table>
			
	
			<br></br>
		<p align="center">
			<a href="#this" class="btn" id="submitPay">리뷰하기</a>
		</p>
	</div>
	</form>
</div>
</div></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

function noEvent() { // 새로 고침 방지 적용
    if (event.keyCode == 116) {
        alert("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } else if (event.ctrlKey
            && (event.keyCode == 78 || event.keyCode == 82)) {
        return false;
    }
}
document.onkeydown = noEvent;

$(document).ready(function() {


	$('.starRev span').click(function(){
        $(this).parent().children('span').removeClass('ons');
        $(this).addClass('ons').prevAll('span').addClass('ons');
        $("#RE_LIKE").val($(this).text());
        return false;
      });
	
	$("#submitPay").on("click", function(e) { // 주문하기 버튼
		e.preventDefault();
		if(fn_formCheck()){

			if(confirm("리뷰하시겠습니까?") == true){
					fn_reviewgo($(this));	//임시
					//popup($(this));
			}else{
				return;
			}

			
		}
	});

	
	/* (유진추가) 리뷰 내용 저장 펑션 */
	function fn_reviewgo() {
		var comSubmit = new ComSubmit("frm");
		var REVIEW_SELLER = "${list.GOODS_SELLER}"; //리뷰 대상 MEM_NUM
		var REVIEW_GRADE2 = $('input[name="REVIEW_GRADE"]:checked').val(); //리뷰 대상 점수
		
		var REVIEW_CONTENT = $("#RE_CONTENT").val(); //리뷰 내용
		var REVIEW_USER = "${session_MEM_ID}"; //리뷰 남긴사람 아이디

		var ORDERS_NUM = "${ORDERS_NUM}"; //리뷰 남긴사람 아이디
		//alert(ORDERS_NUM);
		console.log(REVIEW_GRADE2);
		
		comSubmit.setUrl("<c:url value='/myshop/reviewgo'/>");
		comSubmit.addParam("REVIEW_SELLER", REVIEW_SELLER);
		comSubmit.addParam("REVIEW_GRADE2",REVIEW_GRADE2);
		comSubmit.addParam("REVIEW_CONTENT",REVIEW_CONTENT);
		comSubmit.addParam("REVIEW_USER", REVIEW_USER);
		comSubmit.addParam("ORDERS_NUM", ORDERS_NUM);
		comSubmit.submit();	
		}
	});

	function fn_formCheck() {
        if(!$("#RE_CONTENT").val()){
            alert("리뷰내용을 입력해 주세요");
            $("#RE_CONTENT").focus();
            return false;

        }
	    return true;
		}
	/* 
	function popup(){
		var url = "/second/kakaoPay";
		console.log(document.getElementById("GOODS_TCOST").value);
		var param = "?orderNum="
				  + document.getElementById("orderNumber").value
				  + "&goodsTcost="
				  + document.getElementById("GOODS_TCOST").value
				  + "&itemName="
				  + document.getElementById("item_name").value
				  + "&memID="
				  + document.getElementById("MEM_ID").value;
				  
		openWin = window.open(url+param, "childForm", "width=570, height=550, resizable = no, scrollbars = no");
	} */
	
	

</script>


</body>
</html>