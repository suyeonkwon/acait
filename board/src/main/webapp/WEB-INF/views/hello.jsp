<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script src="https://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
 
<style type="text/css">
  .tooltipUI{
     background-color:#FAF4C0; 
  }
  
  .ui-tooltip {
    padding: 20px;
    position: absolute;
    z-index: 9999;
    max-width: 600px;
    -webkit-box-shadow: 0 0 5px #aaa;
    box-shadow: 0 0 5px #aaa;
//  background-color:red;
  }
  
  body .ui-tooltip {
    border-width: 2px;
  }
</style>
 
<script type="text/javascript">
  $(function() {
    $('.row').tooltip({
      tooltipClass:'tooltipUI',
      content: function(callback) {
        callback($(this).prop('title'));
      }
    });
  });
</script>

<script type="text/javascript">
$(function(){
// 	hello("${name}");
	$("#bos").draggable({
		cancel : "#content"
	});
	
});


function hello(name){
	var phrase = 'Hello,'+name;
	var a = '1';
	say(phrase);
}

function say(phrase){
	alert('**'+phrase+'**');
	alert("workspace test");
}

function conditionBreak(){
	for(var i=0; i<10; i++){
		alert(i);
	}
}

var roll = 1;
function imagechange(){
	setInterval(function(){
		roll++;
		if(roll>3) {roll = 1;}
		
		if(roll==1) {
			$(".a1").css("background","yellow");
			$(".a2").css("background","black");
			$(".a3").css("background","pink");
		}
		if(roll==2){
			$(".a1").css("background","pink");
			$(".a2").css("background","yellow");
			$(".a3").css("background","black");			
		}
		if(roll==3){
			$(".a1").css("background","black");
			$(".a2").css("background","pink");
			$(".a3").css("background","yellow");					
		}
	},500);	
}

</script>
<style type="text/css">
ul{
    list-style:none;
}
.wrapper{
    display: flex;
    justify-content: center;
    align-items: center;
}
.container{
    width:600px;
    height:400px;
    position: relative;
    background-color: antiquewhite;
    overflow: hidden;
}
.slider{
    display: flex;
    position:absolute;
    top:0;
    left:0;
}
.item{
    width:100%;
    height:400px;
    background-color: yellow;
    font-size: 35px;
    text-align: center;
}
.item:nth-child(2){
    background-color: green;
}
.item:nth-child(3){
    background-color: blue;
}
.btn{
    font-size: 50px;
}
.prev{
    position:absolute;
    top:30%;
    left:0;
}
.next{
    position:absolute;
    top:30%;
    right:0%;
}
.container ul{
    -webkit-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
    -o-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
    transition: all 0.25s cubic-bezier(1, .01, .32, 1);
}
</style>
<script type="text/javascript">	
	$(function(){
		$('.next').click(function(){
			plusSlides(1);
		});
		$('.prev').click(function(){
			plusSlides(-1);
		});
		
	    //대상 설정
	    var slideArea = $(".slider"),
	        slideNumber = $('.item').length,
	        //설정 - 이벤트 드래그 이동량
	        dragSize = 100,
	        //기본값
	        slideCount = 1,
	        mDown = false;
	    
	    //마우스 좌클릭 확인
	    slideArea.mousedown(function(event){
	        mDown = true;
	        dragX = event.pageX;
	    });
	    slideArea.mouseup(function(){
	        mDown = false;
	    });
	    
	    
	    //마우스 드래그 확인
	    slideArea.mousemove(function(event){
	        
	        //마우스가 좌클릭 상태로 마우스를 'dragSize' 이상 이동시
	        if(mDown == true && dragX + dragSize < event.pageX){ 
	            
	        	 alert("왼쪽으로 이동!");
	            //기준점 재정의
	            dragX = event.pageX;
	            mDown = false;
	            
	            if(1 < slideCount){
					plusSlides(-1);
	                slideCount --;
	            }
	        }
	        if(mDown == true && dragX - dragSize > event.pageX){
	                        
	            dragX = event.pageX;
	            alert("오른쪽으로 이동!");
	            mDown = false;
	
	            if(slideCount < slideNumber){
	                slideCount ++;
	                plusSlides(1);
	            }
				
	        }
	        
	    });
	    
		$('.slider').width(600 * $('.item').length + 'px');
	});
	
	var slideIndex = 0;
	function showSlides(n) {

		var totalSlides = $('.item').length; // item의 갯수
		var sliderWidth = $('.container').width(); // container의 width
		var slider = $('.slider');
		
	    slideIndex = n;
		if(slideIndex == -1){
			slideIndex = 0;
			return false;
		}
		if(slideIndex == totalSlides){
			slideIndex--;
			return false;
		}
		$(slider).css('left',-(sliderWidth * slideIndex) + 'px');
	}
	
	function plusSlides(n){
	    showSlides(slideIndex += n);
	}
	  
	function currentSlide(n) {
	    showSlides(slideIndex = n);
	}
	
	var nextBtn = document.querySelector('.next');
	var prevBtn = document.querySelector('.prev');
	
</script>
<title>Insert title here</title>
</head>
<body>
<span class="a1">1</span><span class="a2">2</span><span class="a3">3</span>
    <div class="wrapper">
        <div class="container">
            <ul class="slider">
                <li class="item">1st</li>
                <li class="item">2nd</li>
                <li class="item">3rd</li>
            </ul>
        </div>
        <div class="btn">
            <a class="prev" style="text-decoration: none;">&#10094;</a>
            <a class="next" style="text-decoration: none;">&#10095;</a>
        </div>
    </div>
</body>
</html>