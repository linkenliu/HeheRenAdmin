<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="./header.jsp"%>
<title>编辑帖子</title>
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
	
	function delImg(id){
		$("#item"+id).remove();
		$.post(
			'deleteQiuniuImage',
			{qiniuKey:id},
			function(data){
				
			}
		);
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
						<i class="glyphicon glyphicon-user"></i>编辑帖子
					</h2>

					<div class="box-icon">
						<a href="#" class="btn btn-minimize btn-round btn-default"><i
							class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
							class="btn btn-close btn-round btn-default"><i
							class="glyphicon glyphicon-remove"></i></a>
					</div>
				</div>
				<div class="box-content">
					<form class="form-horizontal" action="updatePost" method="post">
					  <input type="hidden" name="id" value="${post.id }"/>
					  <div class="form-group form-group-sm">
					    <label for="inputEmail3" class="col-sm-1 control-label">标题:</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="inputEmail3" placeholder="标题" name="name" value="${post.name }" required="required">
					    </div>
					  </div>
					  <div class="form-group form-group-sm">
					    <label for="inputEmail3" class="col-sm-1 control-label">分类:</label>
					    <div class="col-sm-2">
					    <select  class="form-control" id="id" name="type" onchange="getSecondaryName(),getText(this,'firstName')" required="required">
					      		<option value="">请选择一级分类</option>
					      		<c:forEach items="${dictionarieList }" var="dictionarie">
					      			<c:choose>
					      				<c:when test="${post.type == dictionarie.id}">
					      					<option selected="selected" value="${dictionarie.id }">${dictionarie.name }</option>
					      				</c:when>
					      				<c:otherwise>
					      					<option value="${dictionarie.id }">${dictionarie.name }</option>
					      				</c:otherwise>
					      			</c:choose>
					      		</c:forEach>
					      </select>
					      <input type="hidden" name="firstName" /> 
					    </div>
					    <div class="col-sm-2">
					    	 <select  class="form-control" id="secondaryId" name = "secondaryType" onchange="getText(this,'secondaryName')">
					    		<option value='0'>请选择二级分类</option>
					    		<c:forEach items="${dictionarieList2 }" var="dictionarie">
					      			<c:choose>
					      				<c:when test="${post.secondaryType == dictionarie.id}">
					      					<option selected="selected" value="${dictionarie.id }">${dictionarie.secondaryName }</option>
					      				</c:when>
					      				<c:otherwise>
					      					<option value="${dictionarie.id }">${dictionarie.secondaryName }</option>
					      				</c:otherwise>
					      			</c:choose>
					      		</c:forEach>
					     	</select>
					     	<input type="hidden" name="secondaryName">
					    </div>
					  </div>
					  <div class="form-group">
					  	<label for="inputEmail3" class="col-sm-1 control-label">广告位:</label>
					  	<div class="col-sm-2">
					  	<label class="radio-inline">
						  <input type="radio" name="isBanner" <c:if test="${post.isBanner == 0 }">checked="checked"</c:if> id="inlineRadio1" value="0">否
						</label>
						<label class="radio-inline">
						  <input type="radio" name="isBanner" <c:if test="${post.isBanner == 1 }">checked="checked"</c:if> id="inlineRadio2" value="1">是
						</label>
						</div>
						<label for="inputEmail3" class="col-sm-1 control-label">推荐:</label>
					  	<div class="col-sm-2">
					  	<label class="radio-inline">
						  <input type="radio" <c:if test="${post.isRecommend == 0 }">checked="checked"</c:if> name="isRecommend" id="inlineRadio1" value="0">否
						</label>
						<label class="radio-inline">
						  <input type="radio" <c:if test="${post.isRecommend == 1 }">checked="checked"</c:if> name="isRecommend" id="inlineRadio2" value="1">是
						</label>
						</div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-1 control-label">banner:</label>
					     <input type="hidden" value="${qiuniuToken }" id="token"/>
					    <div class="col-sm-10">
					     <div id="picker2"><i class="glyphicon glyphicon-plus"></i></div>
					     <div id="banner">
					     	<c:if test="${post.banner !=null and post.banner !='' }">
					      		<div class="item-uploader" id="item${post.banner }">
						      		<img src="http://7xoxjl.com1.z0.glb.clouddn.com/${post.banner}" class="images-uploader" name="" width="120" height="80">
						      		<a  href="#" onclick="delImg('${post.banner}')" class="delimg" id="delimg" ><i class="glyphicon glyphicon-remove" style="color:red"></i></a>
						     		<input type="hidden" value="${post.banner}" name="banner"/>
						     	</div>
						     </c:if>
					     </div>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-1 control-label">图片:</label>
					     <input type="hidden" value="${qiuniuToken }" id="token"/>
					    <div class="col-sm-10">
					     <div id="picker"><i class="glyphicon glyphicon-plus"></i></div>
					     <div id="imgList">
					      	<c:if test="${pictureArr!=''}">
					      		<c:forEach items="${pictureArr}" var="p">
					      		<div class="item-uploader" id="item${p }">
						      		<img src="http://7xoxjl.com1.z0.glb.clouddn.com/${p}" class="images-uploader" name="" width="120" height="80">
						      		<a  href="#" onclick="delImg('${p}')" class="delimg" id="delimg" ><i class="glyphicon glyphicon-remove" style="color:red"></i></a>
						     		<input type="hidden" value="${p}" name="picture"/>
						     	</div>
					      		</c:forEach>
					     	</c:if>
					     </div>
					    </div>
					  </div>
					  <div class="form-group form-group">
					    <label for="inputPassword3" class="col-sm-1 control-label">内容:</label>
					    <div class="col-sm-10">
					   	  <textarea rows="10" cols="15" class="form-control" placeholder="内容" name="details"  required="required">${post.details }</textarea>
					    </div>
					  </div>
					  <div class="form-group form-group">
					    <label for="inputPassword3" class="col-sm-1 control-label">总结:</label>
					    <div class="col-sm-6">
					   	  <textarea rows="5" cols="5" class="form-control" placeholder="总结" name="summary" required="required">${post.summary }</textarea>
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
