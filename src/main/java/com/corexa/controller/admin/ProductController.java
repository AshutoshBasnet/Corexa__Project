package com.corexa.controller.admin;

import java.io.IOException;


import com.corexa.model.ProductModel;
import com.corexa.service.ProductService;
import com.corexa.util.ImageUtil;
import com.corexa.util.RedirectionUtil;
import com.corexa.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * ProductController is responsible for handling products requests. It interacts with
 * the ProductService to manage products.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/products" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductController extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    private final ImageUtil imageUtil = new ImageUtil();
    private final ProductService productService = new ProductService();

    /**
	 * Handles GET requests by retrieving products information and 
	 * forwarding request to the products page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        // Check for success message in session
        String success = (String) req.getSession().getAttribute("success");
        if (success != null) {
            req.setAttribute("success", success);
            req.getSession().removeAttribute("success");
        }
        
        String action = req.getParameter("action");
        
        try {
            if ("edit".equals(action)) {
                int productId = Integer.parseInt(req.getParameter("id"));
                ProductModel product = productService.getProductById(productId);
                if (product == null) {
                    handleError(req, resp, "Product not found", "/products", null);
                    return;
                }
                req.setAttribute("productToEdit", product);
                req.setAttribute("showForm", true);
                req.setAttribute("isEditMode", true);
                req.setAttribute("action", "update");
            } else if ("delete".equals(action)) {
                int productId = Integer.parseInt(req.getParameter("id"));
                boolean isDeleted = productService.deleteProduct(productId);
                if (isDeleted) {
                    handleSuccess(req, resp, "Product deleted successfully!", "/products");
                } else {
                    handleError(req, resp, "Failed to delete product", "/products", null);
                }
                return;
            }
        } catch (NumberFormatException e) {
            handleError(req, resp, "Invalid product ID", "/products", null);
            return;
        }
        
        req.setAttribute("products", productService.getAllProducts());
        req.getRequestDispatcher(RedirectionUtil.productsUrl).forward(req, resp);
    }

    /**
	 * Handles POST requests for handling add and update actions.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            
            if ("add".equals(action) || "update".equals(action)) {
                String validationMessage = validateProductForm(req);
                if (validationMessage != null) {
                    handleError(req, resp, validationMessage, "/products", action);
                    return;
                }

                ProductModel productModel = extractProductModel(req);
                boolean result;
                
                if ("add".equals(action)) {
                    result = productService.addProduct(productModel);
                } else {
                    result = productService.updateProduct(productModel);
                }

                if (result) {
                    if (uploadImage(req)) {
                        handleSuccess(req, resp, 
                            "Product " + ("add".equals(action) ? "added" : "updated") + " successfully!", 
                            "/products");
                    } else {
                        handleError(req, resp, 
                            "Product saved but image upload failed", 
                            "/products", action);
                    }
                } else {
                    handleError(req, resp, "Failed to save product", "/products", action);
                }
            }
        } catch (Exception e) {
            handleError(req, resp, "An unexpected error occurred: " + e.getMessage(), 
                "/products", req.getParameter("action"));
            e.printStackTrace();
        }
    }

	/**
	 * Validates product form by setting attributes.
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 */    
    private String validateProductForm(HttpServletRequest req) {
        String productName = req.getParameter("productName");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String quantityStr = req.getParameter("quantity");
        String category = req.getParameter("category");
        String sku = req.getParameter("sku");
        String brand = req.getParameter("brand");
        String rackNumber = req.getParameter("rackNumber");

        // Basic validation
        if (ValidationUtil.isNullOrEmpty(productName))
            return "Product name is required.";
        if (ValidationUtil.isNullOrEmpty(description))
            return "Description is required.";
        if (ValidationUtil.isNullOrEmpty(priceStr))
            return "Price is required.";
        if (ValidationUtil.isNullOrEmpty(quantityStr))
            return "Quantity is required.";
        if (ValidationUtil.isNullOrEmpty(category))
            return "Category is required.";
        if (ValidationUtil.isNullOrEmpty(sku))
            return "SKU is required.";
        if (ValidationUtil.isNullOrEmpty(brand))
            return "Brand is required.";
        if (ValidationUtil.isNullOrEmpty(rackNumber))
            return "Rack number is required.";

        try {
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);
            
            if (price <= 0) return "Price must be positive.";
            if (quantity < 0) return "Quantity cannot be negative.";
        } catch (NumberFormatException e) {
            return "Invalid number format for price or quantity.";
        }

        try {
            int productId = 0;
            if (!ValidationUtil.isNullOrEmpty(req.getParameter("productId"))) {
                productId = Integer.parseInt(req.getParameter("productId"));
            }
            if (productService.isSkuExists(sku, productId)) {
                return "SKU already exists. Please use a unique SKU.";
            }
        } catch (Exception e) {
            return "Error checking SKU uniqueness. Please try again later.";
        }

        try {
            Part image = req.getPart("productImage");
            if (image != null && image.getSize() > 0) {
                if (!ValidationUtil.isValidImageExtension(image)) {
                    return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
                }
            }
        } catch (IOException | ServletException e) {
            return "Error processing image upload.";
        }

        return null;
    }
    
    /**
	 * Extracts product model by setting attributes.
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 */    
    private ProductModel extractProductModel(HttpServletRequest req) throws Exception {
        int productId = 0;
        if (req.getParameter("productId") != null && !req.getParameter("productId").isEmpty()) {
            productId = Integer.parseInt(req.getParameter("productId"));
        }
        
        String productName = req.getParameter("productName");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String category = req.getParameter("category");
        String sku = req.getParameter("sku");
        String brand = req.getParameter("brand");
        String rackNumber = req.getParameter("rackNumber");

        Part imagePart = req.getPart("productImage");
        String imageUrl = null;
        
        if (imagePart != null && imagePart.getSize() > 0) {
            imageUrl = imageUtil.getImageNameFromPart(imagePart);
        } else if (productId > 0) {
            ProductModel existing = productService.getProductById(productId);
            if (existing != null) {
                imageUrl = existing.getProductImage();
            }
        }

        return new ProductModel(productId, productName, description, price, quantity, category, imageUrl, sku, brand,
                rackNumber);
    }

    /**
	 * Upload image by root path.
	 *
	 * @param req         HttpServletRequest object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */ 
    private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
	    Part image = req.getPart("productImage");
	    String rootPath = req.getServletContext().getRealPath("/");
	    return imageUtil.uploadImage(image, rootPath, "product");
	}
    
    
    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, 
            String message, String redirectUrl) throws IOException {
        req.getSession().setAttribute("success", message);
        resp.sendRedirect(req.getContextPath() + redirectUrl);
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, 
            String message, String redirectUrl, String action) throws ServletException, IOException {
        req.setAttribute("error", message);
        req.setAttribute("productName", req.getParameter("productName"));
        req.setAttribute("description", req.getParameter("description"));
        req.setAttribute("price", req.getParameter("price"));
        req.setAttribute("quantity", req.getParameter("quantity"));
        req.setAttribute("category", req.getParameter("category"));
        req.setAttribute("sku", req.getParameter("sku"));
        req.setAttribute("brand", req.getParameter("brand"));
        req.setAttribute("rackNumber", req.getParameter("rackNumber"));
        
        req.setAttribute("showForm", true);
        req.setAttribute("isEditMode", "update".equals(action));
        
        if ("update".equals(action)) {
            try {
                req.setAttribute("productToEdit", new ProductModel(
                    Integer.parseInt(req.getParameter("productId")),
                    req.getParameter("productName"),
                    req.getParameter("description"),
                    Double.parseDouble(req.getParameter("price")),
                    Integer.parseInt(req.getParameter("quantity")),
                    req.getParameter("category"),
                    null,
                    req.getParameter("sku"),
                    req.getParameter("brand"),
                    req.getParameter("rackNumber")
                ));
            } catch (NumberFormatException e) {
                req.setAttribute("isEditMode", false);
            }
        }
        
        req.setAttribute("products", productService.getAllProducts());
        req.getRequestDispatcher(RedirectionUtil.productsUrl).forward(req, resp);
    }
}
