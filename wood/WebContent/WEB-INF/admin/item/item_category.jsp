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
			var form_data = $('#myModal').find("form").serializeArray();
			var url=$('#myModal').find("form").attr("action");
			$.ajax({
				url : url,
				data : form_data,
				dataType : "json",
				type: 'post',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					$('#example').DataTable().ajax.reload();
				}

			});

		});
		
		$("#regi_btn").click(function(){
			var form= $('#myModal').find("form");
			form.attr("id","regi_form");
			form.attr("action","../admin/member_regist.do");
			$('#myModal').modal('show');
			
			$.each(form.find("input:text, input:hidden"), function(i, result) {
				$("#" + result.id).val("");
			});
			
			$.ajax({
				url : "../admin/member_level_Ajax.do",
				type : "GET",
				data : "",
				dataType : "json",
				success : function(data) {
					var a;
					$.each(data, function(i, data) {
						a +="<option value='"+data.member_level_no+"'>"+data.level_name+"</option>";
					});
						$("#level_no").html(a);
				},
				error : function() {
					alert("에러났어");
				}
			});
			
			
			$('#myModal').modal('show');
			
			
		});
		
		
	});
</script>

<script type="text/javascript">

function datatables_loading(){
	$('#example').DataTable({
		"lengthMenu" : [ [ 10, 25, 50, 100, -1 ],
				[ 10, 25, 50, 100, "All" ] ],
		"columnDefs" : [ {
			"targets" : -2,
			"data" : "remote_addr_str",
			"defaultContent" : "<button id='update_btn' class='btn btn-primary'>수정</button> <button id='delete_btn' class='btn btn-danger'>삭제</button>"
		}
		],
		"ajax" : {
			"url" : "../admin/category_Ajax.do",
			"dataSrc" : "",
		},
		"columns" : [ {
			
			"data" : "item_category_no","width": "10%"
		}, {
			"data" : "category_name_str"
		}, {
			"data" : null
		},{
			"data" : "item_category_no",
			"orderable": false,
			"searchable": false,
			"render": function(data,type,row,meta) {
				var a = '<div>'+data+'</div>';
				return a;
			}
		}
		
		]
	});
}
	
	$(document).ready(function() {
		
		$('#example tbody').on('click', 'td.details-control', function () {
	        
	    } );

		datatables_loading();
		var table = $('#example').DataTable();

		$('#example tbody').on('click', '#update_btn', function() {
			// var data = table.row( this ).data();
			var data = table.row($(this).parents('tr')).data();
			var member_no = data.member_no;
			$.ajax({
				url : "../admin/member_level_Ajax.do",
				type : "GET",
				data : "",
				dataType : "json",
				success : function(data) {
					var a;
					$.each(data, function(i, data) {
						a +="<option value='"+data.member_level_no+"'>"+data.level_name+"</option>";
					});
						$("#level_no").html(a);
				},
				error : function() {
					alert("에러났어");
				}
			});
			
			$.ajax({
				url : "../admin/member_form.do",
				type : "GET",
				data : "member_no=" + member_no,
				dataType : "json",
				success : function(data) {
					$.each(data, function(i, result) {
						
						$("#" + i).val(result);
					});
					
					var aaa = $('#level_no > option').length;
					//alert($("#level_no option:eq(0)").val());
					$("#level_no > option[@value="+data.level_no+"]").attr("selected", "true");
					/* for(var i=0; i<aaa; i++){
						if(data.level_no == $("#level_no option:eq("+i+")").val()){
							$(this).attr("selected","selected");
						}
					} */
					/* if(data.level_no==$("#level_no").find("option").val()){
						$("#level_no").find("option").attr("selected","selected");
					} */
				},
				error : function() {
					alert("에러났어");
				}
			});
			
			$('#myModal').find("form").attr("id","member_update");
			var form= $('#myModal').find("form");
			form.attr("action","../admin/member_update.do");
		
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
		<h1 class="page-header">상품 카테고리</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<table id="example" class="display" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>번호</th>
			<th>카테고리명</th>
			<th>수정 / 삭제</th>
			<th>수정 / 삭제</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th>번호</th>
			<th>카테고리명</th>
			<th>수정 / 삭제</th>
			<th>수정 / 삭제</th>
		</tr>
	</tfoot>
</table>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" id="regi_btn" >등록</button>

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
					<input type="hidden" name="member_no" id="member_no"> 
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">아이디:</label> 
					<input type="text" class="readonly form-control" readonly="readonly" id="id_str">
					</div>
					
					
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
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">등급:</label> 
						
						<select name="level_no" id="level_no">
						
						</select>
					</div>
					


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" id="submit_btn" class="btn btn-primary">수정</button>
			</div>

		</div>
	</div>
</div>
