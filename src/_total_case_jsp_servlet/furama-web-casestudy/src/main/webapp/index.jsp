<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/2/2022
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap\bootstrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="\bootstrap\bootstrap\css\style.css">
    <title>FURAMA HOME</title>
</head>
<body>
<div class="container-fluid">
    <header>
        <nav class="navbar navbar-expand-lg navbar-light first-nav">
            <div class="logo col-md-2">
                <a class="navbar-brand navbar-expand-lg" href="#"><img src="img/logo-furama.png" height="68"
                                                                       width="auto"
                                                                       alt="#"></a>
            </div>
            <div class="col-md-8 address-hotline">
                <div style="display: inline; float: left" class="col-md-7 col-sm-6 col-12" id="address">
                    <p>103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam</p>
                    <p>7.0 km từ Sân bay Quốc tế Đà Nẵng</p>
                </div>
                <div style="display: inline; float: left" class="col-md-5 col-sm-6 col-12" id="hotline">
                    <p>Hotline: 84-236-3847 333/888</p>
                    <p>Fax: 84-236-3847 999</p>
                    <p>Email: reservation@furamavietnam.com</p>
                </div>
            </div>
            <div class="admin-name col-md-2" style="padding-right: 0">
                <a href="#" style="font-size: 1.2em ; font-weight: 500">THIÊN DUY</a>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg navbar-light bg-light second-nav col-md-12 col-sm-12">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div style="margin-left: 5%" class="col-md-7 col-sm-12 collapse navbar-collapse first-sub-nav " id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownEmployee" role="button" data-toggle="dropdown" aria-expanded="false">
                            Employee
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownEmployee">
                            <a class="dropdown-item" href="/employee">View Customer</a>
                            <a class="dropdown-item" href="/employee?action=create">Creating employee</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCustomer" role="button" data-toggle="dropdown" aria-expanded="false">
                            Customer
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownCustomer">
                            <a class="dropdown-item" href="/customer">View Customer</a>
                            <a class="dropdown-item" href="/customer?action=create">Creating customer</a>
<%--                            <div class="dropdown-divider"></div>--%>
<%--                            <a class="dropdown-item" href="#">Something else here</a>--%>
                        </div>
                    </li>
                    <li class="nav-item dropdown col-sm-12 col-md-6">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownService" role="button" data-toggle="dropdown" aria-expanded="false">
                            Service
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownService">
                            <a class="dropdown-item" href="/service">View Service</a>
                            <a class="dropdown-item" href="/service?action=create">Creating Service</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownContract" role="button" data-toggle="dropdown" aria-expanded="false">
                            Contract
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownContract">
                            <a class="dropdown-item" href="#">View Contract</a>
                            <a class="dropdown-item" href="#">Creating Contract</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="search col-md-3 col-sm-6 second-sub-nav">
                <form class="form-inline">
                    <input class="form-control mr-sm-2 search-place" type="search" placeholder="Search"
                           aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0 search-button" type="submit">SEARCH</button>
                </form>
            </div>
        </nav>
    </header>
    <div class="home-body">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/img/caros3.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/img/caros2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/img/caros1.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators"
                    data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators"
                    data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </button>
        </div>
    </div>
</div>
<div class="container">
    <div class="row infor" style="clear: both">
        <div class="col-sm-3 col-6 div-card">
            <div class="card">
                <img class="card-img-top" src="img/servic1.jpg" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="margin-bottom: 0">Furama spa</h5>
                    <p class="card-text">Trải nghiệm dịch vụ spa miễn phí..</p>
<%--                    <a href="#" class="btn btn-primary">See more</a>--%>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-6 div-card">
            <div class="card">
                <img class="card-img-top" src="img/servic2.jpg" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="margin-bottom: 0">Furama space</h5>
                    <p class="card-text">Không gian tuyệt vời tận hưởng..</p>
<%--                    <a href="#" class="btn btn-primary">See more</a>--%>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-6 div-card">
            <div class="card">
                <img class="card-img-top" src="img/servic3.jpg" alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="margin-bottom: 0">Furama food</h5>
                    <p class="card-text">Đưa nghệ thuật vào ẩm thực..</p>
<%--                    <a href="#" class="btn btn-primary">See more</a>--%>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-6 div-card">
            <div class="card">
                <img class="card-img-top" src="img/servic4.jpg"
                     alt="Card image">
                <div class="card-body">
                    <h5 class="card-title" style="margin-bottom: 0">Furama pool party</h5>
                    <p class="card-text">Tận hưởng mùa hè bên bể bơi vô cực..</p>
<%--                    <a href="#" class="btn btn-primary">See more</a>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <nav class="navbar navbar-expand-lg navbar-light first-nav">
        <div class="logo col-md-2">
            <a class="navbar-brand navbar-expand-lg" href="#"><img src="img/logo-furama.png" height="68"
                                                                   width="auto"
                                                                   alt="#"></a>
        </div>
        <div class="col-md-8 address-hotline">
        <div style="display: inline; float: left" class="col-md-7 col-sm-6" id="address-footer">
            <p>103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam</p>
            <p>7.0 km từ Sân bay Quốc tế Đà Nẵng</p>
        </div>
        <div style="display: inline; float: left" class="col-md-5 col-sm-6" id="hotline-footer">
            <p>Hotline: 84-236-3847 333/888</p>
            <p>Fax: 84-236-3847 999</p>
            <p>Email: reservation@furamavietnam.com</p>
        </div>
        </div>
    </nav>
</footer>
<script src="bootstrap\bootstrap\js\jquery-3.6.0.min.js"></script>
<script src="bootstrap\bootstrap\js\bootstrap.min.js"></script>
</body>
</html>
</html>
