<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  
  <div class="container-fluid mt-3">
    <h1>No Gutters</h1>
    <p>To change the gutters (extra space) between columns, use any of the <code class="w3-codespan">.g-1|2|3|4|5</code> classes 
    (<code class="w3-codespan">.g-4</code> is default). </p>
    <p>To remove the gutters completely, use <code class="w3-codespan">.g-0</code>:</p>
  
    <div class="container-fluid">
      <div class="row g-0">
        <div class="col-3 bg-success">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br>
          Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        </div>
        <div class="col-9 bg-warning">
          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
        </div>
      </div>
    </div>
  </div>
</body>
</html>
