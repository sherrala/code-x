<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >

<head>
  <meta charset="utf-8">
  <!-- If you delete this meta tag World War Z will become a reality -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>code-x</title>

  <!-- If you are using the CSS version, only link these 2 files, you may add app.css to use for your overrides if you like -->
  <link rel="stylesheet" href="includes/css/normalize.css">
  <link rel="stylesheet" href="includes/css/foundation.css">

  <!-- If you are using the gem version, you need this only -->
  <link rel="stylesheet" href="includes/css/app.css">
  
  <script src="includes/js/vendor/modernizr.js"></script>

</head>
<body>

  <cfoutput>#renderView()#</cfoutput>

  <script src="includes/js/vendor/jquery.js"></script>
  <script src="includes/js/foundation.min.js"></script>
  <script>
    $(document).foundation();
  </script>
</body>
</html>