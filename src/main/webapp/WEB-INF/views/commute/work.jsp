<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

    nav {
        height: 75px;
        padding: 1rem;
        color: white;
        background: #EBFBFF;
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-between;
        align-items: center;
    }
</style>
<script>
    $(document).ready(function () {
            var options = {
                enableHighAccuracy : true,
                timeout : 5000,
                maximumAge : 0
            };

            // function getMonday(d) {
            //     d = new Date(d);
            //     var day = d.getDay(),
            //         diff = d.getDate() - day + (day == 0 ? -6:1);
            //     return new Date(d.setDate(diff));
            // }
            //
            //
            // function getFriday(d) {
            //     d = new Date(d);
            //     var day = d.getDay(),
            //         diff = d.getDate() - day + (day == 0 ? -6:5);
            //     return new Date(d.setDate(diff));
            // }
            //
            // document.getElementById('startDate').value = getMonday(new Date()).toISOString().substring(0, 10);
        // document.getElementById('startDate').value
            // document.getElementById('endDate').value = getFriday(new Date()).toISOString().substring(0, 10);







        $('#chkBtn').click(function () {
;           var id = $('#id').val();
            var startDate = $('#startDate').val();
            var endDate = $('#endDate').val();
            dateFrm.submit();
        });

            function success(pos) {
                var crd = pos.coords;
                console.log('위도 : ' + crd.latitude);
                console.log('경도: ' + crd.longitude);
                lat = crd.latitude;
                lon = crd.longitude;

                $.ajax({
                    url: 'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=' + lon + '&y=' + lat,
                    type: 'GET',
                    headers: {
                        'Authorization': 'KakaoAK 81be5506637cd78e81104aecd18cadf2'
                    },
                    success: function (data) {
                        $('#startBtn').click(function () {
                            var id = $('#id').val();
                            var startLocation = (data.documents[0].address.address_name)
                            $.ajax({
                                type:"POST",
                                url:"/chkWork",
                                data:{
                                    id: id
                                },
                                success:function(cnt){
                                    if(cnt == 0) {
                                        alert("이미 출근 등록이 되어 있습니다.");
                                    }else {
                                        $.ajax({
                                            type: "POST",
                                            url: "/startWork",
                                            dataType: "json",
                                            data: {
                                                id: id,
                                                startLocation: startLocation
                                            },
                                            success: function (data) {
                                                result:data
                                                location.reload();
                                            },
                                            error: function (data) {
                                                result:data
                                                alert(data);
                                                alert("출근 등록 실패");

                                            },
                                        });
                                    }
                                },
                                error: function (data) {
                                    result:data
                                    alert("출근 등록 에러");

                                },
                            });
                        });

                        $('#endBtn').click(function () {
                            var id = $('#id').val();
                            var endLocation = (data.documents[0].address.address_name)
                            $.ajax({
                                type:"POST",
                                url:"/chkWork",
                                data:{
                                    id: id
                                },
                                success:function(cnt){
                                    if(cnt > 0) {
                                        alert("정상 출근이 되어있지 않습니다.");
                                    }else {
                                        $.ajax({
                                            type: "POST",
                                            url: "/endWork",
                                            data: {
                                                endLocation: endLocation
                                            },
                                            success: function (data) {
                                                result:data
                                                location.reload();
                                            },
                                            error: function (data) {
                                                result:data
                                                alert("퇴근 등록 실패");
                                            },
                                        });
                                    }
                                },
                                error: function (data) {
                                    result:data
                                    alert("출근 등록 에러");

                                },
                            });
                        })
                    },
                    error: function (data) {
                        console.log(data);
                        alert("위치 등록 실패");
                    }
                });
            }
            function error(err) {
                console.warn('ERROR(' + err.code + '): ' + err.message);
            };

            navigator.geolocation.getCurrentPosition(success, error, options);
    });
</script>
<body>
<header>
    <nav>
        <span><a href="/member/myPage" style="color: #333333; text-decoration : none;">마이페이지</a></span>
        <span><a href="/commute/work" style="color: #333333; text-decoration : none;">출퇴근등록</a></span>
        <span><a href="" style="color: #333333; text-decoration : none;">휴가신청</a></span>
    </nav>
</header>
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
                    <a style='color:black' href = '<%=request.getContextPath() %>/'>로그인</a>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.id}">
                <div style="text-align: right">
                    <h5>${id}님 <a style='color:black' href = '<%=request.getContextPath() %>/member/logout'>로그아웃</a></h5>
                </div>
            </c:if>
                <button type='button' class='btn btn-primary' id='startBtn'>출근</button>
                <button type='button' class='btn btn-primary' id='endBtn'>퇴근</button>
            <form name='dateFrm'method="post" action="work">
                <button type='button' class='btn btn-primary' id="chkBtn" style="float: right">조회</button>
<%--                <input type='date' id='endDate' name='endDate' value="${commute.endDate}" class="form-control" style="width: 150px; float: right;">--%>
                <button type='button' class='btn btn-outline-primary' disabled style="float: right">종료일</button>
<%--                <input type='date' id='startDate' name='startDate' value="${commute.startDate}" class="form-control" style="width: 150px; float: right;">--%>
                <button type='button' class='btn btn-outline-primary' disabled style="float: right">시작일</button>
            </form>
            <table class="board-table">
                <thead>
                <tr>
                    <th>출근시간</th>
                    <th>출근위치</th>
                    <th>퇴근시간</th>
                    <th>퇴근위치</th>
                    <th>근무시간</th>
                    <th>근무형태</th>
                    <th>규정퇴근시간준수여부</th>
                </tr>
                </thead>
                <tbody id="commutes">
                    <c:forEach var="commute" items="${commute}">
                        <tr style="width: 100rem">
                            <td>${commute.startTime}</td>
                            <td>${commute.startLocation}</td>
                            <td>${commute.endTime}</td>
                            <td>${commute.endLocation}</td>
                            <td></td>
                            <td>?</td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</section>
</body>
</html>