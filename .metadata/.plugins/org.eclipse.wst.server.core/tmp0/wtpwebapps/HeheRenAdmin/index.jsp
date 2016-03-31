<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<title>首页</title>
		<%@include file="/page/header.jsp"%>
		<style type="text/css">
			embed {
				width:100%;
				height:520px
			}
		</style>
	</head>
	<body>
		<!-- topbar starts -->
		<%@include file="/page/topbar.jsp"%>
		<!-- topbar ends -->
		<!-- 	<div class="container-fluid"> -->
	<div class="row-fluid">

			<!-- left menu starts -->
			<%@include file="/page/leftmenu.jsp"%>
			<!-- left menu ends -->


			<div id="content" class="col-sm-10 col-lg-10">
				<!-- content starts -->
				<ul class="breadcrumb">
					<li>
						首页
					</li>
					<li>
						系统概述
					</li>
				</ul>
				<!-- content ends -->
				<!-- 			</div>/#content.span10 -->
			</div>
			<!--/fluid-row-->
			<footer>
				<%@include file="/page/footer.jsp"%>
			</footer>
		</div>
	</body>
</html>
