<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="./header.jsp"%>
<title>新增帖子</title>
</head>
<script type="text/javascript">
	$(function(){
		var token = $("#token").val();
		uploadImg(token);
		uploadBanner(token);
	});
	 function getSecondaryName(){
		var id = $("#id").val();
		$("#secondaryId").empty().append("<option value='0'>请选择二级分类</option>");
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/getSecondaryName",
			data:"id="+id,
			success:function(data){
				var dataList=eval("("+data+")");
				for(var i =0;i<dataList.length;i++){
					$("#secondaryId").append("<option value='"+dataList[i].id+"'>"+dataList[i].secondaryName+"</option>");
				}
			}
		})
	}; 
	function getText(obj1,obj2){
		var oCtl = document.forms[0].elements[obj2];
		oCtl.value = obj1.options[obj1.selectedIndex].text;
		}
</script>
<body>
	<!-- topbar starts -->
	<%@include file="./topbar.jsp"%>
	<!-- topbar ends -->
	<div class="container-fluid">
		<div class="row-fluid">

			<!-- left menu starts -->
			<%@include file="./leftmenu.jsp"%>
			<!-- left menu ends -->
		</div>
		<div class="box col-sm-10 col-lg-10">
			<div class="box-inner">
				
				<div class="box-header well" data-original-title="">
					<h2>
						<i class="glyphicon glyphicon-user"></i>新增帖子
					</h2>

					<div class="box-icon">
						<a href="#" class="btn btn-minimize btn-round btn-default"><i
							class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
							class="btn btn-close btn-round btn-default"><i
							class="glyphicon glyphicon-remove"></i></a>
					</div>
				</div>
				<div class="box-content">
					<form class="form-horizontal" action="addPost" method="post">
					  <div class="form-group form-group-sm">
					    <label for="inputEmail3" class="col-sm-1 control-label">标题:</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="inputEmail3" placeholder="标题" name="name" required="required">
					    </div>
					  </div>
					  <div class="form-group form-group-sm">
					    <label for="inputEmail3" class="col-sm-1 control-label">分类:</label>
					    <div class="col-sm-2">
					    <select  class="form-control" id="id" name="type" onchange="getSecondaryName(),getText(this,'firstName')" required="required">
					      		<option value="">请选择一级分类</option>
					      		<c:forEach items="${dictionarieList }" var="dictionarie">
					      			<option value="${dictionarie.id }">${dictionarie.name }</option>
					      		</c:forEach>
					      </select>
					      <input type="hidden" name="firstName" /> 
					    </div>
					    <div class="col-sm-2">
					    	 <select  class="form-control" id="secondaryId" name = "secondaryType" onchange="getText(this,'secondaryName')">
					    		<option value='0'>请选择二级分类</option>
					     	</select>
					     	<input type="hidden" name="secondaryName">
					    </div>
					  </div>
					  <div class="form-group">
					  	<label for="inputEmail3" class="col-sm-1 control-label">广告位:</label>
					  	<div class="col-sm-2">
					  	<label class="radio-inline">
						  <input type="radio" checked="checked" name="isBanner" id="inlineRadio1" value="0">否
						</label>
						<label class="radio-inline">
						  <input type="radio" name="isBanner" id="inlineRadio2" value="1">是
						</label>
						</div>
						<label for="inputEmail3" class="col-sm-1 control-label">推荐:</label>
					  	<div class="col-sm-2">
					  	<label class="radio-inline">
						  <input type="radio" checked="checked" name="isRecommend" id="inlineRadio1" value="0">否
						</label>
						<label class="radio-inline">
						  <input type="radio" name="isRecommend" id="inlineRadio2" value="1">是
						</label>
						</div>
					  </div>
					  	
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-1 control-label">banner:</label>
					     <input type="hidden" value="${qiuniuToken }" id="token"/>
					    <div class="col-sm-5">
					     <div id="picker2"><i class="glyphicon glyphicon-plus"></i></div>
					     <div id="banner">
					     </div>
					    </div>
					  </div>
					  <div class="form-group" id="img">
					    <label for="inputEmail3" class="col-sm-1 control-label">图片:</label>
					     <input type="hidden" value="${qiuniuToken }" id="token"/>
					    <div class="col-sm-5">
					     <div id="picker"><i class="glyphicon glyphicon-plus"></i></div>
					     <div id="imgList">
					     </div>
					    </div>
					  </div>
					  <div class="form-group form-group">
					    <label for="inputPassword3" class="col-sm-1 control-label">内容:</label>
					    <div class="col-sm-10">
					   	  <textarea rows="10" cols="15" class="form-control" placeholder="内容" name="details" required="required"></textarea>
					    </div>
					  </div>
					  <div class="form-group form-group">
					    <label for="inputPassword3" class="col-sm-1 control-label">总结:</label>
					    <div class="col-sm-6">
					   	  <textarea rows="5" cols="5" class="form-control" placeholder="总结" name="summary" required="required"></textarea>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-1 col-sm-6">
					      <button type="submit" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-ok"></i> 保存</button>
					      <a href="queryPostList" class="btn btn-default btn-sm"><i class=" glyphicon glyphicon-remove"></i> 取消</a>
					    </div>
					  </div>
					</form>
				</div>
			</div>
		</div>
		<!--/span-->

	</div>
	<!--/row-->
	<%@include file="./footer.jsp"%>
</body>
</html>
