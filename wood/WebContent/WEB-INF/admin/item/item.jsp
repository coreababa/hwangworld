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
								"url" : "../admin/itemAjax.do",
								"dataSrc" : "",
							},
							"columns" : [ {
								"data" : "item_no","width": "10%"
							}, {
								"data" : "item_name_str"
							},  {
								"data" : "status_no"
							}, {
								"data" : "category"
							}, {
								"data" : "count_no"
							},{
								"data" : null
							} ]
						});

				var table = $('#example').DataTable();

				$('#example tbody').on('click', '#update_btn', function() {
					// var data = table.row( this ).data();
					var data = table.row($(this).parents('tr')).data();
					var item_no = data.item_no;
					
					$.ajax({
						url : "../admin/item_form.do",
						type : "GET",
						data : "item_no=" + item_no,
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
					var item_no = data.item_no;
					$.ajax({
						url : "../admin/item_delete.do",
						type : "GET",
						data : "item_no=" + item_no,
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
		<h1 class="page-header">상품관리</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<table id="example" class="display" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>상태</th>
			<th>카테고리</th>
			<th>재고</th>
			<th>수정 / 삭제</th>
			

		</tr>
	</thead>
	<tfoot>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>상태</th>
			<th>카테고리</th>
			<th>재고</th>
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
					<input type="text" name="item_no" id="item_no"> 
					<div class="form-group">
						<label for="recipient-name" class="control-label">상품명:</label> <input
							type="text" name="item_name_str" id="item_name_str" value=""
							class="form-control">
					</div>
				
					<div class="form-group">
						<label for="recipient-name" class="control-label">카테고리:</label> <input
							type="text" name="category" id="category" value=""
							class="form-control" >
					</div>
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">상품상태:</label> <input
							type="text" name="status_no" id="status_no" value=""
							class="form-control">
					</div>
					
					
					
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">재고:</label> <input
							type="text" name="count_no" id="count_no" value=""
							class="form-control">
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
