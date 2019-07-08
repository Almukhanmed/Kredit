<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Lounge Kredit</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
    body,h1,h5 {font-family: "Raleway", sans-serif}
    body, html {height: 100%}
    .bgimg {
        opacity:0.8;
        background-image: url('/resources/images/black-and-white-paris-cafe-bar-georgia-fowler.jpg');
        min-height: 100%;
        background-position: center;
        background-size: cover;


    }

</style>
<body>

<div class="bgimg w3-display-container w3-text-white">
    <div class="w3-display-middle w3-jumbo">
        <p>Profile Page</p>
    </div>
    <div class="w3-display-topleft w3-container w3-xlarge">
        <p><button onclick="document.getElementById('menu').style.display='block'" class="w3-button w3-black">menu</button></p>
        <p><button onclick="document.getElementById('info').style.display='block'" class="w3-button w3-black">my info</button></p>
        <p><button onclick="document.getElementById('history').style.display='block'" class="w3-button w3-black">history</button></p>
        <p><button class="w3-button w3-black"><a href="/logout">log out</a></button></p>
    </div>
    <div class="w3-display-bottomleft w3-container">
        <p class="w3-xlarge">monday - friday 10-23 | saturday 14-02</p>
    </div>
</div>

<!-- Menu Modal -->
<div id="menu" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black w3-display-container">
            <span onclick="document.getElementById('menu').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
            <h1>Starters</h1>
        </div>
        <div class="w3-container">
<c:forEach items="${food}" var="food">
    <form action="/addUserFood" method="post">
    <h5>${food.name}<b>${food.price}</b>
        <input type="hidden" name="fid" value="${food.id}"><input type="hidden" name="uid" value="${user.id}">    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <button class="w3-button w3-black" type="submit">order</button>
    </h5>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</c:forEach>
    </div>
    </div>
</div>

<!-- Contact Modal -->
<div id="info" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black w3-display-container">
            <span onclick="document.getElementById('info').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
            <h1>INFO</h1>
        </div>
        <div class="w3-container">
                    <h5>Name    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b>${user.name}</b></h5>
                    <h5>Surname    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b>${user.surname}</b></h5>
                    <h5>E-Mail    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b>${user.email}</b></h5>
                    <h5>Favourite Food    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b><c:forEach items="${food}" var="food">
                        <c:choose>
                            <c:when test="${food.id==user.favId}">
                                ${food.name}
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                    </c:forEach>
                    </b></h5>
        </div>
    </div>
</div>

<div id="history" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black w3-display-container">
            <span onclick="document.getElementById('history').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
            <h1>History</h1>
        </div>
        <div class="w3-container">
            <c:forEach items="${userfood}" var="userfood">
                <c:forEach items="${food}" var="food">
                <c:choose>
                    <c:when test="${userfood.uid==user.id && userfood.fid==food.id}">
                        <h5>${food.name}    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b>${food.price}</b></h5>
                    </c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>
                </c:forEach>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>

