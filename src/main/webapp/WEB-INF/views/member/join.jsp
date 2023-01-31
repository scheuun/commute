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
<title>JOIN</title>
<script>
    function join (){

        $('#id').blur(function () {
            console.log($('#id').val())
            $.ajax({
                type:"POST",
                url:"/idCheck",
                data:{
                    id: $('#id').val()
                },
                success:function(cnt){
                    if(document.getElementById('id').value== "") {
                        $('.idMsg').css("display","block");
                    }else {
                        if(cnt==0){
                            $('.idMsg').text("사용 가능한 아이디 입니다.");
                            $('.idMsg').css("display","block");
                        }else{
                            $('.idMsg').text("이미 사용중인 아이디 입니다.");
                            $('.idMsg').css("display","block");
                        }
                    }
                },
                    error: function (data) {
                        result:data
                        alert("회원가입 에러");

                    },
            });
        });

        $('#name').blur(function (){
            if(document.getElementById('name').value== "") {
                $('.nameMsg').css("display", "block");

            }
        });

        $('#pwd').blur(function (){
            var pwd = document.getElementById('pwd').value;

            if(pwd== "" || pwd.length == 0) {
                $('.pwdMsg').css("display", "block");
            } else {
                if(pwd.length < 6 || pwd.length > 12) {
                    $('.pwdMsg').text("비밀번호는 6글자 이상, 12글자 이하만 이용 가능합니다.");
                    $('.pwdMsg').css("display", "block");
                } else {
                    $('.pwdMsg').css("display", "none");
                }
            }
        });

        $('#pwdChk').blur(function (){
            var pwd = document.getElementById('pwd').value;
            var pwdChk = document.getElementById('pwdChk').value;


                if(pwdChk== "") {
                    $('.pwdChkMsg').css("display", "block");
                } else {
                    if( pwd != pwdChk ) {
                        $('.pwdChkMsg').text("비밀번호가 일치하지 않습니다.");
                        $('.pwdChkMsg').css("display", "block");
                    } else{
                        $('.pwdChkMsg').text("비밀번호가 일치합니다.");
                        $('.pwdChkMsg').css("display", "block");
                    }
                }

            });

        $('#phone').blur(function (){
            if(document.getElementById('phone').value== "") {
                $('.phoneMsg').css("display", "block");

            }
        });

        $('#department').blur(function (){
            if(document.getElementById('department').value== "") {
                $('.departmentMsg').css("display", "block");

            }
        });

        $('#position').blur(function (){
            if(document.getElementById('position').value== "") {
                $('.positionMsg').css("display", "block");

            }
        });

        $('#job').blur(function (){
            if(document.getElementById('job').value== "") {
                $('.jobMsg').css("display", "block");

            }
        });

        $('#regDate').blur(function (){
            if(document.getElementById('regDate').value== "") {
                $('.regDateMsg').css("display", "block");

            }
        });

        $('#startWork').blur(function (){
            if(document.getElementById('startWork').value== "") {
                $('.startWorkMsg').css("display", "block");

            }
        });

        $('#endWork').blur(function (){
            if(document.getElementById('endWork').value== "") {
                $('.endWorkMsg').css("display", "block");

            }
        });

        $('#joinBtn').click(function (){

            var id = $('#id').val();
            var name = $('#name').val();
            var pwd = $('#pwd').val();
            var phone = $('#phone').val();
            var department = $('#department').val();
            var position = $('#position').val();
            var job = $('#job').val();
            var regDate = $('#regDate').val();
            var startWork = $('#startWork').val();
            var endWork = $('#endWork').val();


            if(id.length == 0 || pwd.length == 0 || phone.length == 0) {
                $('.idMsg').css("display","block");
                $('.nameMsg').css("display","block");
                $('.pwdMsg').css("display", "block");
                $('.pwdChkMsg').css("display", "block");
                $('.phoneMsg').css("display", "block");
                $('.departmentMsg').css("display", "block");
                $('.positionMsg').css("display", "block");
                $('.jobMsg').css("display", "block");
                $('.regDateMsg').css("display", "block");
                $('.startWorkMsg').css("display", "block");
                $('.endWorkMsg').css("display", "block");
            } else {
                $.ajax({
                    type:"POST",
                    url: "/join",
                    dataType:"json",
                    data: {
                        id: id,
                        name: name,
                        pwd: pwd,
                        phone: phone,
                        department: department,
                        position: position,
                        job: job,
                        regDate: regDate,
                        startWork: startWork,
                        endWork: endWork
                    },
                    success : function (data) {
                        result:data,
                            document.getElementById("view1").style.display = "none";
                        document.getElementById("view2").style.display = "block";
                    },
                    error: function (data) {
                        result:data
                        alert("회원가입 실패");

                    },
                });
            }
        });

    };
$(join)
</script>
</head>
<body>
<br><br>
<h4 style='text-align:center;'><b>회원가입</b></h4><hr><br>
<div class='row'>
    <table id="view1" class="table table-striped table-bordered base-style" style="text-align:center;">
        <thead>
        <tr>
            <th style="width: 300px; vertical-align: middle;">아이디</th>
            <th> <input type='text' id='id' name='id' class="form-control"/><span class="idMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>

        </tr>
            <th style="width: 300px; vertical-align: middle;">이름</th>
            <th><input type="text" id="name" name="name" class="form-control"><span class="nameMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
        </tr>
        <tr>
            <th style="width: 300px; vertical-align: middle;">비밀번호</th>
            <th><input type="password" id="pwd" name='pwd' class="form-control"><span class="pwdMsg" style ="color:red;display:none;">필수 정보입니다.</span></th>
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
                <button type='button' class='btn btn-secondary btn-block'
                        id='joinBtn' style="width:120">회원가입</button>
            </th>
        </tr>
        </thead>

    </table>
    <div class='col' id='view2'  style ="display:none;text-align:center" >
        <h6>회원가입 완료</h6><br><br><br>
        <div  style="display: flex; justify-content: center;">
            <button type='button' class='btn btn-secondary btn-block'
                    id='mainBtn' style="width: 120" onclick="location.href='/'">메인으로</button>
        </div>
    </div>
</div>
</body>
</html>