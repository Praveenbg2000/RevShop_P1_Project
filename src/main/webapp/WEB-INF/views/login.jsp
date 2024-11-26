<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <!-- Font Awesome (optional) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <!-- jQuery (optional) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        body {
            padding-top: 56px; /* Adjust based on navbar height */
            background-color: #f4f4f4; /* Light gray background */
        }
        .form-container {
            margin: auto;
            padding: 40px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin-top: 50px;
        }
        .card-header {
            background: #007bff;
            color: white;
            border-radius: 10px 10px 0 0;
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
            color: #333;
        }
        .input-form {
            border: 1px solid #ddd;
            border-radius: 5px;
            height: 40px;
            display: flex;
            align-items: center;
            padding-left: 10px;
            background-color: #f9f9f9;
        }
        .button {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
            margin-top: 30px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .card-footer a {
            color: #007bff;
            font-weight: bold;
            text-decoration: none;
        }
        .card-footer a:hover {
            text-decoration: underline;
        }
        .alert {
            margin-bottom: 20px;
        }
        .form-check-label {
            margin-left: 5px;
            font-weight: normal;
        }
        .forgot-password {
            float: right;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="container form-container">
        <div class="card">
            <div class="card-header">
                <h4>Login</h4>
            </div>
            <div class="card-body">
                <!-- Error Message -->
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        <h5 style="color:red;"><c:out value="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}" /></h5>
                    </div>
                </c:if>
                <!-- Success Message -->
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">
                        Logout successful!
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <div class="input-form">
                            <input id="email" placeholder="Enter your Email" type="email" name="username" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-form">
                            <input id="password" placeholder="Enter your Password" type="password" name="password" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember">
                        <label class="form-check-label" for="remember">Remember me</label>
                        <a href="${pageContext.request.contextPath}/forgot-password" class="forgot-password">Forgot password?</a>
                    </div>
                    <button type="submit" class="button">Sign In</button>
                    <p class="text-center mt-3">Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign Up</a></p>
                </form>
            </div>
        </div>
    </div>

    <script>
        function validateForm() {
            const password = document.getElementById("password").value;

            // Check if password is at least 8 characters long
            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false; // Prevent form submission
            }

            return true; // Allow form submission if everything is valid
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>