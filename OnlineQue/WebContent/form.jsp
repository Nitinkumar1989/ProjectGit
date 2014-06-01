<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<html>
<head>
<title>D3 Test</title></head>
<script type="text/javascript" src="JS/data.js"></script>
<script type="text/javascript" src="JS/jquery-2.1.1.min.js"></script>
<style>
.body {
	text-align: center;
	width: 80%;
	height: 80%;
	position: absolute;
	top: 10%;
	left: 10%;
	background: transparent;
}
</style>
<script type="text/javascript">

	var config = false;
	var m0 = "TOTAL";
	var count = 0 ;
	var onlineQue = function(obj){

		if (!config) {
			config = obj.data;
		}


		var lt = $("#container").position().left;
		var tt = $("#container").position().top;
		var margin = {top: 20, right: 20, bottom: 30, left: 40},
	    width = obj.container.clientWidth  - tt,
	    height = obj.container.clientHeight - lt;
		
		function mainfun(d)
		{
				$("#que").html(d.listofstate[count]);
				
				
				 /* $("#op1").html(d.op1[count]).each(function() {
				        if($(this).is(':checked'))
				        $(this).val();
				    });
				 $("#op2").html(d.op2[count]).each(function() {
				        if($(this).is(':checked'))
				        $(this).val();
				    });
				  $("#op3").html(d.op3[count]).each(function() {
				        if($(this).is(':checked'))
				        $(this).val();
				    });
				  $("#op4").html(d.op4[count]).each(function() {
				        if($(this).is(':checked'))
				        $(this).val();
				    });
				 */  
				  $('input[type=radio]').change( function() {
					  
					   alert(this.id);   
					});
		}
		
		$("#next").click(function(event, err){
			$("input:radio").attr("checked", false);
			count++;
			mainfun(obj.data);
		})
		
		mainfun(obj.data);
	return this;
};

	function init()
	{
		var view = new onlineQue({
			data: data,
			container: document.getElementById("container"),
		});
	}

	</script>
</head>
<body onload="init()">
	<div><svg id="container" class="body"></svg></div>
	<table id = "tbl">
		<tr id ="que"></tr>
		<tr id ="op1"><input type="radio" id = "rop1" name="name"</tr>
		<tr id ="op2"><input type="radio" id = "rop2" name="name"></tr>
		<tr id ="op3"><input type="radio" id = "rop3" name="name"></tr>
		<tr id ="op4"><input type="radio" id = "rop4" name="name"></tr>
		<tr>
			<td id ="next"><input type="button" class="button" value="Next"/></td>
			<td id ="submit"><input type="submit" value="submit"></td>
		</tr>
		<table>
</body>
</html>