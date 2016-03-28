<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link
	href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
					$('#example').DataTable().ajax.reload();
				}

			});

		});
	});
</script>

<script type="text/javascript">

function datatables_loading(){
	$('#example').DataTable({
		"lengthMenu" : [ [ 10, 25, 50, 100, -1 ],
				[ 10, 25, 50, 100, "All" ] ],
		"columnDefs" : [ {
			"targets" : -1,
			"data" : "remote_addr_str",
			"defaultContent" : "<button id='update_btn'>수정</button> <button id='delete_btn'>삭제</button>"
		},
		{
			"targets" : -2,
			"data" : "remote_addr_str",
			"defaultContent" : "<select></select>"
		}
		],
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
			"data" : "member_level_name"
		}, {
			"data" : null
		}, ]
	});
}
	
	$(document).ready(function() {

		datatables_loading();
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
					$('#example').DataTable().ajax.reload();
					//location.reload();

				},
				error : function() {
					alert("에러났어");
				}
			});

		});

	});

	
	function DaumPostcode() {new daum.Postcode({

	oncomplete : function(data) {

	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.roadAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('post_str').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr_str').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2_str').focus();
					}
				}).open();
	}
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
						<label for="post_str">우편번호</label>
								<div class="input-group">
									<input type="text" id="post_str" name="post_str" for=""
										class="form-control" placeholder="우편번호" /> <span
										class="input-group-btn">
										<button  onclick="DaumPostcode()" type="button"
											class="btn btn-success">
											우편번호 검색<i class="fa fa-mail-forward spaceLeft"></i>
										</button>
									</span>
								</div>
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
