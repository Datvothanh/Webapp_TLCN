<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active" style="z-index: 1">
            <img src="${pageContext.request.contextPath}/public/imgs/ad/1.PNG" class="d-block w-100" alt="picture_1">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/public/imgs/ad/2.PNG" class="d-block w-100" alt="picture_2">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/public/imgs/ad/3.PNG" class="d-block w-100" alt="picture_3">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-target="#carouselExampleFade" data-slide="prev"
            style="opacity: 0;">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-target="#carouselExampleFade" data-slide="next"
            style="opacity: 0;">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </button>
</div>