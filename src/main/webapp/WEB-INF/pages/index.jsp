<%--
  Created by IntelliJ IDEA.
  User: cata_
  Date: 12/29/2017
  Time: 2:32 PM
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
    <LINK rel="stylesheet" href="/resources/css/home.css" type="text/css">

    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="/resources/js/materialize.js"></script>
    <script src="/resources/js/init.js"></script>

    <%@ page isELIgnored="false" %>

    <title>Home page</title>

</head>
<body>

<jsp:include page="navbar-before-login.jsp"></jsp:include>

<div class="row">

    <div class="messages center-align">
        <i class="teal-text" style="font-size: 30px;">${message}</i>
        <br>
    </div>

    <iv class="w3-content w3-display-container">
        <%--in div-ul asta is coloanele--%>
        <div style=" padding-left:190px;">
            <h3>Coworking spaces</h3>
        </div>

        <c:set var="count" value="1" scope="page"/>
        <div class="carousel">
            <c:forEach items="${cowSp}" var="cs">
                <div class="carousel-item carousel-item-adjustment">
                    <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img src="/resources/images/genSp${count}.jpg" width="300" height="158">
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">${cs.name}<i
                                    class="material-icons right">more_vert</i></span>
                            <p><a href="${pageContext.request.contextPath}/space/view/${count}" id="logo">View Space</a>
                            </p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">${cs.name}<i class="material-icons right">close</i></span>
                            <p>${cs.description}</p>
                        </div>
                    </div>

                </div>
                <c:set var="count" value="${count + 1}" scope="page"/>
            </c:forEach>
        </div>
        <div class="center-align">
            <a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/allSpaces.html">See all
                spaces</a>
        </div>

</div>

<div class="center-align" style="padding-bottom:40px">
    <h3>Where you can find us:</h3>
    <div id="map" style="width:940px; height:400px; margin: 0 auto 0 auto; padding-bottom: 40px">
        <script>
            function myMap() {
                var myLatLng = {lat: 46.770439, lng: 23.591423};
                var mapOptions = {
                    center: myLatLng,
                    zoom: 8,
                }

                var map = new google.maps.Map(document.getElementById("map"), mapOptions);

                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    title: ''
                });
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCt-g3ZM2QSUL_ABCvv1msN6LKfcMyx2Q0&callback=myMap">
        </script>
    </div>
</div>
<br>
<br>
<div class="row">
    <div class="center-align">
        <div class="col s4">
            <div class="center card-panel">
                <img src="/resources/images/tips-tricks.png" width="300" height="225">

                <p>Leave us a tip about your experience!</p>
            </div>
        </div>
        <div class="col s4">
            <div class="center card-panel">
                <img src="/resources/images/review.jpg" width="300" height="225">

                <p>Write a review...</p>
            </div>
        </div>
        <div class="col s4">
            <div class="center card-panel">
                <img src="/resources/images/qa.jpg" width="300" height="225">

                <p>Or maybe ask some questions?</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>
    $(document).ready(function () {
        $('.carousel').carousel();
    });
</script>

<script>
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
        showDivs(slideIndex += n);
    }

    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("mySlides");
        if (n > x.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = x.length
        }
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex - 1].style.display = "block";
    }
</script>

<script language="JavaScript">
    $('.tap-target').tapTarget('open');
    $('.tap-target').tapTarget('close');
</script>

</body>

</html>