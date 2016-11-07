/*
 * 
 * 
 * 
 */

function player(){
	var value = $("#player").text() ;
	
	//alert("a标签的值："+value) ;
	
	location.href = "/msspace/ShiPinBoFangServlet?text="+value ;
	
}