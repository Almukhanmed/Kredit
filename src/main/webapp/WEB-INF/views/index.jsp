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
        <p>Lounge Bar</p>
    </div>
    <div class="w3-display-topleft w3-container w3-xlarge">
        <p><button onclick="document.getElementById('menu').style.display='block'" class="w3-button w3-black">menu</button></p>
        <p><button onclick="document.getElementById('login').style.display='block'" class="w3-button w3-black">login</button></p>
        <p><button onclick="document.getElementById('signup').style.display='block'" class="w3-button w3-black">sign up</button></p>
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
            <h5>${food.name}<b>     .       .       .       ${food.price}</b></h5>
</c:forEach>
    </div>
    </div>
</div>

<!-- Log In Modal -->
<div id="login" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black">
            <span onclick="document.getElementById('login').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
            <h1>LOG IN FORM</h1>
        </div>
        <div class="w3-container">
            <p>Log In Form</p>
            <form action="/login" method="post">
                <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="E-Mail" name="email_parameter"></p>
                <p><input class="w3-input w3-padding-16 w3-border" type="password" placeholder="Password" name="password_parameter"></p>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <p><button class="w3-button" type="submit">LOG IN</button></p>
            </form>
        </div>
    </div>
</div>

<!-- Sing Up Modal -->
<div id="signup" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-black">
            <span onclick="document.getElementById('signup').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
            <h1>SIGN UP FORM</h1>
        </div>
        <div class="w3-container">
            <p>Sign Up</p>
            <form action="/regUser" method="post">
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
                <p><button class="w3-button" type="submit">SIGN UP</button></p>
            </form>
        </div>
    </div>
</div>
</body>
</html>

