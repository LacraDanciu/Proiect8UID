<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 1/5/2018
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/resources/css/font-awesome5/fontawesome-all.css" type="text/css" rel="stylesheet"
          media="screen,projection"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/resources/js/materialize.js"></script>
    <script src="/resources/js/init.js"></script>
    <%@ page isELIgnored="false" %>
    <title>View space</title>

</head>
<body>
<c:choose>
    <c:when test="${isLogged == true}">
        <jsp:include page="navbar-after-login.jsp"></jsp:include>
    </c:when>
    <c:when test="${isLogged == false}">
        <jsp:include page="navbar-before-login.jsp"></jsp:include>
    </c:when>
</c:choose>
<h1 style="width: 100%; text-align: center;" class="header">${cs.name}</h1>
<div class="row">
    <iv class="w3-content w3-display-container">
        <div class="carousel carousel-slider center-align customCarusel" data-indicators="true">
            <a class="carousel-item center-align"><img class ="customCarImg"
                    src="/resources/images/genSp1.jpg"></a>
            <a class="carousel-item center-align"><img class ="customCarImg"
                    src="/resources/images/genSp2.jpg"></a>
            <a class="carousel-item center-align"><img class ="customCarImg"
                    src="/resources/images/genSp3.jpg"></a>
            <a class="carousel-item center-align"><img class ="customCarImg"
                    src="/resources/images/genSp4.jpg"></a>
            <a class="carousel-item center-align"><img class ="customCarImg"
                    src="/resources/images/genSp5.jpg"></a>
        </div>
        <div style="width:100%;overflow: hidden;clear:both;padding-left: 100px;">
            <div style="width:60%;float:left;">


                <div class="row">
                <span class="col s12">
                    <ul class="tabs" style="display: flex;">
                        <li class="tab col s3"><a class="active" href="#Overview">Overview</a></li>
                        <li class="tab col s3"><a href="#Amenities">Amenities</a></li>
                        <li class="tab col s3"><a href="#Prices">Prices</a></li>
                        <li class="tab col s3"><a href="#Map">Map</a></li>
                        <li class="tab col s3"><a href="#Reviews">Reviews</a></li>
                    </ul>
                </span>
                    <div id="Overview" class="col s12" style="margin-top: 20px;">
                        ${cs.description}
                    </div>
                    <div id="Amenities" class="col s12" style="margin-top: 20px;">
                        Amenities list
                        <ul class="collection">
                            <c:forEach items="${cs.generalAmenities}" var="cc">
                                <li class="collection-item">${cc}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div id="Prices" class="col s12" style="margin-top: 20px;">
                        <p>Prices section</p>
                        <c:forEach items="${cs.officeList}" var="off">
                            <div class="col s12 m7">
                                <div class="card horizontal">
                                    <div class="card-stacked">
                                        <div class="card-content">
                                            <p>${off.name}</p>
                                        </div>
                                        <div class="card-action">
                                            <a>Price: ${off.price}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                    <div id="Map" class="col s12">

                        <div>
                            <div id="map" class="center" style="width:100%; height:400px; padding-left:100px">
                                <script>
                                    function myMap() {
                                        var mapOptions = {
                                            center: new google.maps.LatLng(46.770439, 23.591423),
                                            zoom: 16,
                                        }
                                        var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                                    }
                                </script>
                                <script async defer
                                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCt-g3ZM2QSUL_ABCvv1msN6LKfcMyx2Q0&callback=myMap">
                                </script>
                            </div>
                        </div>

                    </div>


                    <div id="Reviews" class="col s12">
                        Reviews section
                        <div class="row">
                            <div class="col s12">
                                <ul class="tabs">
                                    <li class="tab col s3"><a class="active" href="#test1">Reviews</a></li>
                                    <li class="tab col s3"><a href="#test2">Tips</a></li>
                                    <li class="tab col s3"><a href="#test3">Q&A</a></li>
                                </ul>
                            </div>
                            <div id="test1" class="col s12">
                                <p>Post a review</p>
                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">star</i>
                                            First review
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">star</i>
                                            Second review
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="btn btn-floating btn-large cyan pulse"><i class="material-icons">edit</i></a>
                                </div>
                            </div>

                            <div id="test2" class="col s12">
                                <p>Post a tip</p>

                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">lightbulb_outline</i>
                                            First tip
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">lightbulb_outline</i>
                                            Second tip
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="btn btn-floating btn-large cyan pulse"><i class="material-icons">edit</i></a>
                                </div>

                            </div>

                            <div id="test3" class="col s12">
                                <p>Post a question or help someone with an answer</p>

                                <ul class="collapsible" data-collapsible="accordion">
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">question_answer</i>
                                            First question
                                            <span class="badge">User 1</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                    <li>
                                        <div class="collapsible-header">
                                            <i class="material-icons">question_answer</i>
                                            Second question
                                            <span class="badge">User 2</span></div>
                                        <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                                    </li>
                                </ul>
                                <div class="right-align">
                                    <a class="btn btn-floating btn-large cyan pulse"><i class="material-icons">edit</i></a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div style="width:30%;float:left; border: 2px ridge green; border-radius: 50px; margin-top: 60px;">
                <div style="align:center;">
                    <a style="margin-top: 30px; margin-left: 20px; margin-right: 20px; width: 90%;"
                       class="waves-effect waves-light btn-large"
                       href="${pageContext.request.contextPath}/scheduleTour/1"
                       id="scheduleTour"><i class="material-icons left">assignment</i>Schedule Tour</a>

                    <a style="margin-top: 30px; margin-left: 20px; margin-right: 20px; width: 90%;"
                       class="waves-effect waves-light btn-large"
                       href="${pageContext.request.contextPath}/messageSpace/1"
                       id="messageSpace"><i class="material-icons left">message</i>Message space</a>

                    <a style="margin-top: 100px; margin-left: 20px; margin-right: 20px; margin-bottom:30px;
                    width: 90%;" class="waves-effect waves-light btn-large disabled "
                       id="shareSpace">Share space</a>


                    <div style=" margin-bottom: 20px;">
                        <button id="fb" style="background-color: transparent; border: none;">
                            <img style="width: 70px; height:70px; margin-left: 30px; margin-right: 20px;
                            border: 2px solid green; border-radius: 20px;" src="/resources/images/fb-art.png"
                                 alt="Facebook">
                        </button>

                        <button id="insta" style="background-color: transparent; border: none;">
                            <img style="width: 70px; height:70px; margin-left: 10px; margin-right: 10px;
                            border: 2px solid green; border-radius: 20px;" src="/resources/images/instagram-logo.jpg"
                                 alt="insta">
                        </button>

                        <button id="gmail" style="background-color: transparent; border: none;">
                            <img style="width: 70px; height:70px; margin-left: 10px; margin-right: 10px;
                            border: 2px solid green; border-radius: 20px;" src="/resources/images/gmail.png"
                                 alt="gmail">
                        </button>
                    </div>

                </div>

            </div>
        </div>
    </iv>
</div>

<jsp:include page="footer.jsp"></jsp:include>


<script language="JavaScript">
    $(document).ready(function () {
        $('.carousel.carousel-slider').carousel({fullWidth: true});
        $('ul.tabs').tabs();
    });
</script>
</body>
</html>