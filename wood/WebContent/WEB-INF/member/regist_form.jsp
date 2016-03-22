<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<SCRIPT>
	$(document).ready(function() {

		$("#id_chk_btn").click(function() {
			var formdata = $("#regist").serializeArray();

			$.ajax({
				url : 'mem_chk.do',
				dataType : "text",
				data : formdata,

				success : function(data) {

					if (data == "1") {
						$("#id_str").val("");
						$("#id_str").attr("placeholder", "사용중인 아이디입니다.");
						$("#id_str").css({
							"border" : "2px solid red"
						});
						$("#id_chk").val("");
					} else if ($("#id_str").val() == "") {
						$("#id_str").attr("placeholder", "아이디를 입력해주세요.");
						$("#id_chk").val("N");
					} else {
						$("#id_chk").val("Y");

						$("#id_str").css({
							"border" : "2px solid green"
						});
					}
				},
				error : function(data) {
					alert("에러잖아");
					return false;

				}
			});
		});

		$("input:text").keyup(function() {
			if ($(this).val() != "") {
				$(this).removeAttr("style");
			}

		}).keyup();

		$("#regist_submit").click(function() {
			if (form_check($("#regist"))) {
				$("#regist").submit();
			}
			
		});

		$("#passwd_re").keyup(function() {

			if ($("#passwd_str").val() == $("#passwd_re").val()) {
				$("#pass_chk").val("Y");

			} else {
				$("#pass_chk").val("N");
				$(this).css({
					"border" : "2px solid red"
				});

			}
		})

	});

	function form_check(form) {
		
		/* 
		inputs.each(function(i, value) {
			 if($(this).text().match('Replace Me')) {
			     $(this).css('color', 'red'); 
			 }      
			console.log($(this).html());
			console.log*$(this).next().val();
			if ($("input").prop("id") == $(this).attr("for")) {

				console.log("같잖아");
			}
		});
		 */
		var inputs = $("form input[for]");
		inputs.each(function() {
			if ($(this).val() == "") {
				$(this).focus();
				$(this).attr("placeholder", $(this).attr("placeholder"));
				$(this).css({
					"border" : "2px solid red"
				});
				return false;
			} else {
				$(this).css({
					"border" : "2px solid green"
				});
				return;
			}
			return;
		});

		if ($("#id_chk").val() == "N") {
			$("#id_str").focus();
			$("#id_str").attr("placeholder", $("#id_str").attr("placeholder"));
			$("#id_str").css({
				"border" : "2px solid red"
			});
			return false;
		}
		if ($("#pass_chk").val() == "N") {
			$("#passwd_re").focus();
			$("#passwd_re").attr("placeholder",
					$("#passwd_re").attr("placeholder"));
			$("#passwd_re").css({
				"border" : "2px solid red"
			});
			return false;
		}
		return;

	}

	/* function ajax_submit() {
		var postData = $(this).serializeArray();
		var formURL = $(this).attr("action");
		var formMethod = $(this).attr("method");

		$.ajax(

		{
			type : formMethod,
			url : formURL,
			data : postData,
			success : function(data) {
				console.log(data);
			}

		}

		);
	} */

	function DaumPostcode() {
		new daum.Postcode(
				{
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
</SCRIPT>

<section id="form">
	<!--form-->
	<div class="container">
		<!-- Content Row -->
		<div class="row row-centered">
			<!-- Content Column -->
			<div class="col-md-12 col-centered">
				<form id="regist" action="regist.do" method="post">
					<input type="hidden" id="id_chk" name="id_chk" value="N"> <input
						type="hidden" id="pass_chk" name="pass_chk" value="N">
					<fieldset>
						<legend>회원가입</legend>

						<div class="col-md-12">
							<div class="form-group">
								<label for="id_str">아이디</label>
								<div class="input-group">
									<input type="text" for="" class="form-control" id="id_str"
										name="id_str" placeholder="아이디"> <span
										class="input-group-btn">
										<button id="id_chk_btn" type="button" class="btn btn-success">
											중복체크<i class="fa fa-mail-forward spaceLeft"></i>
										</button>
									</span>
								</div>
							</div>
						</div>



						<div class="col-md-12">
							<div class="form-group">
								<label for="passwd_str">비밀번호</label> <input type="text"
									id="passwd_str" name="passwd_str" for="passwd"
									class="form-control" placeholder="비밀번호" />
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label for="passwd_re">비밀번호 확인</label><input type="text"
									id="passwd_re" for="passwd_re" class="form-control"
									placeholder="비밀번호 확인" />
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label for="name_str">이름</label> <input type="text"
									id="name_str" name="name_str" for="" class="form-control"
									placeholder="이름" />
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label for="post_str">우편번호</label>
								<div class="input-group">
									<input type="text" id="post_str" name="post_str" for=""
										class="form-control" placeholder="우편번호" /> <span
										class="input-group-btn">
										<button id="id_chk_btn" onclick="DaumPostcode()" type="button"
											class="btn btn-success">
											우편번호 검색<i class="fa fa-mail-forward spaceLeft"></i>
										</button>
									</span>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label for="addr_str">주소</label> <input type="text"
									id="addr_str" name="addr_str" for="" class="form-control"
									placeholder="주소" />
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="addr2_str">나머지 주소</label> <input type="text"
									id="addr2_str" for="" name="addr2_str" class="form-control"
									placeholder="나머지 주소" />
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="email_str">이메일</label> <input type="text"
									id="email_str" for="" name="email_str" class="form-control"
									placeholder="이메일" />

							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="tel_str">연락처</label> <input type="text" id="tel_str"
									name="tel_str" class="form-control" placeholder="연락처" />

							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label for="cel_str">핸드폰번호</label> <input type="text"
									id="cel_str" for="" name="cel_str" class="form-control"
									placeholder="핸드폰번호" />

							</div>
						</div>


						<div class="col-md-12">
							<label for="regist_reset"></label> <input type="reset"
								name="regist_reset" id="regist_reset"
								class="form-control btn btn-danger" value="취소">
						</div>
					</fieldset>
				</form>
				<div class="col-md-12">

					<label for="regist_submit"></label> <input type="button"
						name="regist_submit" id="regist_submit"
						class="form-control btn btn-info" value="회원가입">
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
</section>
<!--/form-->

