<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header-global">
	<nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom">
		<div class="container">
			<a class="navbar-brand mr-lg-5" href="/main/index.do">
				인터 게시판
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbar_global">
				<div class="navbar-collapse-header">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="/main/index.do">
								인터 게시판
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
								<span></span>
								<span></span>
							</button>
						</div>
					</div>
				</div>
				<ul class="navbar-nav navbar-nav-hover align-items-lg-center">
					<li class="nav-item dropdown">
						<a href="#" class="nav-link" data-toggle="dropdown" href="#" role="button">
							<i class="ni ni-ui-04 d-lg-none"></i>
							<span class="nav-link-inner--text">여러가지</span>
						</a>
						<div class="dropdown-menu dropdown-menu-xl">
							<div class="dropdown-menu-inner">
								<a href="#" class="media d-flex align-items-center">
									<div class="icon icon-shape bg-gradient-primary rounded-circle text-white">
										<i class="ni ni-spaceship"></i>
									</div>
									<div class="media-body ml-3">
										<h6 class="heading text-primary mb-md-1">게시판</h6>
										<p class="description d-none d-md-inline-block mb-0">인터메이저 커뮤니티</p>
									</div>
								</a>
							</div>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link" data-toggle="dropdown" href="#" role="button">
							<i class="ni ni-collection d-lg-none"></i>
							<span class="nav-link-inner--text">프로필</span>
						</a>
						<div class="dropdown-menu">
							<a href="#" class="dropdown-item">프로필</a>
							<a href="/member/loginForm.do" class="dropdown-item">로그인</a>
							<a href="/member/registForm.do" class="dropdown-item">회원가입</a>
							<a href="#" class="dropdown-item">로그아웃</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
