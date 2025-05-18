<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</div>

<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h3>Wedding Planner</h3>
                <p>Your one-stop solution for wedding planning. Find the best vendors for your special day.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/vendors">Vendors</a></li>
                    <li><a href="${pageContext.request.contextPath}/vendors/register">Add Vendor</a></li>
                    <li><a href="${pageContext.request.contextPath}/vendors/search">Search</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p>
                    <i class="fas fa-map-marker-alt"></i> 123 Wedding Street, City<br>
                    <i class="fas fa-phone"></i> (123) 456-7890<br>
                    <i class="fas fa-envelope"></i> info@weddingplanner.com
                </p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; ${java.time.Year.now().getValue()} Wedding Planner. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>