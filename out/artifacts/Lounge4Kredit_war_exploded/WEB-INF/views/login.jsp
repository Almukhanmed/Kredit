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
<div class="container h-100">
    <div class="d-flex justify-content-center h-100">
        <div class="user_card">
            <div class="d-flex justify-content-center">
                <div class="brand_logo_container">
                    <img src="https://cdn.freebiesupply.com/logos/large/2x/pinterest-circle-logo-png-transparent.png" class="brand_logo" alt="Logo">
                </div>
            </div>
            <div class="d-flex justify-content-center form_container">
                <form action="/login" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="email_parameter" class="form-control input_user" value="" placeholder="email">
                    </div>
                    <div class="input-group mb-2">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="password_parameter" class="form-control input_pass" value="" placeholder="password">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customControlInline">
                            <label class="custom-control-label" for="customControlInline">Remember me</label>
                            <div class="d-flex justify-content-center mt-3 login_container">
                                <input type="submit" class="btn login_btn1" placeholder="Sign Up">
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <a href="/index">
                <div class="d-flex justify-content-center mt-3 login_container">
                    <button type="button" name="button" class="btn login_btn">Go Back</button>
                </div></a>
            <div class="mt-4">
                <div class="d-flex justify-content-center links">
                    Don't have an account? <a href="/regPage" class="ml-2">Sign Up</a>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
