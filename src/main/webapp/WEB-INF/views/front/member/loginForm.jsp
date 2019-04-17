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
								<small>로그인 창</small>
							</div>
							<form id="loginForm" role="form" action="/member/loginProc.do" method="post">
								<div class="form-group mb-3">
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-email-83"></i></span>
										</div>
										<input type="type" class="form-control" id="user_id" name="user_id" placeholder="아이디" value="${user_id }">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
										</div>
										<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호">
									</div>
								</div>
								<c:if test="${user_id != null }">
									<div class="custom-control custom-control-alternative custom-checkbox" style="color: red;">
										아이디 또는 비밀번호가 맞지 않습니다. 
										확인 후 다시 입력해 주세요.
									</div>
								</c:if>
								<div class="text-center">
									<button type="button" class="btn btn-primary my-4" onclick="loginProc();">로그인</button>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-6">
							<a href="#" class="text-light">
								<small>혹시 비밀번호 잊었습니까?</small>
							</a>
						</div>
						<div class="col-6 text-right">
							<a href="/member/registForm.do" class="text-light">
								<small>회원가입</small>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<script type="text/javascript">
	function loginProc(){
		if($("#user_id").val() == ""){
			alert("아이디를 입력해 주세요.");
			$("#user_id").parent("div").addClass("has-danger");
			$("#user_id").focus();
		}
		
		if($("#user_pw").val() == ""){
			alert("비밀번호를 입력해 주세요.");
			$("#user_pw").parent("div").addClass("has-danger");
			$("#user_pw").focus();
		}
		
		$("#loginForm").submit();
	}
</script>