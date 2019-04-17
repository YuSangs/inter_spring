<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>
	<section class="section section-shaped section-lg">
		<div class="shape shape-style-1 bg-gradient-default">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
		</div>
		<div class="container pt-lg-md">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="card bg-secondary shadow border-0">
						<div class="card-body px-lg-5 py-lg-5">
							<div class="text-center text-muted mb-4">
								<small>회원가입 창</small>
							</div>
							<form id="registForm" role="form" action="/member/registProc.do" method="post">
								<div class="form-group">
									<div class="input-group input-group-alternative mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-email-83"></i></span>
										</div>
										<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디" onchange="changeInput()">
										<button class="btn btn-sm btn-primary" type="button" onclick="overlapChk();">중복확인</button>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
										</div>
										<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호" onchange="changeInput()">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
										</div>
										<input type="password" id="user_pw_chk" name="user_pw_chk" class="form-control" placeholder="비밀번호 체크" onchange="changeInput()">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group input-group-alternative mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-hat-3"></i></span>
										</div>
										<input type="text" id="user_name" name="user_name" class="form-control" placeholder="닉네임" onchange="changeInput()">
									</div>
								</div>
								<div class="text-muted font-italic">
									<small>닉네임은 활동할 때 보입니당
										<span class="text-success font-weight-700">프로필에서 수정 가능!</span>
									</small>
								</div>
								<div class="text-center">
									<button type="button" class="btn btn-primary mt-4" onclick="registProc();">가입하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<script type="text/javascript">
	var overlapTF = "false";
	/*ajax 호출 함수*/	
	function ajaxCall(reqUrl, reqData){
		$.ajax({
			url: reqUrl
			,data: reqData
			,type: "POST"
			,dataType: "json"
			,success: function(d){
				if(reqUrl = "/member/overlapChk.do"){
					if(d.result == true){
						alert("사용할 수 있는 아이디입니다.");
						overlapTF = "true";
						$("#user_pw").focus();
					}else{
						alert("중복된 아이디입니다.");
						overlapTF = "false";
						$("#user_id").focus();
					}
				}
			}
			,error: function(e){
				alert("ajax 통신 중 오류 발생!");
				console.log("error : "+e);
			}
		});
	}
	
	function overlapChk(){
		if($("#user_id").val() == ""){
			alert("아이디 입력해야 중복확인이 가능합니다.");
			$("#user_id").parent("div").addClass("has-danger");
			$("#user_id").focus();
			return;
		}
		
		var reqData = {};
		reqData.user_id = $("#user_id").val();
		
		ajaxCall("/member/overlapChk.do", reqData);
	}

	function registProc(){
		if($("#user_id").val() == ""){
			alert("아이디 입력해 주세요.");
			$("#user_id").parent("div").addClass("has-danger");
			$("#user_id").focus();
			return;
		}else{
			if(overlapTF == "false"){
				alert("아이디 중복확인을 해주세요.");
				return;
			}
		}
		if($("#user_pw").val() == ""){
			alert("비밀번호 입력해 주세요.");
			$("#user_pw").parent("div").addClass("has-danger");
			$("#user_pw").focus();
			return;
		}
		if($("#user_pw_chk").val() == ""){
			alert("비밀번호 체크 입력해 주세요.");
			$("#user_pw_chk").parent("div").addClass("has-danger");
			$("#user_pw_chk").focus();
			return;
		}else{
			if($("#user_pw").val() != $("#user_pw_chk").val()){
				alert("비밀번호와 비밀번호 체크가 일치하지 않습니다. \n다시 입력해 주세요.");
				$("#user_pw").focus();
				return;
			}
		}
		if($("#user_name").val() == ""){
			alert("닉네임 입력해 주세요.");
			$("#user_name").parent("div").addClass("has-danger");
			$("#user_name").focus();
			return;
		}
		
		$("#registForm").submit();
	}
	
	function changeInput(){
		$(".form-control").parent("div").removeClass("has-danger");
	}
	
</script>