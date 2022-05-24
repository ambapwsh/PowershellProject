<?php
require "header.php";

//include "content.php";
    $uri =$_SERVER['REQUEST_URI'];

    if ($uri === '/'){
        require "content.php";
    }
    else if($uri === '/log'){
        require '../src/log/management.php';
       echo "work !";
    }
    else if($uri === '/rapport'){
        require '../src/rapport/rapport.php';
        var_dump($_SERVER['REQUEST_URI']);
    }
    else{
        require '../src/errors/404.php';
    }
    require 'footer.php';

