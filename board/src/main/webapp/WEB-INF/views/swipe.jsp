<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
	<script src="https://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.css">
  <script type="text/javascript">
  	$(function(){
  		setSwiper();
  	});
  </script>
  <!-- Demo styles -->
  <style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
/*       width: 100%; */
/*       height: 100%; */
	  width:400px;
	  height: 200px;
      box-sizing: border-box
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
	  box-sizing: border-box;
	  border: 1px solid blue;
	  
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
  </style>
  
</head>
<body>
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide" >Slide 1</div>
      <div class="swiper-slide">Slide 2</div>
      <div class="swiper-slide" >Slide 3</div>
      <div class="swiper-slide" >Slide 4</div>
      <div class="swiper-slide" >Slide 5</div>
    </div>
    <!-- Add Pagination -->
    <div class='swiper-button-next'></div>
    <div class='swiper-button-prev'></div>
  </div>

  <!-- Swiper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>

  <!-- Initialize Swiper -->
  <script>
  function setSwiper(){
	var swiper = new Swiper(".swiper-container", {
		slidesPerView: 1.5,
		spaceBetween: 15,
		centeredSlides: true,
		navigation: {
		   nextEl: '.swiper-button-next',
		   prevEl: '.swiper-button-prev',
		}
	});	  
  }

//     var swiper = new Swiper('.swiper-container', {
//       slidesPerView: auto,
//       spaceBetween: 15,
//       centeredSlides: true,
//       pagination: {
//         el: '.swiper-pagination',
//         clickable: true,
//       },
//     });
  </script>
</body>
</html>
