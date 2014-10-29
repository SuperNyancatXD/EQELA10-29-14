<% include header.html.t %>
<script src="/template/ajax.js"></script>
<script>
function post_form() {
	 var text1 = document.getElementById('text1').value;
     var text2 = document.getElementById('text2').value;
     ajax_post_json("/hand",
            { "sender"  : text1, "message" : text2 }, null);
		document.getElementById('aaa').innerHTML = text1;
		document.getElementById('bbb').innerHTML = text2;
	ajax_get_json("/hand", function(o) {
		var text = "";
		for (i = 0; i < o.messagearr.length; i++) {
    		text += o.senderarr[i] + ":";
			text += o.messagearr[i] + "<br>";
			
}
	document.getElementById('ccc').innerHTML = text;
	});
document.getElementById('aaa').innerHTML = "";
document.getElementById('bbb').innerHTML = "";
}

</script>
<form>
<input type="text" id="text1" />
<input type="text" id="text2" />
</form>
<p id = "aaa"></p>
<p id = "bbb"></p>
<button onclick="post_form() ">SEND</button>
<p id = "ccc"></p>
<% include footer.html.t %>