<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentUser" value="${sessionScope.username}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/corexa2.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/products.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />

    <script src="${contextPath}/js/products.js" defer></script>
</head>

<body>

    <div class="admin-layout">

        <!-- SIDEBAR -->
        <aside class="admin-sidebar">

            <div class="sidebar-top">

                <a href="${contextPath}/adminDashboard" class="admin-logo">
                    <img src="${contextPath}/resources/logo/corexa2.png" alt="Corexa Logo">
                </a>

                <div class="admin-profile-card">
                    <div class="admin-avatar">
                        <i class="fa-solid fa-user-shield"></i>
                    </div>

                    <div>
                        <span>Admin Panel</span>
                        <h3>
                            <c:choose>
                                <c:when test="${not empty currentUser}">
                                    ${currentUser}
                                </c:when>
                                <c:otherwise>
                                    Corexa Admin
                                </c:otherwise>
                            </c:choose>
                        </h3>
                    </div>
                </div>

                <nav class="admin-nav">

                    <a href="${contextPath}/adminDashboard" class="admin-nav-link">
                        <i class="fa-solid fa-table-columns"></i>
                        <span>Dashboard</span>
                    </a>

                    <a href="${contextPath}/admin/orders" class="admin-nav-link">
                        <i class="fa-solid fa-boxes-stacked"></i>
                        <span>Orders</span>
                    </a>

                    <a href="${contextPath}/modifyUsers" class="admin-nav-link">
                        <i class="fa-solid fa-users-gear"></i>
                        <span>Customer Details</span>
                    </a>

                    <a href="${contextPath}/products" class="admin-nav-link active">
                        <i class="fa-solid fa-box-open"></i>
                        <span>Manage Products</span>
                    </a>

                </nav>

            </div>

            <form action="${contextPath}/logout" method="post" class="logout-form">
                <button type="submit" class="logout-btn">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Logout
                </button>
            </form>

        </aside>

        <!-- MAIN CONTENT -->
        <main class="product-management-dashboard">

            <jsp:include page="adminHeader.jsp" />

            <!-- HERO -->
            <section class="management-hero">

                <div class="hero-content">
                    <span>Corexa Management</span>
                    <h1>Product Management</h1>
                    <p>
                        Add, edit, update, and organize Corexa gaming products from one clean
                        admin inventory dashboard.
                    </p>
                </div>

                <div class="hero-icon">
                    <i class="fa-solid fa-box-open"></i>
                </div>

            </section>

            <!-- ALERTS -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <i class="fa-solid fa-circle-check"></i>
                    <span>${success}</span>
                </div>
            </c:if>

            <!-- TOP BAR -->
            <section class="products-top-bar">

                <div>
                    <span>Inventory Control</span>
                    <h2>Store Products</h2>
                </div>

                <div class="top-actions">
                    <p>
                        <c:choose>
                            <c:when test="${not empty products}">
                                ${fn:length(products)} product(s)
                            </c:when>
                            <c:otherwise>
                                0 product
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <button type="button" id="toggleProductForm" class="add-product-btn">
                        <i class="fa-solid fa-plus"></i>
                        <span>
                            <c:choose>
                                <c:when test="${not empty productToEdit}">
                                    Edit Product
                                </c:when>
                                <c:otherwise>
                                    Add New Product
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </button>
                </div>

            </section>

            <!-- ADD / EDIT PRODUCT FORM -->
            <section
                id="addProductForm"
                class="product-form-panel ${not empty error or not empty productToEdit ? '' : 'is-hidden'}">

                <div class="form-heading">
                    <span>
                        <c:choose>
                            <c:when test="${not empty productToEdit}">
                                Edit Mode
                            </c:when>
                            <c:otherwise>
                                Add Mode
                            </c:otherwise>
                        </c:choose>
                    </span>

                    <h2>
                        <c:choose>
                            <c:when test="${not empty productToEdit}">
                                Edit Product Details
                            </c:when>
                            <c:otherwise>
                                Add Product Details
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </div>

                <form action="${contextPath}/products" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="action" value="${not empty productToEdit ? 'update' : 'add'}">

                    <c:if test="${not empty productToEdit}">
                        <input type="hidden" name="productId" value="${productToEdit.productId}">
                    </c:if>

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input
                                type="text"
                                id="productName"
                                name="productName"
                                value="${not empty productToEdit ? productToEdit.productName : productName}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="category">Category</label>
                            <select id="category" name="category" required>
                                <option value="">Select Category</option>

                                <option value="Keyboard"
                                    ${(not empty productToEdit && productToEdit.category == 'Keyboard') || category == 'Keyboard' ? 'selected' : ''}>
                                    Keyboard
                                </option>

                                <option value="Mouse"
                                    ${(not empty productToEdit && productToEdit.category == 'Mouse') || category == 'Mouse' ? 'selected' : ''}>
                                    Mouse
                                </option>

                                <option value="Headset"
                                    ${(not empty productToEdit && productToEdit.category == 'Headset') || category == 'Headset' ? 'selected' : ''}>
                                    Headset
                                </option>

                                <option value="CPU/GPU"
                                    ${(not empty productToEdit && productToEdit.category == 'CPU/GPU') || category == 'CPU/GPU' ? 'selected' : ''}>
                                    CPU/GPU
                                </option>

                                <option value="Consoles"
                                    ${(not empty productToEdit && productToEdit.category == 'Consoles') || category == 'Consoles' ? 'selected' : ''}>
                                    Consoles
                                </option>

                                <option value="Monitor"
                                    ${(not empty productToEdit && productToEdit.category == 'Monitor') || category == 'Monitor' ? 'selected' : ''}>
                                    Monitor
                                </option>

                                <option value="Storage"
                                    ${(not empty productToEdit && productToEdit.category == 'Storage') || category == 'Storage' ? 'selected' : ''}>
                                    Storage
                                </option>

                                <option value="Other"
                                    ${(not empty productToEdit && productToEdit.category == 'Other') || category == 'Other' ? 'selected' : ''}>
                                    Other
                                </option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="sku">SKU</label>
                            <input
                                type="text"
                                id="sku"
                                name="sku"
                                value="${not empty productToEdit ? productToEdit.sku : sku}"
                                placeholder="Unique stock code"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="brand">Brand</label>
                            <input
                                type="text"
                                id="brand"
                                name="brand"
                                value="${not empty productToEdit ? productToEdit.brand : brand}"
                                placeholder="Product brand"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="price">Price Rs.</label>
                            <input
                                type="number"
                                id="price"
                                name="price"
                                step="5"
                                min="0"
                                value="${not empty productToEdit ? productToEdit.price : price}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="quantity">Quantity</label>
                            <input
                                type="number"
                                id="quantity"
                                name="quantity"
                                min="0"
                                value="${not empty productToEdit ? productToEdit.quantity : quantity}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="rackNumber">Rack Number</label>
                            <input
                                type="text"
                                id="rackNumber"
                                name="rackNumber"
                                value="${not empty productToEdit ? productToEdit.rackNumber : rackNumber}"
                                placeholder="Rack or shelf location"
                                required>
                        </div>

                        <div class="form-group full-width">
                            <label for="description">Description</label>
                            <textarea
                                id="description"
                                name="description"
                                rows="4"
                                required>${not empty productToEdit ? productToEdit.description : description}</textarea>
                        </div>

                        <!-- IMPORTANT: same backend field name as old working code -->
                        <div class="form-group full-width image-upload-group">
                            <label for="productImage">Product Image</label>

                            <div class="upload-row">

                                <div class="upload-box">
                                    <i class="fa-solid fa-cloud-arrow-up"></i>
                                    <span>Upload Product Image</span>
                                    <p>Choose a product image before adding a new product.</p>

                                    <input
                                        type="file"
                                        id="productImage"
                                        name="productImage"
                                        ${empty productToEdit ? 'required' : ''}>
                                </div>

                                <c:if test="${not empty productToEdit}">
                                    <div class="current-image">
                                        <span>Current Image</span>
                                        <img
                                            src="${contextPath}/resources/product/${productToEdit.productImage}"
                                            alt="${productToEdit.productName}"
                                            onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                    </div>
                                </c:if>

                            </div>
                        </div>

                    </div>

                    <div class="form-actions">
                        <button type="submit" class="save-product-btn">
                            <span>
                                <c:choose>
                                    <c:when test="${not empty productToEdit}">
                                        Update Product
                                    </c:when>
                                    <c:otherwise>
                                        Add Product
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <i class="fa-solid fa-arrow-right"></i>
                        </button>

                        <button type="button" id="cancelProductForm" class="cancel-btn">
                            Cancel
                        </button>
                    </div>

                </form>

            </section>

            <!-- PRODUCTS TABLE -->
            <section class="products-panel">

                <div class="table-container">

                    <table class="products-table">

                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <th>SKU</th>
                                <th>Brand</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Category</th>
                                <th>Rack</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:choose>

                                <c:when test="${not empty products}">

                                    <c:forEach var="product" items="${products}">

                                        <tr>

                                            <td>
                                                <div class="product-thumb">
                                                    <img
                                                        src="${contextPath}/resources/product/${product.productImage}"
                                                        alt="${product.productName}"
                                                        onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                                </div>
                                            </td>

                                            <td>
                                                <div class="product-name-cell">
                                                    <strong>${product.productName}</strong>
                                                    <span>#${product.productId}</span>
                                                </div>
                                            </td>

                                            <td>
                                                <span class="meta-pill">
                                                    <c:out value="${empty product.sku ? 'N/A' : product.sku}" />
                                                </span>
                                            </td>

                                            <td>
                                                <span class="brand-text">
                                                    <c:out value="${empty product.brand ? 'N/A' : product.brand}" />
                                                </span>
                                            </td>

                                            <td>
                                                <p class="description-cell">${product.description}</p>
                                            </td>

                                            <td>
                                                <strong class="price-text">Rs. ${product.price}</strong>
                                            </td>

                                            <td>
                                                <span class="quantity-pill">${product.quantity}</span>
                                            </td>

                                            <td>
                                                <span class="category-pill">${product.category}</span>
                                            </td>

                                            <td>
                                                <span class="rack-pill">
                                                    <c:out value="${empty product.rackNumber ? 'N/A' : product.rackNumber}" />
                                                </span>
                                            </td>

                                            <td>
                                                <div class="action-buttons">

                                                    <a href="${contextPath}/products?action=edit&id=${product.productId}" class="edit-btn">
                                                        <i class="fas fa-edit"></i>
                                                        Edit
                                                    </a>

                                                    <a href="${contextPath}/products?action=delete&id=${product.productId}" class="delete-btn product-delete-link">
                                                        <i class="fas fa-trash"></i>
                                                        Delete
                                                    </a>

                                                </div>
                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="10">
                                            <div class="empty-table">
                                                <i class="fa-solid fa-box-open"></i>
                                                <h3>No products found</h3>
                                                <p>Add your first Corexa product to start building your store inventory.</p>
                                            </div>
                                        </td>
                                    </tr>
                                </c:otherwise>

                            </c:choose>

                        </tbody>

                    </table>

                </div>

            </section>

        </main>

    </div>

</body>
</html>