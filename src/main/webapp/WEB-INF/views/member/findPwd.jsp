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
    <title>FINDID</title>
    <script>
        $(document).ready(function (){
            $('#findBtn').click(function (){
                var id  = $('#id').val();
                var phone = $('#phone').val();

                $.ajax({
                    type:"POST",
                    url: "/member/findPwd",
                    data : {
                        id : id,
                        phone : phone
                    },
                    success : function (data) {
                        result:data
                        if (data == 0 || id.length == 0|| phone.length == 0){
                            document.getElementById("view1").style.display = "none";
                            document.getElementById("view2").style.display = "none";
                            $('.msg').text("아이디 또는 이메일을 다시 확인해 주세요.");
                            document.getElementById("view3").style.display = "block";
                        } else {
                            document.getElementById("view1").style.display = "none";
                            document.getElementById("view2").style.display = "block";
                            $('#pwd').blur(
                                function (){
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

                                        $('#changeBtn').click(function (){
                                            $.ajax({
                                                type:"POST",
                                                url: "/updatePwd",
                                                data : {
                                                    id : $('#id').val(),
                                                    pwd : $('#pwd').val(),
                                                    phone : $('#phone').val()
                                                },
                                                success : function (data) {
                                                    result:data
                                                    document.getElementById("view1").style.display = "none";
                                                    document.getElementById("view2").style.display = "none";
                                                    document.getElementById("view3").style.display = "block";
                                                },
                                                error: function (data) {
                                                    result:data,
                                                        alert("실패")
                                                    document.getElementById("view1").style.display = "none";
                                                    document.getElementById("view2").style.display = "block";
                                                },
                                            });
                                        });
                                    }
                                }
                            });
                        }
                    },
                    error: function (data) {
                        result:data,
                        alert("실패")
                        document.getElementById("view1").style.display = "none";
                        document.getElementById("view2").style.display = "block";
                    },
                });
            });


        });
    </script>
</head>
<body>
<br><br>
<h4 style='text-align:center;'><b>비밀번호 찾기</b></h4><hr><br>
<div class='row'>
    <div class='col' id='view1' style='text-align:center;'>
        <label>아이디&emsp;</label>
        <input type='text' id='id' name='id'/><br>
        <label>전화번호&emsp;</label>
        <input type='text' id='phone' name='phone'/><br><br><br>
        <div  style="display: flex; justify-content: center;">
              <button type='button' class='btn btn-primary btn-block'
                        id='findBtn' style="width:120">비밀번호 찾기</button>
        </div>
    </div>
    <div class='col' id='view2'  style ="display:none;text-align:center" >
        <label>비밀번호 재설정</label><br>
        <input type='password' id='pwd' name='pwd'/><br>
        <span class="pwdMsg" style ="color:red;display:none;">필수 정보입니다.</span>
        <label>비밀번호 확인</label><br>
        <input type='password' id='pwdChk' name='pwdChk'/><br>
        <span class="pwdChkMsg" style ="color:red;display:none;">필수 정보입니다.</span><br>
        <div  style="display: flex; justify-content: center;">
            <button type='button' class='btn btn-primary btn-block'
                    id='changeBtn' style="width: 120" >비밀번호 변경</button>
        </div>
    </div>
    <div class='col' id='view3'  style ="display:none;text-align:center" >
        <span class="msg">비밀번호 변경 완료</span><br><br><br>
        <div  style="display: flex; justify-content: center;">
            <button type='button' class='btn btn-primary btn-block'
                    id='mainBtn' style="width: 120" onclick="location.href='/'">메인으로</button>
        </div>
    </div>
</div>
</body>
</html>