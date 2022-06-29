<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>카카오mapapi사용</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mk81pxl37n"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1c2c6824adf9d857eb9ea8f41dde8ba"></script>
   <script type="text/javascript" src="../js/01.js"></script>
   <link rel="stylesheet" href="../css/01.css">
   <link rel="stylesheet" href="../css/mediaquery.css">
</head>
<body>
<div id="map" style="width:100%;height:95vh;"></div>
<script id="data">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.47922092, 126.8918621), // 지도의 중심좌표
    level:7 // 지도의 확대 레벨 
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//처음에 현재위치로 중심좌표 변경
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
//GeoLocation을 이용해서 접속 위치를 얻어옵니다
navigator.geolocation.getCurrentPosition(function(position) {
  
  var lat = position.coords.latitude, // 위도
      lon = position.coords.longitude; // 경도
  
  var locPosition = new kakao.maps.LatLng(lat, lon);
  map.setCenter(locPosition);         
});
} else {
 var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
 map.setCenter(locPosition);
 alert("현재위치 사용 불가!!");   
}



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

kakao.maps.event.addListener(marker, 'click', (function (marker, i) {
    return function () {
        //html로 표시될 인포 윈도우의 내용
        infowindow.setContent(BUS_STOP[i][0]);
        //인포윈도우가 표시될 위치
        infowindow.open(map, marker);
    }
})(marker, i));

if (marker) {
    marker.addListener('click', function () {
        //중심 위치를 클릭된 마커의 위치로 변경
        map.setCenter(this.getPosition());
        //마커 클릭 시의 줌 변화
        map.setZoom(17);
    });
}



var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'zoom_changed', function() {        
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    
    console.log("현재 zoom level : " + level)
    
    if (level <= 5) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
    }
    else {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
    }
});



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
	new kakao.maps.LatLng(37.50901089, 126.8420066),
	new kakao.maps.LatLng(37.508418, 126.837237)
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


var distance = polyline1.getLength();
console.log("거리 : " + distance)


//선 거리 계산하기
var distance = Math.round(polyline1.getLength() + polyline2.getLength() + polyline3.getLength());
// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
var walkkTime = distance / 67 | 0;
var walkHour = '', walkMin = '';

// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
       if (walkkTime > 60) {
           walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
       }
       walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

       // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
       var bycicleTime = distance / 227 | 0;
       var bycicleHour = '', bycicleMin = '';

       // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
       if (bycicleTime > 60) {
           bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
       }
       bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

       // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
       var content = '<ul class="dotOverlay distanceInfo">';
       content += '    <li>';
       content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
       content += '    </li>';
       content += '    <li>';
       content += '        <span class="label">도보</span>' + walkHour + walkMin;
       content += '    </li>';
       content += '    <li>';
       content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
       content += '    </li>';
       content += '</ul>'

   
   
//커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(37.47922092, 126.8918621);  

//커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
 position: position,
 content: content,
 xAnchor: 0,
 yAnchor: 0,
 zIndex: 3 
});

//커스텀 오버레이를 지도에 표시합니다
customOverlay.setMap(map);




</script>
</body>
</html>