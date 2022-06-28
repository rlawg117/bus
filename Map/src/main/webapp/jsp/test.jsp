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
</head>
<body>
<div id="map" style="width:100%;height:800px;"></div>
<script id="data">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 10 // 지도의 확대 레벨 
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



/* var positions = [
    {lat: 37.51130452596103,lng: 127.04542646710686, },
    {lat: 37.4772540117351,lng: 127.045480690923}
]; */

/* var po = ['살루쪼','일공공일안경콘택트 강남포이점']; */

//마커 이미지의 이미지 주소입니다
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
    title : positions[i].arsId, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
}


</script>
</body>
</html>