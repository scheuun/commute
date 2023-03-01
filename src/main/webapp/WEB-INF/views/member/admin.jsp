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
    <title>ADMIN</title>
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
        $('#chkBtn').click(function () {
            var id = $('#id').val();
            // myPageFrm.submit();
            alert(id)
        });
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
            <h3>관리자 페이지</h3>
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
            <table class="board-table">
                <thead>
                <tr>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>전화번호</th>
                    <th>부서</th>
                    <th>직급</th>
                    <th>입사일자</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="admin" items="${admin}">
                        <form name='myPageFrm'method="post" action="/member/mypage">
                        <tr style="width: 100rem">
                            <td>${admin.name}</td>
                            <td id="id">${admin.id}<input type="text" value="${admin.id}"></td>
                            <td>${admin.phone}</td>
                            <td>${admin.department}</td>
                            <td>${admin.position}</td>
                            <td>${admin.regDate}</td>
                            <td><button type='button' id="chkBtn" class='btn btn-primary'>조회</button></td>
                        </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
</html>