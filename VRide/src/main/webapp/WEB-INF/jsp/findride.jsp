<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <title>Find Ride</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<!-- Navbar start -->
<div id="nav-placeholder">
</div>
<script>
	$(function(){
  		$("#nav-placeholder").load("navbar.html");
	});
</script>
<div class="container">
  <h2>Find Ride</h2>
  <form action="/searchRide" method="post">
    <div class="form-group">
      <label for=StartLocation>Start Point:</label>
         <c:if test="${empty ride_start_point}">
   		<input type="text" class="form-control" id="StartLocation" placeholder="Enter the Start location" name="ride_start_point">
		</c:if>
      	<c:if test="${not empty ride_start_point}">${ride_start_point}</c:if>
    </div>
    <div class="form-group">
      <label for="EndLocation">Drop Location:</label>
      <c:if test="${empty ride_end_point}">
   		<input type="text" class="form-control" id="EndLocation" placeholder="Enter End Location" name="ride_end_point">
		</c:if>
      
      	<c:if test="${not empty ride_end_point}">${ride_end_point}</c:if>
    </div>
    <div class="form-group">
      <label for="date">Date:</label>
        <c:if test="${empty ride_start_date}">
   		<input type="date" class="form-control" id="date"  name="ride_start_date">
		</c:if>
      <c:if test="${not empty ride_start_date}">${ride_start_date}</c:if>
    </div>
     
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
  

<div class="container">
<c:choose>
<c:when test="${empty offerRideList && not empty ride_start_date}  "> No rides available for your request</c:when>
<c:otherwise>
<h2>Available rides :</h2>
<ul>
			<c:forEach var="listValue" items="${offerRideList}">
				<li>${listValue.offerFirstName} ${listValue.offerLastName} ${listValue.ride_start_time} ${listValue.offerContatcNumber}contactnumber ${listValue.seats_available} seats available<a class="btn btn-danger" href="acceptRide?or_id=${listValue.or_id}">Accept</a></li> 
			</c:forEach>
		</ul>
</c:otherwise>
</c:choose>
		
</div>
</div>
    
    
<br>

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p class="love"><center><small>&copy; Copyright 2020, VRide CarPooling System</small></center> </p>
</footer>
</body>
</html>
