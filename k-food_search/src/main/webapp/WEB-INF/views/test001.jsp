<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	<link rel="stylesheet" href="../css/test_slider.css" type="text/css" />
</script>
<script type="text/javascript" src="../js/test_slider.js"></script>
<style>
.image {
  float: left;
  height: 120px;
  width: 120px;
  background: #888888;
  text-align: center;
  padding: 5px;
  margin: 5px;
  font-size: 1.5rem;
}
.image-container {
  width: 650px;
  position: relative;
}
.slider-display {
  max-width: 450px;
  overflow: hidden;
  background: #ddd
}
.centered {
  margin: 0 auto;
}
</style>
</head>
<body>

  <div class="slider-display centered">
    <div class="image-container">
      <div class="image">Image<br>1</div>
      <div class="image">Image<br>2</div>
      <div class="image">Image<br>3</div>
      <div class="image">Image<br>4</div>
      <div class="image">Image<br>5</div>
      <div class="image">Image<br>6</div>
      <div class="image">Image<br>7</div>
      <div class="image">Image<br>8</div>
      <div class="image">Image<br>9</div>
      <div class="image">Image<br>10</div>
      <div class="image">Image<br>11</div>
      <div class="image">Image<br>12</div>
      <div class="image">Image<br>13</div>
      <div class="image">Image<br>14</div>
      <div class="image">Image<br>15</div>
      <div class="image">Image<br>16</div>
      <div class="image">Image<br>17</div>
      <div class="image">Image<br>18</div>
    </div>
    
  </div>
  <div class="centered" style="text-align: center; max-width: 450px;">
    <button class="move-right"><--</button>
    <button class="move-left">--></button>
  </div>
</body>
</html>