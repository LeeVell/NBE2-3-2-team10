<%@ page import="org.team10.washcode.ResponseDTO.order.OrderlistResDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래 내역</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100">
<!-- 상단 헤더 -->
<div class="max-w-md mx-auto bg-white shadow-md rounded-lg mt-0">
    <div class="flex items-center justify-between p-4 border-b">
        <button class="text-gray-500">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
            </svg>
        </button>
        <h1 class="text-lg font-bold">거래 내역</h1>
        <div></div>
    </div>

    <!-- 필터 섹션 -->
    <div class="flex justify-around text-blue-500 py-2 border-b">
        <!-- 1개월 필터 -->
        <a href="/api/orders/payment/<%= request.getAttribute("userId") %>?filter=1"
           class="cursor-pointer font-medium <%= "1".equals(request.getAttribute("filter")) ? "text-blue-700 font-bold" : "" %>">
            1개월
        </a>
        <!-- 3개월 필터 -->
        <a href="/api/orders/payment/<%= request.getAttribute("userId") %>?filter=3"
           class="cursor-pointer font-medium <%= "3".equals(request.getAttribute("filter")) ? "text-blue-700 font-bold" : "" %>">
            3개월
        </a>
        <!-- 6개월 필터 -->
        <a href="/api/orders/payment/<%= request.getAttribute("userId") %>?filter=6"
           class="cursor-pointer font-medium <%= "6".equals(request.getAttribute("filter")) ? "text-blue-700 font-bold" : "" %>">
            6개월
        </a>
    </div>

    <!-- 거래 내역 리스트 -->
    <%
        List<OrderlistResDTO> orders =(List<OrderlistResDTO>) request.getAttribute("orders");
        if (orders != null) {
            for (OrderlistResDTO order : orders) {
    %>
    <div class="p-4">
        <div class="bg-gray-50 p-4 rounded-lg shadow mb-4">
            <div class="flex justify-between items-center">
                <span class="text-gray-700"><%=order.getCreated_at()%></span>
<%--                <span class="text-blue-500 font-medium">99,999원</span>--%>
            </div>
            <p class="text-gray-500 mt-1"><%=order.getShop_name()%></p>
            <a href="/api/orders/payment/<%= request.getAttribute("userId") %>/<%= order.getPickup_id() %>"
               class="text-blue-500 mt-2 inline-block">
                상세보기
            </a>
        </div>
    </div>
    <%
            }
        }
    %>
</div>

<footer class="fixed bottom-0 left-0 right-0 bg-white shadow p-4 flex justify-around overflow-x-auto mx-auto max-w-[448px] rounded-t-lg">
    <button class="flex flex-col items-center text-blue-500" onclick="location.href='/main'">
        <img src = "./footer/Home.svg" class = "h-6 w-6"/>
        <span class="text-black text-[10pt] mt-1">홈</span>
    </button>
    <button class="flex flex-col items-center text-gray-500" onclick="location.href='/orderHistory'" >
        <img src = "./footer/Bag.svg" class = "h-6 w-6"/>
        <span class="text-black text-[10pt] mt-1">주문내역</span>
    </button>
    <button class="flex flex-col items-center text-gray-500" onclick="location.href='/mypage'">
        <img src = "./footer/Star.svg" class = "h-6 w-6"/>
        <span class="text-black text-[10pt] mt-1">내 정보</span>
    </button>
</footer>
</div>
</body>
</html>