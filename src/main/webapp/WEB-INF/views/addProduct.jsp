<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Add Product</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            color: #f8f9fa;
            min-height: 100vh;
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 1;
            margin-top: -89px;
        }

        .container {
            position: relative;
            z-index: 2;
            max-width: 800px;
            padding-top: 5rem;
            padding-bottom: 2rem;
        }

        .card {
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(20px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 700px;
            margin-left: -90px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.5);
        }

        .card-header {
            background-color: #8a8583;
            color: white;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            padding: 1rem;
            border-radius: 15px 15px 0 0;
            text-transform: uppercase;
        }

        .card-body {
            padding: 2rem;
        }

        .form-label {
            color: #f8f9fa;
             
        }

        input, textarea, select {
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid #ccc;
            color: #333;
            transition: all 0.3s ease;
        }

        input:hover, textarea:hover, select:hover {
            border-color: #6c63ff;
            box-shadow: 0 0 5px rgba(108, 99, 255, 0.5);
        }

        input:focus, textarea:focus, select:focus {
            border-color: #6c63ff;
            box-shadow: none;
        }

        .btn-primary {
            background-color: #8a8583;
            border: none;
            padding: 0.75rem;
            font-size: 1rem;
            font-weight: bold;
            width: 100%;
            border-radius: 10px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #574bfc;
            transform: translateY(-5px);
        }

        .text-success, .text-danger {
            font-weight: bold;
        }
        .form-check-label{
          font-size: 1.5rem;
          color: black;
        
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Dark Overlay -->
    <div class="overlay"></div>

    <!-- Add Product Form -->
    <section>
        <div class="container p-5 mt-3">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            Add Product
                        </div>

                        <!-- Success/Error Messages -->
                        <div class="card-body">
                            <!-- Success Message -->
                            <c:if test="${not empty sessionScope.succMsg}">
                                <p class="text-success fw-bold" id="success-alert">${sessionScope.succMsg}</p>
                                <%
                                    session.removeAttribute("succMsg");
                                %>
                            </c:if>

                            <!-- Error Message -->
                            <c:if test="${not empty sessionScope.errorMsg}">
                                <p class="text-danger fw-bold" id="error-alert">${sessionScope.errorMsg}</p>
                                <%
                                    session.removeAttribute("errorMsg");
                                %>
                            </c:if>

                            <!-- Form -->
                            <form action="${pageContext.request.contextPath}/admin/saveProduct" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label class="form-label">Enter Title</label>
                                    <input type="text" name="title" class="form-control" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Enter Description</label>
                                    <textarea rows="3" class="form-control" name="description" required></textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select class="form-select" name="category" required>
                                        <option value="">-- Select --</option>
                                        <c:forEach var="c" items="${categories}">
                                            <option value="${c.name}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Enter Price</label>
                                    <input type="number" name="price" class="form-control" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="true" name="isActive" id="active" checked>
                                        <label class="form-check-label" for="active">Active</label>
                                    </div>
                                    <div class="form-check form-check-inline" style="margin-left: 20px;">
                                        <input class="form-check-input" type="radio" name="isActive" value="false" id="inactive">
                                        <label class="form-check-label" for="inactive">Inactive</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Enter Stock</label>
                                        <input type="number" name="stock" class="form-control" required>
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Upload Image</label>
                                        <input type="file" name="file" class="form-control">
                                    </div>
                                </div>

                                <button class="btn btn-primary col-md-12" type="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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