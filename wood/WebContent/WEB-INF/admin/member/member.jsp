<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link
	href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {

		$("#submit_btn").click(function() {
			var form_data = $("#member_update").serializeArray();
			alert(form_data);
			$.ajax({
				url : "../admin/member_update.do",
				data : form_data,
				dataType : "json",
				type: 'post',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					//$('#myModal').modal('show');
					location.reload();
					
				}

			});

		});
	});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#example').DataTable(
						{
							"lengthMenu" : [ [ 10, 25, 50, 100, -1 ],
									[ 10, 25, 50, 100, "All" ] ],
							"columnDefs" : [ {
								"targets" : -1,
								"data" : "remote_addr_str",
								"defaultContent" : "<button id='update_btn'>수정</button> <button id='delete_btn'>삭제</button>"
							} ],
							"ajax" : {
								"url" : "../admin/object.do",
								"dataSrc" : "",
							},
							"columns" : [ {
								"data" : "member_no","width": "10%"
							}, {
								"data" : "id_str"
							},  {
								"data" : "name_str"
							}, {
								"data" : "email_str"
							}, {
								"data" : "cel_str"
							}, {
								"data" : "level_no"
							}, {
								"data" : null
							} ]
						});

				var table = $('#example').DataTable();

				$('#example tbody').on('click', '#update_btn', function() {
					// var data = table.row( this ).data();
					var data = table.row($(this).parents('tr')).data();
					var member_no = data.member_no;
					
					$.ajax({
						url : "../admin/member_form.do",
						type : "GET",
						data : "member_no=" + member_no,
						dataType : "json",
						success : function(data) {
							$.each(data, function(i, result) {
								console.log(i);
								$("#" + i).val(result);
							});
						},
						error : function() {
							alert("에러났어");
						}
					});
					$('#myModal').modal('show');

					
				});
				
				$('#example tbody').on('click', '#delete_btn', function() {
					// var data = table.row( this ).data();
					var data = table.row($(this).parents('tr')).data();
					var member_no = data.member_no;
					$.ajax({
						url : "../admin/member_delete.do",
						type : "GET",
						data : "member_no=" + member_no,
						dataType : "json",
						success : function(data) {
							alert("삭제완료");
							location.reload();
						},
						error : function() {
							alert("에러났어");
						}
					});
					

				
				});

			});
</script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원관리</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<table id="example" class="display" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>등급</th>
			<th>수정 / 삭제</th>
			

		</tr>
	</thead>
	<tfoot>
		<tr>
			<th>번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>등급</th>
			<th>수정 / 삭제</th>

		</tr>
	</tfoot>
</table>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
	data-target="#myModal">Launch demo modal</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">
				<form id="member_update">
					<input type="text" name="member_no" id="member_no"> 
					<div class="form-group">
						<label for="recipient-name" class="control-label">이름:</label> <input
							type="text" name="name_str" id="name_str" value=""
							class="form-control" id="recipient-name">
					</div>
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">이메일:</label> <input
							type="text" name="email_str" id="email_str" value=""
							class="form-control" id="recipient-name">
					</div>
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">핸드폰번호:</label> <input
							type="text" name="cel_str" id="cel_str" value=""
							class="form-control" id="recipient-name">
					</div>
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">우편번호:</label> <input
							type="text" name="post_str" id="post_str" value=""
							class="form-control" id="recipient-name">
					</div>
					
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">주소:</label> <input
							type="text" name="addr_str" id="addr_str" value=""
							class="form-control" id="recipient-name">
					</div>
					
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">나머지주소:</label> <input
							type="text" name="addr2_str" id="addr2_str" value=""
							class="form-control" id="recipient-name">
					</div>
					


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="submit_btn" class="btn btn-primary">Save
					changes</button>
			</div>

		</div>
	</div>
</div>
