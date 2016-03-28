<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.12.1.js"></script>
<!-- <script src="js/you1.js"></script> -->
<script src="http://www.youtube.com/player_api"></script>
<script type="text/javascript">

$(document).ready(function() {
	//Xuj6p9ZblDM 삐에로
	//s6RKZrjzjLY good love
	//CzRb7P7Ze7c 우산
	$("#load-youtube").on("click", function() {
		playlist=new YT.Player('youtube-playlist', {
			events:{'onReady':function(e) {
				var p=e.target;
				p.cuePlaylist([
				               


					"Xuj6p9ZblDM" // Zion.T (자이언티), Crush (크러쉬) - Just (그냥)
					, "s6RKZrjzjLY" // K.will (케이윌), Mamamoo (마마무), Feat. Whee sung (휘성) - Peppermint Chocolate (썸남썸녀)
					, "CzRb7P7Ze7c" // 에디킴 (Eddy Kim) - 밀당의 고수 (Push & Pull)
					,"nYecJyszM6s"
					
				]);
				p.setLoop(true);
				p.setShuffle(true);
			}}
		});
	});
	/* $("#btn").click(function() {
		$("#frame").attr("src","https://www.youtube.com/embed/"+src+"?rel=0&amp;autoplay=1&amp;loop=1;playlist=kwnLH_80JjM");
		
	}); */
});

function srcchange(src){
	//http://kipid.tistory.com/entry/HTML-%EC%97%90%EC%84%9C-%EB%8F%99%EC%98%81%EC%83%81-%EC%97%B0%EC%86%8D-%EC%9E%AC%EC%83%9D%ED%95%98%EA%B8%B0-playlist-shuffle-replay#secId1-2-1
// 유투브 사용법
	
	//Xuj6p9ZblDM 삐에로
	//s6RKZrjzjLY good love
	//CzRb7P7Ze7c 우산
	$("#frame").attr("src","https://www.youtube.com/embed/"+src+"?rel=0&amp;autoplay=1&amp;loop=1;playlist=kwnLH_80JjM");
}




/* 
playlist=new YT.Player('youtube-playlist', {
	events:{'onReady':function(e) {
		var p=e.target;
		p.cuePlaylist([
			"Skhwqq-iGQM" // Zion.T (자이언티), Crush (크러쉬) - Just (그냥)
			, "R0W-voiYpQk" // K.will (케이윌), Mamamoo (마마무), Feat. Whee sung (휘성) - Peppermint Chocolate (썸남썸녀)
			, "ftCCmMeqXds" // 에디킴 (Eddy Kim) - 밀당의 고수 (Push & Pull)
			, "t0x98vf62_k" // 에디킴 (Eddy Kim) - My Love
			, "OPf0YbXqDm0" // Mark Ronson - Uptown Funk
			, "pB-5XG-DbAA" // Sam Smith - Stay With Me
			, "gEqlF5N8UMs" // Winner - 공허해
		]);
		p.setLoop(true);
		p.setShuffle(true);
	}}
}) */
</script>
</head>
<body>
<input type="button" id="load-youtube" value="유투브 목록 가져오자">

//Xuj6p9ZblDM 삐에로 <br>
//s6RKZrjzjLY 우산<br>
//CzRb7P7Ze7c good love<br>
	<br>
<input type="text" id="src_input"> 
<button type="button" id="btn" onclick="srcchange($('#src_input').val())">클릭하면 재생되지</button>
<br>
	<div id="youtube-playlist"></div> 
	<!-- <IFRAME id="frame" height=540
		src="https://www.youtube.com/embed/CzRb7P7Ze7c?rel=0&amp;autoplay=1&amp;loop=1;playlist=kwnLH_80JjM"
		frameBorder=0 width=720 allowfullscreen></IFRAME> -->
		
	<!-- 	<IFRAME height=540
		src="https://www.youtube.com/embed/s6RKZrjzjLY?rel=0&amp;autoplay=0&amp;loop=1;playlist=kwnLH_80JjM"
		frameBorder=0 width=720 allowfullscreen></IFRAME>
 -->

</body>
</html>