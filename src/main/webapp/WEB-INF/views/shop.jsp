<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Latest Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Custom styles can be added here if needed */
        .cus-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .cus-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }
        .badge-discount {
            background-color: #ff5722;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            position: absolute;
            top: 10px;
            left: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="base.jsp" />
    <div class="container-fluid bg-light py-5">
        <div class="row text-center mb-3">
            <p class="fs-3 mb-0">Latest Products</p>
        </div>

        <div class="row row-cols-1 row-cols-md-3" style="margin-left:100px; margin-right:100px;">
            <c:forEach var="product" items="${products}">
                <div class="col">
                    <div class="card cus-card position-relative" style="width: 90%; height: 350px; margin: 20px auto; border-radius: 75px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); overflow: hidden;">
                        <a href="${pageContext.request.contextPath}/product/${product.id}" style="text-decoration: none;">
                            <div class="position-relative">
                                <!-- Image is resized to fit the card without being cropped -->
                                <img src="${pageContext.request.contextPath}/img/product_img/${product.image}" alt="${product.title}" style="width: 100%; height: 200px; object-fit: contain; display: block;">
                                <c:if test="${product.discount > 0}">
                                    <span class="badge-discount">${product.discount}% off</span>
                                </c:if>
                            </div>
                            <div class="card-body text-center">
                                <h5 class="card-title mt-2">${product.title}</h5>
                                <p class="mb-1">
                                    <span class="real-price">&#8377;${product.discountPrice}</span>
                                    <c:if test="${product.discount > 0}">
                                        <span class="product-price" style="text-decoration: line-through; color: #888;">&#8377;${product.price}</span>
                                    </c:if>
                                </p>
                                <a href="${pageContext.request.contextPath}/product/${product.id}" class="btn btn-outline-primary" style="border: 2px solid;">View Product</a>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
