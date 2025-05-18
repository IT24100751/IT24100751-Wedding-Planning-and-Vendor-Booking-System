<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Edit Vendor" />
    <jsp:param name="active" value="vendors" />
</jsp:include>

<h1>Edit Vendor</h1>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-edit"></i> Edit Vendor Information</h5>
    </div>
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/vendors/${vendor.id}/edit" method="post">
            <div class="form-group">
                <label for="type"><i class="fas fa-tag"></i> Vendor Type:</label>
                <input type="text" id="type" class="form-control" value="${vendor.type}" readonly>
            </div>

            <div class="form-group">
                <label for="name"><i class="fas fa-signature"></i> Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${vendor.name}" required>
            </div>

            <div class="form-group">
                <label for="price"><i class="fas fa-dollar-sign"></i> Price ($):</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" min="0" value="${vendor.price}" required>
            </div>

            <div class="form-group">
                <label for="contactInfo"><i class="fas fa-address-card"></i> Contact Information:</label>
                <input type="text" id="contactInfo" name="contactInfo" class="form-control" value="${vendor.contactInfo}" required>
            </div>

            <div class="form-group">
                <label for="description"><i class="fas fa-info-circle"></i> Description:</label>
                <textarea id="description" name="description" class="form-control" rows="3" required>${vendor.description}</textarea>
            </div>

            <c:choose>
                <c:when test="${vendor.type == 'Photographer'}">
                    <div id="photographerFields" class="form-section" style="display: block;">
                        <h4><i class="fas fa-camera"></i> Photographer Details</h4>
                        <div class="form-group">
                            <label for="specialization">Specialization:</label>
                            <input type="text" id="specialization" name="specialization" class="form-control" value="${vendor.specialization}">
                        </div>
                        <div class="form-group">
                            <label for="experienceYears">Years of Experience:</label>
                            <input type="number" id="experienceYears" name="experienceYears" class="form-control" min="0" value="${vendor.experienceYears}">
                        </div>
                    </div>
                </c:when>
                <c:when test="${vendor.type == 'Caterer'}">
                    <div id="catererFields" class="form-section" style="display: block;">
                        <h4><i class="fas fa-utensils"></i> Caterer Details</h4>
                        <div class="form-group">
                            <label for="cuisine">Cuisine Type:</label>
                            <input type="text" id="cuisine" name="cuisine" class="form-control" value="${vendor.cuisine}">
                        </div>
                        <div class="form-group">
                            <label for="maxCapacity">Maximum Capacity:</label>
                            <input type="number" id="maxCapacity" name="maxCapacity" class="form-control" min="0" value="${vendor.maxCapacity}">
                        </div>
                    </div>
                </c:when>
                <c:when test="${vendor.type == 'Venue'}">
                    <div id="venueFields" class="form-section" style="display: block;">
                        <h4><i class="fas fa-building"></i> Venue Details</h4>
                        <div class="form-group">
                            <label for="location">Location:</label>
                            <input type="text" id="location" name="location" class="form-control" value="${vendor.location}">
                        </div>
                        <div class="form-group">
                            <label for="capacity">Capacity:</label>
                            <input type="number" id="capacity" name="capacity" class="form-control" min="0" value="${vendor.capacity}">
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input type="checkbox" id="outdoorOption" name="outdoorOption" class="form-check-input" ${vendor.outdoorOption ? 'checked' : ''}>
                                <label for="outdoorOption" class="form-check-label">Outdoor Option Available</label>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>

            <div class="form-group mt-4">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Update Vendor
                </button>
                <a href="${pageContext.request.contextPath}/vendors" class="btn btn-secondary ml-2">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />