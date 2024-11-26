<%@include file="./base.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <style>
        /* Global styling */
        body {
            background: url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            font-family: 'Arial', sans-serif;
            height: 100vh;
        }

        .container {
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            max-width: 1200px;
            margin: 0 auto;
            height: 100vh;
        }

        .dashboard-title {
            font-size: 3rem;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            text-align: center;
            letter-spacing: 2px;
            margin-bottom: 2rem;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 2;
        }

        .dashboard-title span {
            color: #FFBF00;
            text-shadow: 2px 2px 10px rgba(0, 255, 255, 0.5);
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4x4 layout */
            grid-template-rows: repeat(4, 1fr);
            gap: 1.5rem;
            justify-items: center;
            align-items: center;
            position: relative;
        }

        .card {
            border: none;
            border-radius: 50%;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
            width: 250px;
            height: 210px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-color: #ffffff;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card img {
            width: 60px;
            height: 60px;
            object-fit: contain;
        }

        .card-title {
            font-size: 1rem;
            margin-top: 0.5rem;
            color: #007bff;
            font-weight: bold;
        }

        a.text-decoration-none {
            text-decoration: none;
            color: inherit;
        }

        /* Create circular arrangement */
        .center-item {
            grid-column: 2 / span 2;
            grid-row: 2 / span 2;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .center-card {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background-color: #f1c40f;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
                grid-template-rows: repeat(3, 1fr);
            }

            .card {
                width: 120px;
                height: 120px;
            }

            .center-card {
                width: 150px;
                height: 150px;
            }

            .card-title {
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <section>
        <div class="container p-5">
            <p class="dashboard-title"><span>Admin Dashboard</span></p>
            <div class="dashboard-grid">
                <!-- 4x4 Circular Layout -->
                
               

                <div class="card">
                    <a href="/admin/products" class="text-decoration-none">
                        <div class="card-body">
                            <img src="/img/Images/prod.png" class="img-fluid" alt="View Product">
                            <h4 class="card-title">View Product</h4>
                        </div>
                    </a>
                </div>
                
                <div class="card">
                    <a href="/admin/add-admin" class="text-decoration-none">
                        <div class="card-body">
                            <img src="/img/Images/admini.png" class="img-fluid" alt="Add Admin">
                            <h4 class="card-title">Add Admin</h4>
                        </div>
                    </a>
                </div>
                
                <div class="card">
                    <a href="/admin/users?type=2" class="text-decoration-none">
                        <div class="card-body">
                            <img src="/img/Images/admin.png" class="img-fluid" alt="Admin">
                            <h4 class="card-title">Admin</h4>
                        </div>
                    </a>
                </div>
                
                 <div class="card">
                    <a href="/admin/loadAddProduct" class="text-decoration-none">
                        <div class="card-body">
                            <img src="/img/Images/Productsi.png" class="img-fluid" alt="Product">
                            <h4 class="card-title">Add Product</h4>
                        </div>
                    </a>
                </div>

                <div class="card">
                    <a href="/admin/category" class="text-decoration-none">
                        <div class="card-body">
                            <img src="/img/Images/cat.png" class="img-fluid" alt="Add Category">
                            <h4 class="card-title">Add Category</h4>
                        </div>
                    </a>
                </div>

                <div class="card">
                    <a href="/admin/orders" class="text-decoration-none">
                        <div class="card-body">
                            <img src="/img/Images/orderi.png" class="img-fluid" alt="Orders">
                            <h4 class="card-title">Orders</h4>
                        </div>
                    </a>
                </div>

                

                <div class="card">
                    <a href="/admin/users?type=1" class="text-decoration-none">
                        <div class="card-body">
                            <img src="/img/Images/useri.png" class="img-fluid" alt="Users">
                            <h4 class="card-title">Users</h4>
                        </div>
                    </a>
                </div>

                

                
            </div>
        </div>
    </section>
</body>
</html>