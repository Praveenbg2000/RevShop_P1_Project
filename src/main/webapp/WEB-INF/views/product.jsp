<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Product Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        /* Advanced CSS for product cards */
        .product-card {
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 15px;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        /* Wishlist heart icon */
        .wishlist-heart {
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 24px;
    color: #777;
    border: 2px solid white;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.3);
    padding: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.wishlist-heart.active {
    color: white;
    background-color: #ff4b4b;
    border-color: #ff4b4b;
}


        /* Product image adjustments */
        .product-card img {
            max-width: 120px;
            height: auto;
            margin: 0 auto;
            transition: transform 0.3s ease;
        }

        .product-card img:hover {
            transform: scale(1.05);
        }

        /* Product details */
        .product-details {
            margin-top: 10px;
        }

        .product-details p {
            margin: 0;
            padding: 5px 0;
        }

        /* View details button adjustments */
        .btn-view-details {
            font-size: 0.8rem;
            padding: 5px 10px;
            margin-top: 10px;
            border-radius: 20px;
        }

        /* Unique page design elements */
        body {
            background-color: #f8f9fa;
        }

        .category-sidebar {
            background-color: #343a40;
            color: white;
            padding: 15px;
            border-radius: 10px;
        }

        .category-sidebar a {
            color: black;
        }

        .category-sidebar a:hover {
            color: #777;
            text-decoration: none;
        }

        .search-bar-container {
            background-color: #007bff;
            padding: 15px;
            border-radius: 10px;
        }

        .search-bar-container input {
            border-radius: 25px;
            padding: 10px;
        }

        .pagination a {
            font-size: 0.9rem;
            border-radius: 20px;
            margin: 0 5px;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .product-card {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <section>
        <!-- Search Bar -->
        <div class="container-fluid search-bar-container mt-5">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <form action="/products" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control" name="ch" placeholder="Search products...">
                            <button class="btn btn-light text-dark ms-3 col-md-2">
                                <i class="fa-solid fa-magnifying-glass"></i> Search
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container-fluid mt-4">
            <div class="row">
                <!-- Category Sidebar -->
                <div class="col-md-2 p-0">
                    <div class="category-sidebar">
                        <p class="fs-5">Category</p>
                        <a href="/products" class="list-group-item ${paramValue == '' ? 'active' : ''}">All</a>
                        <c:forEach var="c" items="${categories}">
                            <a href="/products?category=${c.name}" class="list-group-item ${paramValue == c.name ? 'active' : ''}">
                                ${c.name}
                            </a>
                        </c:forEach>
                    </div>
                </div>

                <!-- Products Section -->
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Products</p>
                            <div class="row">
                                <c:if test="${productsSize > 0}">
                                    <c:forEach var="p" items="${products}">
                                        <div class="col-md-3 mt-2">
                                            <div class="card product-card text-center">
                                                <!-- Wishlist Heart Icon -->
                                                <a href="/user/addWishlist?productId=${p.id}" class="wishlist-heart" onclick="toggleWishlist(this)">
                                                    <i class="fas fa-heart"></i>
                                                </a>
                                                
                                                <!-- Product Image -->
                                                <img src="/img/product_img/${p.image}" alt="${p.title}">
                                                
                                                <!-- Product Details -->
                                                <div class="product-details">
                                                    <p class="fs-5">${p.title}</p>
                                                    <p class="fs-6 fw-bold">
                                                        &#8377; ${p.discountPrice} <br>
                                                        <span class="text-decoration-line-through text-secondary">&#8377; ${p.price}</span>
                                                        <span class="fs-6 text-success">${p.discount}% off</span>
                                                    </p>
                                                </div>
                                                <a href="/product/${p.id}" class="btn btn-primary btn-view-details">View Details</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${productsSize <= 0}">
                                    <p class="fs-4 text-center mt-4 text-danger">Product not available</p>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <div class="row">
                        <div class="col-md-4">Total Products: ${totalElements}</div>
                        <div class="col-md-6">
                            <c:if test="${productsSize > 0}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item ${isFirst ? 'disabled' : ''}">
                                            <a class="page-link" href="/products?pageNo=${pageNo - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li class="page-item ${pageNo + 1 == i ? 'active' : ''}">
                                                <a class="page-link" href="/products?pageNo=${i - 1}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${isLast ? 'disabled' : ''}">
                                            <a class="page-link" href="/products?pageNo=${pageNo + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
    function toggleWishlist(element) {
        element.classList.toggle('active');
    }

    </script>

    <jsp:include page="footer.jsp" />
</body>
</html>
