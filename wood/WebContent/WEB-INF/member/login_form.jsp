<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		$("#login_btn").click(function() {
			var postData = $("#login").serializeArray();
			var formURL = $("#login").attr("action");
			var formMethod = $("#login").attr("method");
			$.ajax(

			{
				type : formMethod,
				url : formURL,
				data : postData,
				dataType: "text",
				contentType: "application/text;charset=utf8",
				success : function(data) {
					if (data != "") {
						alert(data);
						location.href = "login_form.do";
					} else {
						location.href = "index.do";
					}
				}

			}

			);
		});
	});
</script>
<section>
	<div class="container">
		<div class="row">

			<div class="col-sm-12 padding-right">
				<div class="panel-heading">
					<h3 class="panel-title">로그인</h3>
				</div>
				<div class="panel-body">
					<form id="login" action="login.do" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="ID" name="id"
									type="text">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="passwd"
									type="password" value="">
							</div>
							<!-- Change this to a button or input when using this as a form -->
						</fieldset>
						<input type="button" id="login_btn"
							class="btn btn-lg btn-success btn-block" value="Login">
					</form>
				</div>
			</div>
		</div>
	</div>
</section>