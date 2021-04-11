<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$("#searchBox").autocomplete({
			source : function(request, response){
				$.ajax({
					type:'GET',
					url: '/academy/autoSearch',
					dataType:'json',
					succss:function(data){
						response(
							$.map(data.result, function(item){
								console.log(item);
								return {
									label : item+'label',
									value : item,
									test : item+'test'
								}
							})
						);
					},
					error: function(){
						alert("통신에 실패");
					}
				});
			},
			select : function(event, ui){
				console.log(ui);
				console.log(ui.item.label);
			},
			focus: function(event, ui){
				return false;
			},
			minLength:1,
			autoFocus:true,
			classes:{
				'ui-autocomplete' : 'highligh'
			},
			delay: 500,
			position:{my:'right top', at : 'right bottom'},
			close: function(event){
				console.log(event);
			}
		});
	});
</script>
</head>
<body>
<form>
	<input type="text" id="searchBox" placeholder="검색어를 입력하세요" />
	<input type="submit" value="검색" />
</form>
</body>
</html>