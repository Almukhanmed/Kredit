<!DOCTYPE html>
<html>

<head>
    <title>My Awesome Login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/log.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<!--Coded with love by Mutiullah Samim-->
<body>
<div class="container h-100"  style="height: 400px">
    <div class="d-flex justify-content-center h-100"  style="height: 400px">
        <div class="user_card">
            <div class="d-flex justify-content-center">
                <div class="brand_logo_container">
                    <img src="https://cdn.freebiesupply.com/logos/large/2x/pinterest-circle-logo-png-transparent.png" class="brand_logo" alt="Logo">
                </div>
            </div>
            <div class="d-flex justify-content-center form_container">
                <form action="/regUser" method="post">
                    <div class="input-group mb-3">
                        <input type="text" name="email" class="form-control input_user" value="" placeholder="email">
                    </div>
                    <div class="input-group mb-2">
                        <input type="text" name="login" class="form-control input_pass" value="" placeholder="login">
                       </div>
                    <div class="input-group mb-2">
                        <input type="text" name="name" class="form-control input_pass" value="" placeholder="name">
                    </div>
                    <div class="input-group mb-2">
                        <input type="text" name="surname" class="form-control input_pass" value="" placeholder="surname">
                    </div>
                    <div class="input-group mb-2">
                        <input type="password" name="password" class="form-control input_pass" value="" placeholder="password">
                    </div>
                    <div class="input-group mb-2">
                    <select name="isClient">
                        <option>Select</option>
                        <option value="1">User</option>
                        <option value="2">Company</option>
                    </select>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customControlInline">
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <input type="submit" class="btn login_btn1" placeholder="Sign Up">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
            </div>


            </div>
        </div>
    </div>
</div>
</body>
</html>
