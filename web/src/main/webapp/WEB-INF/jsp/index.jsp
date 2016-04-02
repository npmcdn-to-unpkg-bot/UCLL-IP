<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="parts/header.jsp">
    <jsp:param name="page" value="index"/>
</jsp:include>

<section id="map">
    Loading the map...
</section>

<section id="cards" data-masonry='{ "itemSelector": "article" }'>
    <c:forEach var="network" items="${networks}">
        <article data-lat="${network.location.lat}" data-lon="${network.location.lon}">
            <header>
                <h2>${network.ssid}</h2>
                <p>
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
            <footer>
                <a title="Add comment" href="#">0 comments on this network <i class="fa fa-pencil"></i></a>
            </footer>
        </article>
    </c:forEach>
</section>

<jsp:include page="parts/footer.jsp"/>