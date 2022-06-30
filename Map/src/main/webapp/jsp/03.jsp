<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>환승 버스 정류장 확인하기</title>
<link rel="stylesheet" href="../css/03.css">
<link rel="stylesheet" href="../css/mediaquery.css">
<script type="text/javascript" src="../js/02.js" charset="utf-8"></script>
<script src="jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
<div class="map_wrap">
<button type="button"><a href="00.jsp">뒤로가기</a> </button>
    <div id="map" style="width:100%;height:95vh;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" style="background-color: #fff; " >
        <div class="option">
        <b><p style="font-size: 15px">차량별 승,하차 지점 확인하기</p></b>
            <div>
       			<button class="custom-btn btn-7" onclick="setnum1()"> <span>943번 승차지점</span> </button>
                <button class="custom-btn btn-7" onclick="setnum2()"> <span>943번 하차지점</span> </button>
                <button class="custom-btn btn-7" onclick="setnum3()"> <span>700번 승차지점</span> </button>
                <button class="custom-btn btn-7" onclick="setnum4()"> <span>700번 하차지점</span> </button>
                <button class="custom-btn btn-7" onclick="setnum5()"> <span>1001번 승차지점</span> </button>
                <button class="custom-btn btn-7" onclick="setnum6()"> <span>1001번 하차지점</span> </button>
            </div>
        </div>
        <hr>
        <div class="busstop">
        
        	<b><p class="pfont bus">943번 버스</p></b>
        	<p class="pfont"> 8 정류장</p>
        	<p class="pfont">가리봉파출소 승차</p>
        	<p class="pfont">신정현대아파트.서부트럭터미널 하차</p>
        </div>
        <hr>
        <div >
        	<b><p class="pfont bus">700번 버스</p></b>
        	<p class="pfont"> 16 정류장</p>
        	<p class="pfont">신정현대아파트.서부트럭터미널 승차</p>
        	<p class="pfont">부천 터미널 소풍 하차</p>
        </div>
        <hr>
        <div >
        	<b><p class="pfont bus">1001번 버스</p></b>
        	<p class="pfont"> 3 정류장</p>
        	<p class="pfont">상동역8번출구.세이브존 승차</p>
        	<p class="pfont">진달래대우.라일락신성아파트 하차</p>
        </div>
        <hr>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1c2c6824adf9d857eb9ea8f41dde8ba&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.47922092, 126.8918621), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

var markers=[];
var imageSrc = "../resource/busicon.png"; 
for (var i = 0; i < positions.length; i ++) {
// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(10, 10); 
// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: new kakao.maps.LatLng(positions[i].posY, positions[i].posX), // 마커를 표시할 위치
    title : po[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
markers.push(marker);
}



//선 그릴 좌표들
var linePath1 = [
   //1. 643버스

	new kakao.maps.LatLng(37.47922092, 126.8918621),
	new kakao.maps.LatLng(37.48011533, 126.8887535),
	new kakao.maps.LatLng(37.48974303, 126.8758257),
	new kakao.maps.LatLng(37.4927, 126.8673333),
	new kakao.maps.LatLng(37.4938619, 126.8563774),
	new kakao.maps.LatLng(37.50080998, 126.8472236),
	new kakao.maps.LatLng(37.50742085, 126.8439634),
	new kakao.maps.LatLng(37.50901089, 126.8420066)
   ];
   
var linePath2 = [

   //2. 700번
   new kakao.maps.LatLng(37.50901089,126.8420066),
   new kakao.maps.LatLng(37.50669905,126.8357222),
   new kakao.maps.LatLng(37.50640132,126.8284512),
   new kakao.maps.LatLng(37.50645,126.8102),
   new kakao.maps.LatLng(37.50695,126.8048),
   new kakao.maps.LatLng(37.5059,126.7989667),
   new kakao.maps.LatLng(37.5051333,126.79415),
   new kakao.maps.LatLng(37.5043833,126.7904167),
   new kakao.maps.LatLng(37.50355,126.7850667),
   new kakao.maps.LatLng(37.5031333,126.7829667),
   new kakao.maps.LatLng(37.5028667,126.77895),
   new kakao.maps.LatLng(37.5037,126.7728833),
   new kakao.maps.LatLng(37.50435,126.768),
   new kakao.maps.LatLng(37.50465,126.76575),
   new kakao.maps.LatLng(37.5052,126.7611667),
   new kakao.maps.LatLng(37.5044,126.75775)
   ];
   
   
var linePath3 = [

   //3. 급행 1001
   new kakao.maps.LatLng(37.506, 126.7551),
   new kakao.maps.LatLng(37.50665, 126.7534667),
   new kakao.maps.LatLng(37.5082167, 126.7537833),
   new kakao.maps.LatLng(37.5105167, 126.75425)
  ];

    
    


var polyline1 = new kakao.maps.Polyline({
    path: linePath1, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#34c902', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline1.setMap(map);


var polyline2 = new kakao.maps.Polyline({
    path: linePath2, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#F31010', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline2.setMap(map);

var polyline3 = new kakao.maps.Polyline({
    path: linePath3, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#B019B9', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline3.setMap(map);

 
 
function setnum1() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.47922092, 126.8918621);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    map.setLevel(1);
}
function setnum2() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.50901089, 126.8420066);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    map.setLevel(1);
}
function setnum3() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.50901089,126.8420066);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    map.setLevel(1);
}
function setnum4() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.5044,126.75775);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    map.setLevel(1);
}
function setnum5() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.506, 126.7551);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    map.setLevel(1);
}
function setnum6() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(37.5105167, 126.75425);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
    map.setLevel(1);
}
 
 
</script>
</body>
</html>