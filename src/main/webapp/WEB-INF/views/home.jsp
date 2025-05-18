<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="Home" />
    <jsp:param name="active" value="home" />
</jsp:include>

<div class="row">
    <div class="col-12 text-center mb-4">
        <h1>Welcome to Wedding Planner</h1>
        <p class="lead">Your one-stop solution for managing wedding vendors</p>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="card">
            <div class="card-header bg-Photographer">
                <h5 class="mb-0"><i class="fas fa-camera"></i> Photographers</h5>
            </div>
            <div class="card-body">
                <p>Find the perfect photographer to capture your special moments.</p>
                <a href="${pageContext.request.contextPath}/vendors/search?type=Photographer" class="btn btn-outline-primary">
                    <i class="fas fa-search"></i> Find Photographers
                </a>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card">
            <div class="card-header bg-Caterer">
                <h5 class="mb-0"><i class="fas fa-utensils"></i> Caterers</h5>
            </div>
            <div class="card-body">
                <p>Discover caterers who can provide delicious food for your wedding.</p>
                <a href="${pageContext.request.contextPath}/vendors/search?type=Caterer" class="btn btn-outline-primary">
                    <i class="fas fa-search"></i> Find Caterers
                </a>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card">
            <div class="card-header bg-Venue">
                <h5 class="mb-0"><i class="fas fa-building"></i> Venues</h5>
            </div>
            <div class="card-body">
                <p>Explore beautiful venues to host your wedding ceremony and reception.</p>
                <a href="${pageContext.request.contextPath}/vendors/search?type=Venue" class="btn btn-outline-primary">
                    <i class="fas fa-search"></i> Find Venues
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mt-4">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-tasks"></i> Vendor Management</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Manage Your Vendors</h4>
                        <p>Add, update, and remove vendors from your wedding planning list.</p>
                        <a href="${pageContext.request.contextPath}/vendors" class="btn btn-primary">
                            <i class="fas fa-list"></i> View All Vendors
                        </a>
                    </div>
                    <div class="col-md-6">
                        <h4>Add New Vendor</h4>
                        <p>Can't find the vendor you're looking for? Add them to your list.</p>
                        <a href="${pageContext.request.contextPath}/vendors/register" class="btn btn-success">
                            <i class="fas fa-plus"></i> Add New Vendor
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp" />