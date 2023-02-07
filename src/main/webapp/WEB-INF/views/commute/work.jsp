<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sche1
  Date: 2022-10-05
  Time: 오후 2:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>WORK</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    #out {
        width: 100%;
        text-align: center;
    }
    #in {
        display: inline-block;
    }

    table {
        border-collapse: collapse;
        border-spacing: 0;
    }
    section.notice {
        padding: 80px 0;
    }

    .page-title {
        margin-bottom: 60px;
    }
    .page-title h3 {
        font-size: 28px;
        color: #333333;
        font-weight: 400;
        text-align: center;
    }

    #board-search .search-window {
        padding: 15px 0;
        background-color: #f9f7f9;
    }
    #board-search .search-window .search-wrap {
        position: relative;
        /*   padding-right: 124px; */
        margin: 0 auto;
        width: 80%;
        max-width: 564px;
    }
    #board-search .search-window .search-wrap input {
        height: 40px;
        width: 100%;
        font-size: 14px;
        padding: 7px 14px;
        border: 1px solid #ccc;
    }
    #board-search .search-window .search-wrap input:focus {
        border-color: #333;
        outline: 0;
        border-width: 1px;
    }
    #board-search .search-window .search-wrap .btn {
        position: absolute;
        right: 0;
        top: 0;
        bottom: 0;
        width: 108px;
        padding: 0;
        font-size: 16px;
    }

    .board-table {
        font-size: 13px;
        width: 100%;
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }

    .board-table a {
        color: #333;
        display: inline-block;
        line-height: 1.4;
        word-break: break-all;
        vertical-align: middle;
    }
    .board-table a:hover {
        text-decoration: underline;
    }
    .board-table th {
        text-align: center;
    }

    .board-table .th-num {
        width: 100px;
        text-align: center;
    }

    .board-table .th-date {
        width: 200px;
    }

    .board-table th, .board-table td {
        padding: 14px 0;
    }

    .board-table tbody td {
        border-top: 1px solid #e7e7e7;
        text-align: center;
    }

    .board-table tbody th {
        padding-left: 28px;
        padding-right: 14px;
        border-top: 1px solid #e7e7e7;
        text-align: left;
    }

    .board-table tbody th p{
        display: none;
    }


    * {
        list-style: none;
        text-decoration: none;
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    .container {
        width: 1500px;
        margin: 0 auto;
    }
</style>
<script>
    function work () {
        $('#startBtn').click(function () {

            // var options = {
            //     enableHighAccuracy: true,
            //     timeout: 5000,
            //     maximumAge: 0
            // };
            //
            // function success(position) {
            //     //좌표를 알아낼 수 있는데, 여기서 알아낸 좌표를 kakaoAPI url에 사용할 것이다.
            //     console.log('위도 : ' + position.coords.latitude);
            //     console.log('경도: ' + position.coords.longitude);
            // };
            //
            // function error(err) {
            //     console.warn('ERROR(' + err.code + '): ' + err.message);
            // };
            //
            // navigator.geolocation.getCurrentPosition(success, error, options);



            var options = {
                enableHighAccuracy : true,
                timeout : 5000,
                maximumAge : 0
            };
            function success(pos) {
                var crd = pos.coords;
                console.log('위도 : ' + crd.latitude);
                console.log('경도: ' + crd.longitude);
                lat = crd.latitude;
                lon = crd.longitude;

                    $.ajax({
                            url : 'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=' + lon +'&y=' + lat,
                            type : 'GET',
                            headers : {
                                'Authorization' : 'KakaoAK 81be5506637cd78e81104aecd18cadf2'
                            },
                            success : function(data) {
                                console.log(data);
                            },
                        error : function(data) {
                        console.log(data);
                    }
                });
            };

            function error(err) {
                console.warn('ERROR(' + err.code + '): ' + err.message);
            };

            navigator.geolocation.getCurrentPosition(success, error, options);

            var id = $('#id').val();
            $.ajax({
                type: "POST",
                url: "/startWork",
                dataType: "json",
                data: {
                    id: id,
                    startlocation: address_name
                },
                success: function (data) {
                    result:data,
                        alert("성공");
                },
                error: function (data) {
                    result:data
                    alert("실패");

                },
            });
        });



    }
$(work)


</script>
<body>
<a href="/member/myPage" style="color: #333333">마이페이지</a>
<a href="/commute/work" style="color: #333333">출퇴근등록</a>
<a href="" style="color: #333333">연장근무신청</a>
<a href="" style="color: #333333">휴가신청</a>
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>출퇴근등록</h3>
        </div>
    </div>

    <div id="board-list">
        <div class="container">

            <c:if test="${empty sessionScope.id}">
                <div style="text-align: right">
                    <a style='color:black' href = '<%=request.getContextPath() %>/member/login'>로그인</a>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.id}">
                <div style="text-align: right">
                    <h5>${id}님 <a style='color:black' href = '<%=request.getContextPath() %>/member/logout'>로그아웃</a></h5>
                </div>
            </c:if>
                <button type='button' class='btn btn-primary' id='startBtn'>출근</button>
                <button type='button' class='btn btn-primary' id='endBtn'>퇴근</button>
                <input type='date' id='endTime' name='endTime' class="form-control" style="width: 150px; float: right;">
                <button type='button' class='btn btn-outline-primary' id='endDate' disabled style="float: right">종료일</button>
                <input type='date' id='startTime' name='startTime' class="form-control" style="width: 150px; float: right;">
                <button type='button' class='btn btn-outline-primary' id='startDate' disabled style="float: right">시작일</button>
            <table class="board-table">
                <thead>
                <tr>
                    <th>출근시간</th>
                    <th>출근위치</th>
                    <th>퇴근시간</th>
                    <th>퇴근위치</th>
                    <th>근무시간</th>
                    <th>규정퇴근시간준수여부</th>
                </tr>
                </thead>
                <tbody>
                    <tr style="width: 100rem">
                            <td>${commute.starttime}</td>
                            <td>${commute.startlocation}</td>
                            <td>${commute.endtime}</td>
                            <td>${commute.endlocation}</td>
                            <td>${commute.starttime - commute.endtime}</td>
                            <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</section>
</body>
</html>