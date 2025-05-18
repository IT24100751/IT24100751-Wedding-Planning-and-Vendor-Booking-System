<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Register Vendor" />
    <jsp:param name="active" value="register" />
</jsp:include>

<h1>Register New Vendor</h1>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-user-plus"></i> Vendor Information</h5>
    </div>
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/vendors/register" method="post">
            <div class="form-group">
                <label for="type"><i class="fas fa-tag"></i> Vendor Type:</label>
                <select id="type" name="type" class="form-control" required onchange="showTypeFields()">
                    <option value="">Select Type</option>
                    <option value="Photographer">Photographer</option>
                    <option value="Caterer">Caterer</option>
                    <option value="Venue">Venue</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="name"><i class="fas fa-signature"></i> Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="price"><i class="fas fa-dollar-sign"></i> Price ($):</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" min="0" required>
            </div>

            <div class="form-group">
                <label for="contactInfo"><i class="fas fa-address-card"></i> Contact Information:</label>
                <input type="text" id="contactInfo" name="contactInfo" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="description"><i class="fas fa-info-circle"></i> Description:</label>
                <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
            </div>

            <!-- Photographer specific fields -->
            <div id="photographerFields" class="form-section">
                <h4><i class="fas fa-camera"></i> Photographer Details</h4>
                <div class="form-group">
                    <label for="specialization">Specialization:</label>
                    <input type="text" id="specialization" name="specialization" class="form-control"
                           placeholder="e.g., Portrait, Wedding, Events">
                </div>
                <div class="form-group">
                    <label for="experienceYears">Years of Experience:</label>
                    <input type="number" id="experienceYears" name="experienceYears" class="form-control" min="0">
                </div>
            </div>

            <!-- Caterer specific fields -->
            <div id="catererFields" class="form-section">
                <h4><i class="fas fa-utensils"></i> Caterer Details</h4>
                <div class="form-group">
                    <label for="cuisine">Cuisine Type:</label>
                    <input type="text" id="cuisine" name="cuisine" class="form-control"
                           placeholder="e.g., Italian, Indian, Continental">
                </div>
                <div class="form-group">
                    <label for="maxCapacity">Maximum Capacity:</label>
                    <input type="number" id="maxCapacity" name="maxCapacity" class="form-control" min="0"
                           placeholder="Maximum number of guests">
                </div>
            </div>

            <!-- Venue specific fields -->
            <div id="venueFields" class="form-section">
                <h4><i class="fas fa-building"></i> Venue Details</h4>
                <div class="form-group">
                    <label for="location">Location:</label>
                    <input type="text" id="location" name="location" class="form-control"
                           placeholder="e.g., Downtown, Beachfront, Countryside">
                </div>
                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="number" id="capacity" name="capacity" class="form-control" min="0"
                           placeholder="Maximum number of guests">
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input type="checkbox" id="outdoorOption" name="outdoorOption" class="form-check-input">
                        <label for="outdoorOption" class="form-check-label">Outdoor Option Available</label>
                    </div>
                </div>
            </div>

            <div class="form-group mt-4">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Register Vendor
                </button>
                <a href="${pageContext.request.contextPath}/vendors" class="btn btn-secondary ml-2">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<script>
    function showTypeFields() {
        // Hide all type-specific fields
        document.querySelectorAll('.form-section').forEach(function(section) {
            section.classList.remove('active');
            section.style.display = 'none';
        });

        // Show fields based on selected type
        var selectedType = document.getElementById('type').value;
        if (selectedType === 'Photographer') {
            document.getElementById('photographerFields').style.display = 'block';
        } else if (selectedType === 'Caterer') {
            document.getElementById('catererFields').style.display = 'block';
        } else if (selectedType === 'Venue') {
            document.getElementById('venueFields').style.display = 'block';
        }
    }

    // Initialize on page load
    window.onload = function() {
        showTypeFields();
    };
</script>

<jsp:include page="../common/footer.jsp" />