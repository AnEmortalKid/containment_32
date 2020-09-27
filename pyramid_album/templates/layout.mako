# -*- coding: utf-8 -*- 
<!DOCTYPE html>  
<html>
<head>
  <meta charset="utf-8">
  <title>Pyramids</title>
  <meta name="author" content="Pyramids">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>

  % if request.session.peek_flash():
  <div id="flash">
    <% flash = request.session.pop_flash() %>
	% for message in flash:
	${message}<br>
	% endfor
  </div>
  % endif

  <div id="page">
    
    ${next.body()}

  </div>
  
</body>
</html>