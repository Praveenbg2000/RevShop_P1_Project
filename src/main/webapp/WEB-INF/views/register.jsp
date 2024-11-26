<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
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
    </style>
</head>
<body>

    <div class="container form-container">
        <div class="card">
            <div class="card-header">
                <h4>Register</h4>
            </div>
            <div class="card-body">
                <c:if test="${not empty sessionScope.succMsg}">
    <div id="success-message" class="alert alert-success" role="alert">
        ${sessionScope.succMsg}
    </div>
    <script>
        <c:remove var="succMsg" scope="session" />
    </script>
</c:if>
                <c:if test="${not empty sessionScope.errorMsg}">
                    <div id="success-message" class="alert alert-danger" role="alert">
                        ${sessionScope.errorMsg}
                        <c:remove var="sessionScope.errorMsg" />
                    </div>
                    <script>
        <c:remove var="errorMsg" scope="session" />
    </script>
                </c:if>
                <form action="/saveUser" enctype="multipart/form-data" method="post" onsubmit="return validateForm();">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <div class="input-form">
                            <input id="name" placeholder="Enter your Full Name" type="text" name="name" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobileNumber">Mobile Number</label>
                        <div class="input-form">
                            <input id="mobileNumber" placeholder="Enter your Mobile Number" type="number" name="mobileNumber" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <div class="input-form">
                            <input id="email" placeholder="Enter your Email" type="email" name="email" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <div class="input-form">
                            <input id="address" placeholder="Enter your Address" type="text" name="address" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="city">City</label>
                        <div class="input-form">
                            <input id="city" placeholder="Enter your City" type="text" name="city" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <div class="input-form">
                            <input id="state" placeholder="Enter your State" type="text" name="state" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pincode">Pincode</label>
                        <div class="input-form">
                            <input id="pincode" placeholder="Enter your Pincode" type="number" name="pincode" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-form">
                            <input id="password" placeholder="Enter your Password" type="password" name="password" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmpassword">Confirm Password</label>
                        <div class="input-form">
                            <input id="confirmpassword" placeholder="Confirm your Password" type="password" name="confirmpassword" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="img">Profile Image</label>
                        <div class="input-form">
                            <input id="img" type="file" name="img" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userRole">User Role</label>
                        <div class="input-form">
                            <select id="userRole" name="role" required class="form-select">
                                <option value="buyer" selected>Buyer</option>
                                <option value="seller">Seller</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="button">Register</button>
                </form>
            </div>
            <div class="card-footer text-center">
                Have an account? <a href="/signin">Login</a>
            </div>
        </div>
    </div>

    <script>
   
    // Hide success message after 3 seconds
    setTimeout(function() {
        const successMessage = document.getElementById("success-message");
        if (successMessage) {
            successMessage.style.display = "none";
        }
    }, 2000); // 3000 milliseconds = 3 seconds


        function validateForm() {
            const name = document.getElementById("name").value;
            const mobile = document.getElementById("mobileNumber").value;
            const email = document.getElementById("email").value;
            const pincode = document.getElementById("pincode").value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmpassword").value;

            // Regular expressions for validation
            const mobileRegex = /^[0-9]{10}$/;
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            const pincodeRegex = /^[0-9]{6}$/;

            if (name.trim() === "") {
                alert("Full Name is required.");
                return false;
            }
            if (!mobileRegex.test(mobile)) {
                alert("Please enter a valid 10-digit mobile number.");
                return false;
            }
            if (!emailRegex.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }
            if (!pincodeRegex.test(pincode)) {
                alert("Please enter a valid 6-digit pincode.");
                return false;
            }
            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true; // If all validations pass
        }
    </script>

</body>
</html>