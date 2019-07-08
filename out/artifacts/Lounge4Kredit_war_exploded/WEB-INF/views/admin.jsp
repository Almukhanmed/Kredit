<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>ADMIN PAGE</h1>
<form action="addUser" method="post">

    Email : <input type="email" name="email"><br>
    Login : <input type="text" name="login"><br>
    Name : <input type="text" name="name"><br>
    Surname : <input type="text" name="surname"><br>
    Password : <input type="password" name="password"><br>
    I Want To Registrate As : <select name="isClient">
    <option>Select</option>
    <option value="1">User</option>
    <option value="2">Company</option>
</select>
    <br>
    <button type="submit">Submit</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>
