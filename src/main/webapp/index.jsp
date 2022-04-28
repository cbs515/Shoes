<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<head>

    <title>ShoesHub eCommerce HTML CSS Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon"href="assets/img/apple-icon.png" >
    <link rel="shortcut icon" type="image/x-icon" >

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>



<body>

<%@include file="/header.jsp"%>


    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="2글자이상 입력하세요">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">

                            <!--메인 대문 사진 변경위치-->
                            <img class="img-fluid" src="assets/img/banner_121.jpg" alt="">
                        </div>

                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>ShoesHub</b> Best Item</h1>
                                <h3 class="h2">What's a popular product?</h3>
                                <p>
                                   Do you want to know what the shoesHub people bought the most this year?<br>
                                   If so, please click here. There are a lot of cool and diverse products !
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item" >
                <div class="container" >
                    <div class="row p-5" >
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="assets/img/ban11.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1 text-success"><b>D.LAVAN</b><Br>Cow Full Grain Derby Shoes</h1>
                                
                                
                                <p>
                                    These shoes are lightweight and cushioning, <br>so your feet don't get tired even after wearing them for a long time.<br>
                                    Enjoy carefully designed male shoes !
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="assets/img/banner_11.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                 <h1 class="h1 text-success"><b>Air Jordan</b> University Blue</h1>
                                <h3 class="h2">You Can Get It Right Now</h3>
                                <p>
                                    Walk around the streets in this fresh color of college freshmen.<br>
									No one can be more stylish than you. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
            <br>
                <h1 class="h1"><strong>MD'S PICK</strong></h1>
                <p>
                    ShoesHub MD's recommendation
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="shop.jsp?brand=반스"><img src="assets/img/vans.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3"><img src="assets/img/vans_logo.png"></h5><br>
                <h6 class="text-center mt-3 mb-3">코어클래식 OLD SKOOL 올드스쿨</h6>
                <!-- <p class="text-center"><a class="btn btn-success">보러가기</a></p> -->
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="shop.jsp?brand=컨버스"><img src="assets/img/converse.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3"><img src="assets/img/converse_logo.png"></h2><br>
                <h6 class="text-center mt-3 mb-3">척테일러 올스타 코어</h6>
                <!-- <p class="text-center"><a class="btn btn-success">Go Shop</a></p> -->
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="shop.jsp?brand=나이키"><img src="assets/img/nike.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3"><img src="assets/img/nike_logo.png"></h2><br>
                <h6 class="text-center mt-3 mb-3">블레이저 로우 77 점보</h6>
                <!-- <p class="text-center"><a class="btn btn-success">Go Shop</a></p> -->
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto"><br>
                    <h1 class="h1"><strong>Trend ON</strong></h1>
                    <p>
                        Trendy products chosen by fashion people
                    </p>
                    <br>
                </div>
            </div>
            
            
            <div class="row">
                <div class="col-16 col-md-3 mb-4">
                    <div class="card h-100">
                        <a href="shop.jsp">
                            <img src="assets/img/s1.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li class="text-muted text-right">69,000</li>
                            </ul>
                            <a href="shop.jsp" class="h2 text-decoration-none text-dark"><strong>호킨스</strong> <h6>플레인 로퍼</h6></a>
                            <p class="card-text"><small>
                            <Br><Br>
                            <b>가장 심플한 디자인의 페니로퍼, <Br>
                            	유광타입의 천연 가죽을 사용하여 은은하고 고급스러운 색감을 보여주며 정장, 캐주얼 모두에 어울리는 제품입니다.
                            <!-- 캐주얼과 정장 등 다양한 착장에 활용가능한 남성구두입니다. -->
                            </b></small>
                            </p>
                            
                        </div>
                    </div>
                </div>
                
                <div class="col-16 col-md-3 mb-4">
                    <div class="card h-100">
                        <a href="shop.jsp">
                            <img src="assets/img/s2.jpg" class="card-img-top" alt="...">
                        </a>
                         <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li class="text-muted text-right">65,500</li>
                            </ul>
                            <a href="shop.jsp" class="h2 text-decoration-none text-dark"><strong>BSQTBYCLASSY</strong> <h6>887 뮌헨 독일군 스니커즈</h6></a>
                            <p class="card-text"><small>
                            <Br><br>
                            <b><!-- 일반적인 가죽 대비 30%이상 부드러운 인조가죽 사용으로 장시간 착용시에도  -->날렵한 쉐입의 스니커즈,<br> 
                      	      가볍고 변형이 적은 러버솔이 적용되어 편안함과 안정성을 자랑하며 내구성이 상대적으로 우수한 제품입니다.</b></small>
                            </p>
                            
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-16 col-md-3 mb-4">
                    <div class="card h-100">
                        <a href="shop.jsp">
                            <img src="assets/img/s4.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li class="text-muted text-right">99,000</li>
                            </ul>
                            <a href="shop.jsp" class="h2 text-decoration-none text-dark"><strong>푸마</strong> <h6>스웨이드 클래식 XXI</h6></a>
                            <p class="card-text"><small>
                            <Br><br>
                            <b>현대적인 감성을 더해 출시, 
                            <br>톡톡 튀는 다양한 컬러감으로 미니멀룩과 베이직룩은 물론 빈티지, 키치함과도 어울리는 아이템입니다.</b></small>
                            </p>
                            
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-16 col-md-3 mb-4">
                    <div class="card h-100">
                        <a href="shop.jsp">
                            <img src="assets/img/s3.jpg" class="card-img-top" alt="...">
                        </a>
                         <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li class="text-muted text-right">79,200</li>
                            </ul>
                            <a href="shop.jsp" class="h2 text-decoration-none text-dark"><strong>프로스펙스</strong> <h6>오리지널 DAY TRIP 101</h6></a>
                            <p class="card-text"><small>
                            <Br><br>
                            <b><!-- 미드솔 앞, 중간, 뒤 3피스 EVA스펀지 경도를 다르게 적용하여 도보 시 편안한 착화감을 제공합니다. -->
                            스펀지 경도를 그래픽으로 표현, <Br>
                            기능과 디자인의 일체성을 강조했으며 아웃솔러버에 헤링본 패턴을 적용하여 뛰어난 접지력을 구현했습니다.</small>
                            </p>
                            
                        </div>
                    </div>
                </div>
                
                
                <br>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->


    <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">ShoesHub</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            64, Sanggye-ro, Nowon-gu, Seoul, Republic of Korea
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:02-1234-5678">02-1234-5678</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:ShoesHub@company.com">ShoesHub@company.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="shop.html">Men's Shoes</a></li>
                        <li><a class="text-decoration-none" href="shop.html">Women's Shoes</a></li>
                        <li><a class="text-decoration-none" href="shop.html">kids Shoes</a></li>
                        <li><a class="text-decoration-none" href="shop.html">Brand</a></li>

                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="about.html">About Us</a></li>
                        <li><a class="text-decoration-none" href="about.html">Shop Locations</a></li>
                        <li><a class="text-decoration-none" href="about.html">FAQs</a></li>
                        <li><a class="text-decoration-none" href="about.html">Contact</a></li>
                    </ul>
                </div>

            </div>

            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">

                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            Copyright &copy; 2021 ShoesHub
                            | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->


</body>
</html>