package com.corexa.controller;


import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import com.corexa.model.ProductModel; 
import com.corexa.service.ProductService; 

import com.corexa.util.RedirectionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * 
 * 
 */


@WebServlet(asyncSupported = true, urlPatterns = { "/home", "/" })
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //Declare and initialize ProductService
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        //Get all products from service
        List<ProductModel> productList = productService.getFewProducts();
        if (productList == null) {
        	productList = new ArrayList<>();
        }
        //Set in request scope for JSP
        request.setAttribute("products", productList);

        //Forward to home.jsp
        request.getRequestDispatcher(RedirectionUtil.homeUrl).forward(request, response);
    }
}