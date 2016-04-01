<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">

    <title>Networks<c:if test = "${param.page != 'index'}"> &raquo; ${param.page}</c:if></title>

    <link rel="stylesheet" media="screen" href="<c:url value="/resources/css/screen.css"/>">

    <c:if test = "${param.page == 'index'}">
    <!-- script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular.js"></script -->
    <script src="<c:url value="/resources/js/app.js"/>"></script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCE41BGnnoE6BvD8NNAKJ-OhrOhyb2rSnw&callback=init"></script>
    </c:if>
</head>
<body>

<header>
    <section id="top">
        <h1>Internet Programming</h1>
        <c:choose>
            <c:when test="${param.page == 'index'}">
                <form action="" method="get">
                    <label for="txt_cityName">WiFi around</label>
                    <input type="text" name="city" value="Leuven" id="txt_cityName" autocomplete="off">
                    <input type="submit" value="&#xf18e;">
                </form>
                <a href="<c:url value="/add"/>"><i class="fa fa-plus-circle"></i><span>Add WiFi</span></a>
            </c:when>
            <c:otherwise>
                <a href="javascript:history.go(-1)"><i class="fa-arrow-circle-o-left"></i><span>Go back</span></a>
            </c:otherwise>
        </c:choose>
    </section>
</header>