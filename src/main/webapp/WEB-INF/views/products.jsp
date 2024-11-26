<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="./base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>All Products</title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
    <script src="<c:url value='/js/bootstrap.bundle.min.js' />"></script>
    
    <style>
        /* Body background color */
        body {

             background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvlJSal5Ro0z2SlmDFq18ohBfuicKeHfvthg&s') no-repeat center center fixed;
            background-size: cover;
            color: #f8f9fa;
        }

        /* Section card layout for better structure */
        section {
            background-color: #ffffff; /* White background for the main content */
            padding: 20px;
            margin: 20px auto;
            max-width: 1200px; /* Center the content with a max width */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for a card effect */
        }

        /* Main header styling */
        .text-center.fs-3 {
            color: #333; /* Darker header text */
            font-weight: bold;
            margin-bottom: 20px; /* Add space below */
        }

        /* Buttons */
        .btn-primary, .btn-danger {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: black;
            border: none;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        /* Table styles */
        .table {
            margin-top: 20px;
        }

        .table th {
            background-color:#6f42c1;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
        }

        /* Table cell padding */
        .table td, .table th {
            padding: 15px;
        }

        /* Success and error message styling */
        .text-success, .text-danger {
            font-size: 1.1rem;
            text-align: center;
            margin: 10px 0;
        }

        /* Pagination */
        .pagination .page-item .page-link {
            color: black;
        }

        .pagination .page-item.active .page-link {
            background-color: #6f42c1;
            border-color: #007bff;
        }

        .pagination .page-link:hover {
            background-color: #0056b3;
            color: white;
        }

        /* Hover effect for table rows */
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Search form input styles */
        .form-control {
            border: 2px solid #007bff;
            padding: 10px;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #0056b3;
        }

        /* Styling for action icons */
        .fa-pen-to-square, .fa-trash {
            margin-right: 5px;
        }

        /* Spacing */
        .row {
            margin-bottom: 20px;
        }

        /* Breadcrumb and link hover effect */
        a.text-decoration-none {
            color: #007bff;
        }

        a.text-decoration-none:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <section>
        <div class="container-fluid mt-4 p-3">
            <div class="row">
                <p class="text-center fs-3 mt-2">All Products</p>
                <hr>
                <a href="${pageContext.request.contextPath}/admin/" class="text-decoration-none">
                    <i class="fa-solid fa-arrow-left"></i> Back
                </a>

                <% if (session.getAttribute("succMsg") != null) { %>
                    <p class="text-success fw-bold" id="success-alert"><%= session.getAttribute("succMsg") %></p>
                    <% session.removeAttribute("succMsg"); %>
                <% } %>

                <% if (session.getAttribute("errorMsg") != null) { %>
                    <p class="text-danger fw-bold" id="error-alert"><%= session.getAttribute("errorMsg") %></p>
                    <% session.removeAttribute("errorMsg"); %>
                <% } %>

                <div class="col-md-4 p-3">
                    <form action="${pageContext.request.contextPath}/admin/products" method="get">
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" name="ch" placeholder="Search products">
                            </div>
                            <div class="col">
                                <button class="btn btn-primary col">Search</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="p-3">
                    <table class="table table-bordered table-hover">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">Sl No</th>
                                <th scope="col">Image</th>
                                <th scope="col">Title</th>
                                <th scope="col">Category</th>
                                <th scope="col">Price</th>
                                <th scope="col">Discount</th>
                                <th scope="col">Discount Price</th>
                                <th scope="col">Status</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${products}" varStatus="c">
                                <tr>
                                    <th scope="row"><c:out value="${c.index + 1}"/></th>
                                    <td><img src="${pageContext.request.contextPath}/img/product_img/${p.image}" width="70px" height="70px"></td>
                                    <td><c:out value="${p.title}"/></td>
                                    <td><c:out value="${p.category}"/></td>
                                    <td><c:out value="${p.price}"/></td>
                                    <td><c:out value="${p.discount}"/></td>
                                    <td><c:out value="${p.discountPrice}"/></td>
                                    <td><c:out value="${p.isActive}"/></td>
                                    <td><c:out value="${p.stock}"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/editProduct/${p.id}" class="btn btn-sm btn-primary">
                                            <i class="fa-solid fa-pen-to-square"></i> Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/deleteProduct/${p.id}" class="btn btn-sm btn-danger">
                                            <i class="fa-solid fa-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="row">
                        <div class="col-md-4">Total Products: <c:out value="${totalElements}"/></div>
                        <div class="col-md-6">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item <c:if test="${isFirst}">disabled</c:if>">
                                        <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${pageNo - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li class="page-item <c:if test="${pageNo + 1 == i}">active</c:if>">
                                            <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${i - 1}">
                                                <c:out value="${i}"/>
                                            </a>
                                        </li>
                                    </c:forEach>

                                    <li class="page-item <c:if test="${isLast}">disabled</c:if>">
                                        <a class="page-link" href="${pageContext.request.contextPath}/admin/products?pageNo=${pageNo + 1}" aria-label="Next">
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