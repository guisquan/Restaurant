<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <link rel="stylesheet" href="../css/swiper-4.1.6.min.css">
    <style type="text/css">
        .swiper-container {
            width: 100%;
            height: 400px;
        }

        img {
            /*margin: 0 auto;*/
            display: block;
            width: 100%;
            height: auto;
            border-radius: 15px;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
    </style>
</head>
<body>
<div class="swiper-container">
    <div class="swiper-wrapper">
        <c:forEach items="${sessionScope.recommendGoods}" var="goods">
            <div class="swiper-slide">
                <a href="javascript:void(0);" onclick="doSomething(${goods.gid})">
                    <c:choose>
                        <c:when test="${goods.gStyle eq 2}">
                            <em style="color: red">热销：</em>
                        </c:when>
                        <c:when test="${goods.gStyle eq 3}">
                            <em>推荐：</em>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                    <em>${goods.gName}</em>
                    <img src="${pageContext.request.contextPath}/${goods.gImage}" alt="${goods.gName}">
                </a>
            </div>
        </c:forEach>
    </div>

    <!-- 如果需要导航按钮 -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>

    <div class="swiper-pagination"></div>
</div>
<script src="../js/swiper-4.1.6.min.js"></script>
<script>
    var mySwiper = new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 50,
        // direction: 'vertical',
        loop: true,
        // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        breakpoints: {
            1024: {
                slidesPerView: 4,
                spaceBetween: 40,
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 30,
            },
            640: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
            320: {
                slidesPerView: 1,
                spaceBetween: 10,
            }
        },
        autoplay: true
    });
</script>
</body>
</html>


