<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Trade+Winds|Sonsie+One|Butterfly+Kids|Mate+SC|Metamorphous|Amatic+SC' rel='stylesheet' type='text/css'>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=76754811032";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<style type="text/css">
html {
	width: 100%;
	height: 100%;
}

body {
	background-color: #EBEBE0;
	width: 100%;
	height: 100%;
}

.main {
	margin:5em auto;
	width: 1200px;
	height:632px;
}

.content {
	text-align:center;
	height:632px;
	width:800px;
	float:left;
	background-color:white;
	-moz-border-radius: 15px;
	border-radius: 15px;
}

.header {
	height:2em;
	width:100%;
	font-size: 2em;
	text-decoration: none;
}

.header	a:link,.header a:visited,.header a:hover, .header a:active  
{
	text-decoration:none;
	color: black;
}

.header a {
	font-family: 'Mate SC', serif;
}

.social {
	float:right;
	height:400px;
	margin-top: 15%;
	width:312px;
	text-align:center;
	padding: 10px;
	background-color:white;
	-moz-border-radius: 15px;
	border-radius: 15px;
}

.social .link {
	margin-top: 1em;
	margin-bottom: 1em;
}



.content .mainForm {
	margin: 1em auto;
}

.social .wordpress {
	background-image:url('wordpress_icons.jpg');
	background-position: -15px -15px;
	height:125px;
	width:125px;
	margin-left:auto;
	margin-right:auto;
	-moz-border-radius: 65px;
	border-radius: 65px;	
}

</style>
<div class="main">
	<div class="header">
	Please enter an address below.
	</div>
	<div class="content">
		<div class="mainForm">
		<label for="address"> Address:</label>
		<input id="address" type="text"/>
		<label for="hashtag"> Hashtag:</label>
		<input id="hashtag" type="text"/>
		<button id="go">Go!</button>
		<textarea id="results" rows="30" cols="80"></textarea>
		</div>
	</div>
	<div class="social">
	   
	   <div class="link">
	    <a href="http://stackoverflow.com/users/301816/stevebot">
			<img src="http://stackoverflow.com/users/flair/301816.png" width="208" height="58" alt="profile for stevebot at Stack Overflow, Q&amp;A for professional and enthusiast programmers" title="profile for stevebot at Stack Overflow, Q&amp;A for professional and enthusiast programmers">
		</a>
		</div>
		<div class="link">
		<a href="http://www.linkedin.com/pub/stephen-dubois/3a/a50/b48">
	          <img src="http://www.linkedin.com/img/webpromo/btn_viewmy_160x33.png" width="160" height="33" border="0" alt="View Stephen DuBois's profile on LinkedIn">
	    </a>
		</div>
		<div class="link">
			<a href="https://twitter.com/codedforyou" class="twitter-follow-button" data-show-count="false">Follow @codedforyou</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
		</div>
		<div>
		<div class="link">
			<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://www.codedforyou.com" data-via="codedforyou" data-related="codedforyou" data-hashtags="codedforyou">Tweet</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
		</div>
		<div class="link">
			<div class="fb-like" data-href="http://www.codedforyou.com" data-send="true" data-width="200" data-show-faces="false" data-font="arial"></div>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$("#go").click(function(){
			$('results').val("Loading...");
			var address = $('#address').val();
			var hashtag = $('#hashtag').val();
			$.ajax({
				  type: "POST",
				  url: "getTweets.html",
				  data: {address:address, hashtag:hashtag}
				}).done(function( msg ) {
				  	$('#results').val(msg);
				});
		});
	});


</script>
</body>
</html>