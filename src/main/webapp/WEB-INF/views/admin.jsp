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
        <p>Admin Page</p>
    </div>
    <div class="w3-display-topleft w3-container w3-xlarge">
        <p><button onclick="document.getElementById('menu').style.display='block'" class="w3-button w3-black">menu</button></p>
        <p><button onclick="document.getElementById('info').style.display='block'" class="w3-button w3-black">users info</button></p>
        <p><button onclick="document.getElementById('history').style.display='block'" class="w3-button w3-black">add user</button></p>
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
    <h5>${food.name}</h5><h5>	.	.	.	</h5><h5>${food.price}</b><form action="/delFood" method="post">
	<input type="hidden" name="fid" value="${food.id}"/>	
	<br><button class="w3-button w3-black" type="submit">Delete Food</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form></h5>
</c:forEach>
<br>
	<form action="/addNewFood" method="post">
	<h5><b>Food name:</b></h5><br>
        <input type="text" name="fname"><br>
		<h5><b>Food price:</b></h5><br>
        <input type="text" name="fprice"><br><button class="w3-button w3-black" type="submit">Add New Food</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    </div>
    </div>
</div>

<!-- Contact Modal -->
<div id="info" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black w3-display-container">
            <span onclick="document.getElementById('info').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
            <h1>USERS INFO</h1>
        </div>
        <div class="w3-container">
                    <c:forEach items="${users}" var="users">
					<h5>Name    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b>${user.name}</b></h5>
                    <h5>Surname    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b>${user.surname}</b></h5>
                    <h5>E-Mail    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b>${user.email}</b></h5>
                    <h5>Favourite Food    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   <b><c:forEach items="${food}" var="food">
                        <c:choose>
                            <c:when test="${food.id==users.favId}">
                                ${food.name}
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                    </c:forEach>
					<form action="/delUser" method="post">
					<input type="hidden" name="uid" value="${users.id}"/>	
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<br><button class="w3-button w3-black" type="submit">Delete User</button>
					</form>
					</c:forEach
                    </b></h5>
        </div>
    </div>
</div>

<div id="history" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black w3-display-container">
            <span onclick="document.getElementById('history').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
            <h1>Add User</h1>
        </div>
        <div class="w3-container">
           <form action="/regUser1" method="post">
		   <br>
                <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="E-Mail" name="email"></p>
                <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Login" name="login"></p>
                <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" name="name"></p>
                <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Surname" name="surname"></p>
                <p><input class="w3-input w3-padding-16 w3-border" type="password" placeholder="Password" name="password"></p>
                <p><select name="favid">
                    <option>Favourite Food</option>
                    <option value="1">Tomato Soup</option>
                    <option value="2">Chicken Salad</option>
                    <option value="3">Bread and Butter</option>
                    <option value="4">Grilled Fish and Potatoes</option>
                    <option value="5">Italian Pizza</option>
                    <option value="6">Veggie Pasta
                    </option>
                    <option value="7">Chicken and Potatoes
                    </option>
                </select></p>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <p><button class="w3-button" type="submit">ADD USER</button></p>
            </form>
        </div>
    </div>
</div>
</body>
</html>

