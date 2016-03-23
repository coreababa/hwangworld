<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width-device-width, initial-scale=1"  charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
   
   *{
      margin: 0;
      padding: 0;
   }
   
   body{
      background: #ccc;
   }
   
   #wrapper{
      width: 96%;
      margin: 0 auto;
      background-color: white;
   }
   
   header{
      width: 100%;
      height: 120px;
      background-color: #E9BABA;
      border-bottom: 1px solid grey;
   }
   
   header h1{
      padding-top: 30px;
      padding-left: 12.5%;
      font-size: 2.5em;
      font-family: "Comic Sans MS"
   }
   
   article{
      float: left;
      width: 62.5%;
      padding: 2.0833%;
   }
   
   aside{
      float: right;
      width: 31.25%;
      padding: 0.8333%;
      background-color: #d7e4e0;
      border-left: 1px dotted black;
   }
   
   footer{
      clear: both;
      background-color: #677b75;
      padding: 1.04166%;
      text-align: center;
   }
   
</style>

</head>
<body>
   
   <div id="wrapper">
      
      <header>
         <h1 class="header1">Fluid Layout</h1>
      </header>
      
      <section>
         <article>
            <p>Hello World 1</p>
            <p>Hello World 2</p>
            <p>Hello World 3</p>
            <p>Hello World 4</p>
            
         </article>
         
         <aside>
            <p>Hi world 1</p>
            <p>Hi world 2</p>
            <p>Hi world 3</p>
            <p>Hi world 4</p>            
         </aside>
      
      </section>
      
      <footer>
         <address>espotter@naver.com</address>
         <p>서울시 서대문구 홍은동</p>
      </footer>
      
      
      
      
   </div>
   
</body>
</html>