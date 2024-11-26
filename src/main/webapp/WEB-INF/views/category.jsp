<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ include file="./base.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Manage Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            
            font-family: 'Arial', sans-serif;
             background: url('data:image/jpeg;base64,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') no-repeat center center fixed;
            background-size: cover;
            color: #f8f9fa;
            
           
            
        }

/* Additional Styles for Table Header */
table thead {
    background-color: #333; /* Dark grey background for header */
    color: #fff; /* White text color */
}

table thead th {
    padding: 1rem;
    text-align: center;
    border-bottom: 2px solid #444; /* Slightly lighter border for separation */
}

        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
            
        }

        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .card-header {
           background-color: #007bff;
            color: #fff;
            text-align: center;
            padding: 1rem;
            border-bottom: 1px solid #444;
        }
      
        .card-body {
            padding: 2rem;
        }

        .btn-primary {
            background-color: #343a40;
            border: none;
            color: #fff;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #495057;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 0.75rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #343a40;
            box-shadow: none;
        }

        .form-label {
            font-weight: 500;
        }

        table {
            width: 100%;
            margin: 1rem 0;
            border-collapse: separate;
            border-spacing: 0;
        }

        table th, table td {
            text-align: center;
            padding: 1rem;
        }

        table img {
            object-fit: cover;
            border-radius: 4px;
        }

        thead th {
            background-color: #e9ecef;
            color: #343a40;
        }

        tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }
          
    

        tbody tr:nth-child(even) {
            background-color: #ffffff;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        .pagination {
            margin-top: 1rem;
        }

        .pagination .page-item.disabled .page-link {
            background-color: #e9ecef;
            border-color: #ddd;
            color: #6c757d;
        }

        .pagination .page-item.active .page-link {
            background-color: #343a40;
            border-color: #343a40;
            color: #fff;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .card {
                margin-bottom: 1rem;
            }
        }

        @media (max-width: 576px) {
            .form-control {
                font-size: 0.875rem;
            }

            .btn-primary {
                font-size: 0.875rem;
                 background-color: #007bff;
            }
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <div class="row">
            <!-- Add Category Form -->
            <div class="col-lg-6 col-md-8 mx-auto mb-4">
                <div class="card">
                    <div class="card-header">
                        <h4 class="mb-0">Add Category</h4>
                        <c:if test="${not empty sessionScope.succMsg}">
                            <p class="text-success fw-bold" id="success-alert">${sessionScope.succMsg}</p>
                            <c:set var="sessionScope.succMsg" value="" />
                        </c:if>
                        <c:if test="${not empty sessionScope.errorMsg}">
                            <p class="text-danger fw-bold" id="error-alert">${sessionScope.errorMsg}</p>
                            <c:set var="sessionScope.errorMsg" value="" />
                        </c:if>
                    </div>
                    <div class="card-body">
                        <form action="/admin/saveCategory" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="categoryName" class="form-label">Enter Category</label>
                                <input type="text" id="categoryName" name="name" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" checked value="true" name="isActive" id="active">
                                    <label class="form-check-label" for="active">Active</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="isActive" value="false" id="inactive">
                                    <label class="form-check-label" for="inactive">Inactive</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="categoryImage" class="form-label">Upload Image</label>
                                <input type="file" id="categoryImage" name="file" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary col-12">Save</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Category Details Table -->
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="mb-0">Category Details</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">SR No</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cat" varStatus="status" items="${categorys}">
                                    <tr>
                                        <th scope="row">${status.count}</th>
                                        <td>${cat.name}</td>
                                        <td>${cat.isActive ? 'Active' : 'Inactive'}</td>
                                        <td><img src="/img/category_img/${cat.imageName}" width="50" height="50" alt="category image"></td>
                                        <td>
                                            <a href="/admin/loadEditCategory/${cat.id}" class="btn btn-primary btn-sm">
                                                <i class="fa-solid fa-pen-to-square"></i> Edit
                                            </a>
                                            <a href="/admin/deleteCategory/${cat.id}" class="btn btn-danger btn-sm">
                                                <i class="fa-solid fa-trash"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item ${isFirst ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/category?pageNo=${pageNo - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${pageNo + 1 == i ? 'active' : ''}">
                                        <a class="page-link" href="/admin/category?pageNo=${i - 1}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${isLast ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/category?pageNo=${pageNo + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>