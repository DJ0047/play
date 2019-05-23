<%@page import="report.dao.PlayDao"%>
<%@page import="report.model.Play"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WELCOME TO MY PL@YGROUND</title>
<link href="./css/nomalize.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<style>
@import
	url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400);

body {
	background-color: #000;
}

.container {
	height: 1100px;
	text-align: center;
	font-family: 'Source Sans Pro', sans-serif;
	font-weight: 300;
	color: rgba(255, 255, 255, 0.5);
	padding: 0 100px;
}

h1 {
	font-size: 120px;
	padding-top: 250px;
	font-weight: 600;
	color: rgba(255, 255, 255, 0.8);
}

h3 {
	font-weight: 500;
	font-size: 50px;
	color: rgba(255, 255, 255, 0.8);
}

h4 {
	font-weight: 300;
	font-size: 20px;
	color: rgba(255, 255, 255, 1);
}

p {
	color: #fff
}
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	List<Play> list = PlayDao.searchDateAll(id);
%>
<body>
	<%
		for (int i = 0; i < list.size(); i++) {
	%>
	<div class="container"
		style="background: url(../upload/<%=list.get(i).getFileName()%>) no-repeat center top fixed;">
		<h1>
			<%=list.get(i).getTitle()%>
		</h1>
		<h3><%=list.get(i).getRegdate()%></h3>

		<h3><%=list.get(i).getLocation()%></h3>
		<br>
		<h4><%=list.get(i).getReview()%></h4>
	</div>
	<%
		}
	%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="./js/bootstrap.min.js"></script>
	<script>
      /**
       * Author: Heather Corey
       * jQuery Simple Parallax Plugin
       *
       */
       
      (function($) {
       
          $.fn.parallax = function(options) {
       
              var windowHeight = $(window).height();
       
              // Establish default settings
              var settings = $.extend({
                  speed        : 0.15
              }, options);
       
              // Iterate over each object in collection
              return this.each( function() {
       
                // Save a reference to the element
                var $this = $(this);
       
                // Set up Scroll Handler
                $(document).scroll(function(){
       
                      var scrollTop = $(window).scrollTop();
                            var offset = $this.offset().top;
                            var height = $this.outerHeight();
       
              // Check if above or below viewport
            if (offset + height <= scrollTop || offset >= scrollTop + windowHeight) {
              return;
            }
       
            var yBgPosition = Math.round((offset - scrollTop) * settings.speed);
       
                       // Apply the Y Background Position to Set the Parallax Effect
                $this.css('background-position', 'center ' + yBgPosition + 'px');
                      
                });
              });
          }
      }(jQuery));

      $('.content1').parallax({
        speed : 0.15
      });

      $('.content2').parallax({
        speed : 0.2
});
    </script>

</body>
</html>