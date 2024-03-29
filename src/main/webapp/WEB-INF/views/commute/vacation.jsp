<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>VACATION</title>
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
        $('#regBtn').click(function (){

            var vacDate = $('#vacDate').val();
            var day = $('#day').val();
            var reason = $('#reason').val();

            if(vacDate.length == 0 || day.length == 0 || reason.length == 0) {
                alert("휴가 신청 정보를 확인해 주세요")
            } else {
                $.ajax({
                    type:"POST",
                    url: "/regVac",
                    dataType:"json",
                    data: {
                        vacDate: vacDate,
                        day: day,
                        reason: reason,
                    },
                    success : function (data) {
                        result:data,
                        location.reload();
                    },
                    error: function (data) {
                        result:data
                        alert("휴가신청 실패");

                    },
                });
            }
        });

        $('#cancelVac').click(function (){
            $.ajax({
                url: '/cancelVac/' + $('#vacNum').val(),
                method: 'post'
            });
            location.reload();
        })

        $('#agreeVac').click(function (){
            $.ajax({
                url: '/agree/' + $('#vacNum').val(),
                method: 'post'
            });
            location.reload();
        })
    });
</script>
<body>
<header>
    <nav>
        <span><a href="/member/myPage" style="color: #333333; text-decoration : none;">마이페이지</a></span>
        <span><a href="/commute/work" style="color: #333333; text-decoration : none;">출퇴근등록</a></span>
        <span><a href="/commute/vacation" style="color: #333333; text-decoration : none;">휴가신청</a></span>
    </nav>
</header>
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>휴가신청</h3>
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
            <button type='button' class='btn btn-outline-primary' disabled style="float: left" >일자</button>
            <input type='date' id='vacDate' name='vacDate' class="form-control" style="width: 15%; float: left">
            <button type='button' class='btn btn-outline-primary' disabled style="float: left">타입</button>
            <select id='day' style="width: 15%; height: 36px; float: left">
                <option value='' selected>-- 선택 --</option>
                <option value='1'>휴무</option>
                <option value='0.5'>오전반차</option>
                <option value='0.5'>오후반차</option>
            </select>
            <button type='button' class='btn btn-outline-primary' disabled style="float: left">사유</button>
            <input type='text' id='reason' name='reason' class="form-control" style="width: 35%; float: left">
            <button type='button' class='btn btn-primary' id="regBtn" style="float:right;">신청</button>
            <table class="board-table">
                <thead>
                <tr>
                    <th>요청일자</th>
                    <th>휴가일자</th>
                    <th>신청일수</th>
                    <th>사유</th>
                    <th>승인유뮤</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="vacation" items="${vacation}">
                    <tr style="width: 100rem">
                        <td>${vacation.reqDate}</td>
                        <td>${vacation.vacDate}</td>
                        <td>${vacation.day}</td>
                        <td>${vacation.reason}</td>
                        <c:if test="${sessionScope.id == 'admin'}">
                            <td><a href="javascript:void(0);" id="agreeVac" style="color: red">${vacation.agree}</a></td>
                        </c:if>
                        <c:if test="${sessionScope.id ne 'admin'}">
                            <td>${vacation.agree}</td>
                        </c:if>
                        <c:if test="${vacation.agree == '미승인'}">
                            <td><a href="javascript:void(0);" id="cancelVac" style="color: red">취소</a><input id="vacNum" type="hidden" value="${vacation.vacNum}"/></td>
                        </c:if>
                        <c:if test="${vacation.agree == '승인'}">
                            <td></td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h5><b>잔여 휴가일수: ${cntVac}</b></h5>
        </div>
    </div>
</section>
</body>
</html>