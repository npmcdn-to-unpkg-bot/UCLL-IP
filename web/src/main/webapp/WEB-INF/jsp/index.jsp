<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">

    <title>Internet Programming</title>

    <link rel="stylesheet" media="screen" href="<c:url value="/resources/css/screen.css"/>">

    <!-- script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular.js"></script -->
    <script src="<c:url value="/resources/js/app.js"/>"></script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCE41BGnnoE6BvD8NNAKJ-OhrOhyb2rSnw&callback=init"></script>
</head>
<body>

<header>
    <section id="top">
        <h1>Internet Programming</h1>

        <form action="" method="get">
            <label for="txt_cityName">WiFi around</label>
            <input type="text" name="city" value="Leuven" id="txt_cityName" autocomplete="off">
            <input type="submit" value="&#xf18e;">
        </form>
        <a href="#"><i class="fa fa-plus-circle"></i><span>Add WiFi</span></a>
    </section>
</header>

<main>
    <section id="map">
        The Mexicans will pay for the wall.
    </section>

    <section id="cards">
        <c:forEach var="network" items="${networks}">
            <article class="card">
                <header>
                    <h2><a href="#">${network.ssid}</a></h2>

                    <p class="lock">
                        <c:choose>
                            <c:when test="${network.type == 'OPEN'}">
                                <i class="fa fa-unlock-alt"></i>
                            </c:when>
                            <c:when test="${network.type == 'PROTECTED'}">
                                <i class="fa fa-lock"></i>
                            </c:when>
                        </c:choose>
                    </p>
                </header>
                <section>
                    <h3>Address</h3>
                    <a class="edit" href="#">&#xf044;</a>

                    <p class="address">
                        <c:if test="${not empty network.location.name}">
                            <em>${network.location.name}</em><br>
                        </c:if>
                            ${network.location.address}
                        <c:if test="${not empty network.location.crossStreet}">
                            (${network.location.crossStreet})
                        </c:if>
                        <br>
                            ${network.location.zip} ${network.location.city}
                    </p>
                </section>
                <c:if test="${network.type == 'PROTECTED'}">
                <section class="passwords">
                    <h3>Password</h3>
                    <a class="edit" href="#">&#xf044;</a>
                    <ul>
                        <c:forEach var="password" items="${network.passwords}">
                        <li>${password.password}
                            <form action="#" method="post">
                                <input type="submit" name="upvote" value="&#xf164;">
                                <span>${password.score}</span>
                                <input type="submit" name="downvote" value="&#xf165;">
                            </form>
                        </li>
                        </c:forEach>
                    </ul>
                </section>
                </c:if>
                <section>
                    <h3>Comments</h3>

                    <p>
                        <a href="#">${network.comments.size()} comment${network.comments.size() == 1 ? '' : 's'} on this WiFi</a>
                    </p>
                </section>

            </article>
        </c:forEach>
    </section>

    <!--section id="field">
        <form action="" method="post">
            <h4>WiFi details</h4>

            <p class="description">
                Enter the WiFi details as precisely as possible. You can always edit this later, but goed begonnen is
                half
                gewonnen.
            </p>

            <h5>Location</h5>
            <label for="txt_locName">Venue name</label>
            <input type="text" name="txt_locName" id="txt_locName" placeholder="Melvin's Mighty Meatballs">

            <div class="left">
                <label for="txt_locStreet">Address</label>
                <input type="text" name="txt_locStreet" id="txt_locStreet" placeholder="Greasy Alley 69">
                <label for="txt_locCode">Postal Code</label>
                <input type="text" name="txt_locCode" id="txt_locCode" placeholder="42069">
                <label for="txt_locCountry">Country</label>
                <input type="text" name="txt_locCountry" id="txt_locCountry" placeholder="US of Amurucu">
            </div>
            <div class="right">
                <label for="txt_locCross">Cross Street</label>
                <input type="text" name="txt_locCross" id="txt_locCross" placeholder="at Fiesty Foodcorner">
                <label for="txt_locCity">Cross Street</label>
                <input type="text" name="txt_locCity" id="txt_locCity" placeholder="Blaze Town">
            </div>

            <h5>Access Point</h5>

            <div class="left">
                <label for="txt_apSsid">SSID</label>
                <input type="text" name="txt_apSsid" id="txt_apSsid" placeholder="Mighty WiFi">
            </div>
            <div class="right">
                <label for="txt_apPasscode">Password</label>
                <input type="text" name="txt_apPasscode" id="txt_apPasscode" placeholder="SuperSecret1234">
            </div>
            <input type="checkbox" name="box_apProtected" id="box_apProtected">
            <label for="box_apProtected">Requires password</label>

            <div class="confirm">
                <input type="button" class="cancel" value="Cancel">
                <input type="submit" value="Save">
            </div>
        </form>
    </section> -->
</main>
<footer>
    <a href="#">Nederlands</a>
</footer>
<noscript>
    JavaScript is absolutely required in order to use this web service.
</noscript>
</body>
</html>