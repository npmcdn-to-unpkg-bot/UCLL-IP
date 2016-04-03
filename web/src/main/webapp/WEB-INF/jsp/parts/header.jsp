<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Networks<c:if test="${param.page != 'index'}"> &raquo; ${param.page}</c:if></title>

    <link rel="stylesheet" media="screen" href="<c:url value="/resources/css/screen.css"/>">

    <c:choose>
        <c:when test="${param.page == 'index'}">
            <script src="<c:url value="/resources/js/app.js"/>"></script>
            <script src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
            <script async defer
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCE41BGnnoE6BvD8NNAKJ-OhrOhyb2rSnw&callback=init"></script>
        </c:when>
        <c:when test="${param.page == 'Add network' || param.page == 'Edit network'}">
            <script src="<c:url value="/resources/js/wifi.js"/>"></script>
        </c:when>
    </c:choose>
</head>
<body>
<header>
    <section id="top">
        <h1><a href="<c:url value="/"/>"><s:message code="lbl.Networks"/></a></h1>
        <c:if test="${param.page == 'index'}">
            <a href="<c:url value="/add"/>"><i class="fa fa-plus-circle"></i> Add network</a>
            <form action="" method="get">
                <label for="txt_cityName">near the city of</label>
                <input type="text" name="city" value="${param.city}" id="txt_cityName" autocomplete="off">
                <input type="submit" class="fa" value="&#xf040;">
            </form>
        </c:if>
    </section>
</header>

<main>