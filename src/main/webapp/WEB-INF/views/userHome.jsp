<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Carousel image settings */
.carousel-inner img {
    width: 100%;
    height: 350px;
    object-fit: cover;
    transition: transform 0.5s ease-in-out;
}

/* On hover, carousel images will zoom slightly */
.carousel-inner img:hover {
    transform: scale(1.05);
}

/* Card styles */
.card, .cus-card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

/* Hover effect for card */
.card:hover, .cus-card:hover {
    transform: translateY(-10px) scale(1.02);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

/* Category card hover effect */
.card-body a, .cus-card .card-body a {
    color: #333;
    text-decoration: none;
    font-size: 1rem;
    font-weight: 500;
    transition: color 0.3s ease-in-out;
}

.card-body a:hover, .cus-card .card-body a:hover {
    text-decoration: underline;
    color: #007bff;
}

/* Hover animation for product images */
.card img, .cus-card img {
    width: 100%;
height: auto; /* Adjusted height for product images */
    object-fit: contain; /* Ensure the image scales properly without overflow */
    transition: transform 0.4s ease;
    object-fit: cover;
    transition: transform 0.4s ease;
}

/* On hover, product image zoom effect */
.card img:hover, .cus-card img:hover {
    transform: scale(1.1);
}

/* Category container styles */
.category-container .card {
    border-radius: 50%;
    overflow: hidden;
    transition: transform 0.4s ease-in-out;
}

/* Hover effect on category cards */
.category-container .card:hover {
    transform: scale(1.1) rotate(10deg);
}

.category-container img {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 50%;
    transition: transform 0.4s ease-in-out;
}

/* Badge animations */
.badge-discount {
    background-color: #ff5722;
    color: white;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    position: absolute;
    top: 10px;
    left: 10px;
    animation: pulse 1.5s infinite;
}

/* Pulse effect for the discount badge */
@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

/* Price styles */
.real-price {
    font-size: 20px;
    font-weight: 600;
    color: #027a3e;
    transition: color 0.4s;
}

.product-price {
    font-size: 17px;
    text-decoration: line-through;
    color: #999;
}

.product-discount {
    font-size: 15px;
    color: #ff5722;
}

/* Hover effect on product prices */
.real-price:hover {
    color: #004d1a;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .card-item {
        flex: 1 1 calc(50% - 1rem);
    }

    .card img, .cus-card img {
        height: 150px;
    }
}

@media (max-width: 576px) {
    .card-item {
        flex: 1 1 100%;
    }

    .card img, .cus-card img {
        height: 120px;
    }
}

    </style>
</head>
<body>
    <section>
        <!-- Start Slider -->
        <%@ include file="hero.jsp" %>
        <%@ include file="banner.jsp" %>
        <!-- end of carousel -->

        <!-- Start Category Module -->
        <div class="container my-5">
            <div class="row text-center">
                <p class="fs-4 mb-4">Category</p>
                <div class="category-container d-flex justify-content-center">
                    <c:forEach var="category" items="${categories}">
                        <div class="col-md-2 col-sm-4 mb-4">
                            <div class="card rounded-circle shadow-sm">
                                <div class="product-image-container">
                                    <img src="${pageContext.request.contextPath}/img/category_img/${category.imageName}" class="img-fluid" alt="${category.name}">
                                </div>
                                <div class="card-body text-center">
                                    <a href="${pageContext.request.contextPath}/products?category=${category.name}" class="d-block mt-2">${category.name}</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- End Category Module -->
<!-- Start Latest Product Module -->

<!-- End Latest Product Module -->


    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <jsp:include page="footer.jsp" />
</body>
</html>