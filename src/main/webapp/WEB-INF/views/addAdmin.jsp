<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Add Admin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Background styling */
        body {
            font-family: 'Arial', sans-serif;
            background: url('https://images.unsplash.com/photo-1508780709619-79562169bc64?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDJ8fG9mZmljZXxlbnwwfHx8fDE2NzQ1ODU4NzU&ixlib=rb-1.2.1&q=80&w=1080') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6); /* Dark overlay for contrast */
            z-index: 1;
        }

        .container {
            position: relative;
            z-index: 2;
            margin-top: 5rem;
        }

        /* Card styles */
        .card {
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.85); /* Transparent background */
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 10px 18px rgba(0, 0, 0, 0.5);
            transform: translateY(-5px); /* Smooth hover effect */
        }

        .card-header {
            background-color: #8a8583;
            color: white;
            text-align: center;
            font-size: 1.8rem;
            padding: 15px;
            border-radius: 15px 15px 0 0;
        }

        .card-body {
            padding: 2rem;
            color: #333;
        }

        /* Form styling */
        .form-label {
            color: #475c6c;
            font-weight: bold;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.95);
            border: 1px solid #ddd;
            color: #333;
            padding: 0.75rem;
            border-radius: 5px;
            transition: border-color 0.2s;
        }

        .form-control:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
        }

        /* Button styling */
        .btn-primary {
            background-color: #475c6c;
            border: none;
            padding: 0.75rem 1rem;
            font-size: 1.1rem;
            font-weight: bold;
            width: 100%;
            border-radius: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }

        .text-success, .text-danger {
            font-weight: bold;
            font-size: 1rem;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <section>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            Add Admin
                        </div>
                        <div class="card-body">
                            <% 
                                String succMsg = (String) session.getAttribute("succMsg");
                                String errorMsg = (String) session.getAttribute("errorMsg");
                                if (succMsg != null) {
                            %>
                                <p class="text-success" id="success-alert"><%= succMsg %></p>
                                <% session.removeAttribute("succMsg"); %>
                            <% 
                                }
                                if (errorMsg != null) {
                            %>
                                <p class="text-danger" id="error-alert"><%= errorMsg %></p>
                                <% session.removeAttribute("errorMsg"); %>
                            <% 
                                } 
                            %>

                            <form action="<c:url value='/admin/save-admin' />" method="post" enctype="multipart/form-data">
                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">Full Name</label>
                                        <input required class="form-control" name="name" type="text">
                                    </div>

                                    <div class="col">
                                        <label class="form-label">Mobile Number</label>
                                        <input required class="form-control" name="mobileNumber" type="number">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input required class="form-control" name="email" type="email">
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">Address</label>
                                        <input required class="form-control" name="address" type="text">
                                    </div>

                                    <div class="col">
                                        <label class="form-label">City</label>
                                        <input required class="form-control" name="city" type="text">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">State</label>
                                        <input required class="form-control" name="state" type="text">
                                    </div>

                                    <div class="col">
                                        <label class="form-label">Pincode</label>
                                        <input required class="form-control" name="pincode" type="number">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label class="form-label">Password</label>
                                        <input required class="form-control" name="password" type="password">
                                    </div>
                                    <div class="col">
                                        <label class="form-label">Confirm Password</label>
                                        <input required class="form-control" name="cpassword" type="password">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Profile Image</label>
                                    <input class="form-control" name="img" type="file">
                                </div>

                                <button type="submit" class="btn btn-primary">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
    // Fade out and hide the alert messages after 2 seconds
    setTimeout(function() {
        const successAlert = document.getElementById("success-alert");
        if (successAlert) {
            successAlert.style.transition = "opacity 0.5s ease-out";
            successAlert.style.opacity = "0";
            setTimeout(() => successAlert.style.display = "none", 500);
        }

        const errorAlert = document.getElementById("error-alert");
        if (errorAlert) {
            errorAlert.style.transition = "opacity 0.5s ease-out";
            errorAlert.style.opacity = "0";
            setTimeout(() => errorAlert.style.display = "none", 500);
        }
    }, 2000);  // 2000ms = 2 seconds
</script>
</body>
</html>