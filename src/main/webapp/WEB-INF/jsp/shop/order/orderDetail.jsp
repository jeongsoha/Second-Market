<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<style type="text/css">
#main-container
{
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   background-color: #fff;
   border: 1px solid #888;
}
</style>
</head>
<body>
<div id="content">
	<h1 align="center">주문 상세보기</h1>
	<div id="main-container">
		상품정보
			<table border="1" height="100" style="width: 100%;">
				<tbody>
					<tr>
						<td style="width: 875px;">
							<table border="1" style="border-collapse: collapse; width: 100%;">
								<tbody>
									<tr>
										<td style="width: 16.6667%;">상품 정보</td>
										<td style="width: 16.6667%;">주문 일자</td>
										<td style="width: 16.6667%;">주문 번호</td>
										<td style="width: 16.6667%;">주문금액(수량)</td>
										<td style="width: 16.6667%;">배송비</td>
										<td style="width: 16.6667%;">최종 결제금액</td>
									</tr>
									<tr>
										<td style="width: 16.6667%;">개쩌는 후드티</td>
										<td style="width: 16.6667%;">2020.01.23</td>
										<td style="width: 16.6667%;">2020012312345</td>
										<td style="width: 16.6667%;">65,000원(1개)</td>
										<td style="width: 16.6667%;">2,500원</td>
										<td style="width: 16.6667%;">67,500원</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		결제정보
			<table border="1" height="100" style="width: 100%;">
				<tbody>
					<tr>
						<td style="width: 875px;">
							<li>
								결제 수단 
                           		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              	무통장입금
							</li>
							<li>
								입금 기간
                           		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              	가상계좌 발급 후 3시간 이내
							</li>
							<li>
								결제 금액
                           		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              	67,500원
							</li>
                          	<li>
                            	결제완료 / 상품준비중 / 배송중 / 배송완료
                          	</li>
						</td>
					</tr>
				</tbody>
			</table>
			배송지 정보
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 875px;">
						<li>
							이름 <input type="text" id="name" name="name" value="이름" style="margin-left:32px">
						</li>
						<li>
							휴대전화 <input type="text" id="phone" name="phone" value="휴대전화">
						</li>
						<li>
							배송주소 <input type="text" id="zipcode" name="zipcode" value="우편번호">
							<br/>
							<input type="text" id="addr1" name="addr1" size="50" value="주소1" style="margin-left:93px">
							<br/>
							<input type="text" id="addr2" name="addr2" size="50" value="주소2" style="margin-left:93px">
						</li>
						<li>
							배송 메모 <br/>
							<textarea cols="50" rows="10" name="content" style="margin-left:93px" readonly>$${불러올내용 }</textarea>
						</li>
					</td>
				</tr>
			</tbody>
		</table>
		<p align="center">
			<input type="button" id="submitPay" name="submitPay" value="메인으로" onclick="">
			<input type="button" id="submitPay" name="submitPay" value="주문내역" onclick="">
		</p>
	</div>
</div>
</body>
</html>