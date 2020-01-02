<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Demo</title>
<meta charset="utf-8">
<style>
div {
color: red;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>

<select name="locality">
<option>Pune</option>
<option selected="selected">Camp</option>
<option>Mumbai</option>
<option selected="selected">abc</option>
<option>Solapur</option>
<option>Satara</option>
</select>
<div></div>

<script>
$("select")
.change(function (){
	var str="";
	$("select option:selected").each (function () {
		str += $(this).text()+"";
});
	$("div").text(str);
})
.change();
</script>
<%


%>
</body>
</html>