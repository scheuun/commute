<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%--
  Created by IntelliJ IDEA.
  User: sche1
  Date: 2022-11-10
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>MYPAGE</title>
<script>
</script>
</head>
<body>
<br><br>
<h4 style='text-align:center;'><b>마이페이지</b></h4><hr><br>
<div class='row'>
    <table id="view1" class="table table-striped table-bordered base-style" style="text-align:center;">
        <thead>
        <tr>
            <th style="width: 300px; vertical-align: middle;">아이디</th>
            <th> <input type='text' id='id' name='id' class="form-control" readonly/></th>
        </tr>
            <th style="width: 300px; vertical-align: middle;">이름</th>
            <th><input type="text" id="name" name="name" class="form-control" readonly></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">비밀번호</th>
            <th><input type="password" id="pwd" name='pwd' class="form-control" readonly></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">비밀번호 확인</th>
            <th><input type='password' id='pwdChk' name='pwdChk' class="form-control"><span class="pwdChkMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">전화번호</th>
            <th><input type='text' id='phone' name='phone' class="form-control"><span class="phoneMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">부서</th>
            <th><input type='text' id='department' name='department' class="form-control"><span class="departmentMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">직급</th>
            <th><input type='text' id='position' name='position' class="form-control"><span class="positionMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">권한</th>
            <th><input type='text' id='job' name='job' class="form-control"><span class="jobMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">입사일자</th>
            <th><input type='date' id='regDate' name='regDate' class="form-control"><span class="regDateMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">출근시간</th>
            <th> <input type='time' id='startWork' name='startWork' class="form-control"><span class="startWorkMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">퇴근시간</th>
            <th><input type='time' id='endWork' name='endWork' class="form-control"><span class="endWorkMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th></th>
            <th  style="display: flex; justify-content: center;">
                <button type='button' class='btn btn-primary btn-block'
                        id='joinBtn' style="width:120">회원가입</button>
            </th>
        </tr>
        </thead>

    </table>
    <div class='col' id='view2'  style ="display:none;text-align:center" >
        <h6>회원가입 완료</h6><br><br><br>
        <div  style="display: flex; justify-content: center;">
            <button type='button' class='btn btn-primary btn-block'
                    id='mainBtn' style="width: 120" onclick="location.href='/'">메인으로</button>
        </div>
    </div>
</div>
</body>
</html>