<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
 header("Location: index.php");
 exit;
}
// select logged-in users detail
$res=mysqli_query($conn, "SELECT * FROM user WHERE userId=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Hi
            <?php echo $userRow['userName']; ?>
        </title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/creative.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">Welcome <?php echo $userRow['userName']; ?></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#books">Books</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#CDs">CDs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#DVDs">DVDs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="logout.php?logout">Sign out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="masthead text-center text-white d-flex">
            <div class="container my-auto">
                <div class="row">
                    <div class="col-lg-10 mx-auto">
                        <h1 class="text-uppercase">
                            <strong>Welcome to our library</strong>
                        </h1>
                        <hr>
                    </div>
                    <div class="col-lg-8 mx-auto">
                        <p class="text-faded mb-5">navigate throw hundreds of books,CDs and DVDs</p>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
                    </div>
                </div>
            </div>
        </header>

        <section class="bg-primary" id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center">
                        <h2 class="section-heading text-white">We've got what you need!</h2>
                        <hr class="light my-4">
                        <p class="text-faded mb-4">we are offering the best books,CDs and DVDs for you!</p>
                        <a class="btn btn-light btn-xl js-scroll-trigger" href="#books">Get Started!</a>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <hr>
        <h1 class='text-danger text-center '>Books</h1>
        <hr>
        <section id="books">
        <?php
$sql = "SELECT
`books`.`book_id`,
`books`.`title`,
`books`.`img`,
`books`.`type`,
`books`.`ISBN_code`,
`books`.`publish_date`,
`books`.`description`,
`publisher`.`name`,
`author`.`first_name`,
`author`.`last_name`
FROM `books`
LEFT JOIN `publisher`
ON `books`.`fk_publisher_id`= `publisher`.`publisher_id`
LEFT JOIN `author`
ON `books`.`fk_author_id`= `author`.`author_id` ";
        $result = mysqli_query($conn, $sql);
        
        
        echo"<table class='table table-bordered' >
                      <thead>
                        <tr>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>title</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>img</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>author</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>publisher</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>isbn code</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>publish date</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>description</th>				     
                        </tr>
                      </thead>";		
                    while($row = mysqli_fetch_array($result)) {	
                    
                        echo    "<tr><td>{$row['title']}</td>
                                <td><img src='{$row['img']}'width='150'></td>
                                <td>{$row['first_name']} {$row['last_name']}</td>
                                <td>{$row['name']}</td>
                                <td>{$row['ISBN_code']}</td>
                                <td>{$row['publish_date']}</td>
                                <td>{$row['description']}</td></tr>";
                };
        echo "</table>";
        ?>
        </section>
        <hr>
        <h1 class='text-danger text-center '>CDs</h1>
        <hr>
        <section id="CDs">
        <?php
        $sql = "SELECT
        `cds`.`CD_id`,
        `cds`.`title`,
        `cds`.`img`,
        `cds`.`type`,
        `cds`.`publish_date`,
        `cds`.`description`,
        `producer`.`name`,
        `author`.`first_name`,
        `author`.`last_name`
        FROM `cds`
        LEFT JOIN `producer`
        ON `cds`.`fk_producer_id`= `producer`.`producer_id`
        LEFT JOIN `author`
        ON `cds`.`fk_author_id`= `author`.`author_id` ";
        $result = mysqli_query($conn, $sql);
        
        
        echo"<table class='table table-light table-bordered'>
                      <thead>
                        <tr>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>title</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>img</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>author</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>producer</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>publish date</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>description</th>				     
                        </tr>
                      </thead>";		
                    while($row = mysqli_fetch_array($result)) {	
               echo"<tr><td>{$row['title']}</td>
               <td><img src='{$row['img']}'width='150'></td>
               <td>{$row['first_name']} {$row['last_name']}</td>
               <td>{$row['name']}</td>
               <td>{$row['publish_date']}</td>
               <td>{$row['description']}</td></tr>";
               
            };
        echo "</table>";
   
        ?>

        </section>

        <hr>
        <h1 class='text-danger text-center '>DVDs</h1>
        <hr>
        <section id="DVDs">
        <?php
        $sql = "SELECT
        `dvds`.`DVD_id`,
        `dvds`.`title`,
        `dvds`.`img`,
        `dvds`.`type`,
        `dvds`.`publish_date`,
        `dvds`.`description`,
        `producer`.`name`,
        `author`.`first_name`,
        `author`.`last_name`
        FROM `dvds`
        LEFT JOIN `producer`
        ON `dvds`.`fk_producer_id`= `producer`.`producer_id`
        LEFT JOIN `author`
        ON `dvds`.`fk_author_id`= `author`.`author_id` ";
        $result = mysqli_query($conn, $sql);
        
        
        echo"<table class='table table-light table-bordered'>
                      <thead>
                        <tr>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>title</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>img</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>author</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>producer</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>publish date</th>
                          <th scope='col' style='border-color:#F05F40; text-align:center;'>description</th>				     
                        </tr>
                      </thead>";		
                    while($row = mysqli_fetch_array($result)) {	
               echo"<tr><td>{$row['title']}</td>
               <td><img src='{$row['img']}' width='150'></td>
               <td>{$row['first_name']} {$row['last_name']}</td>
               <td>{$row['name']}</td>
               <td>{$row['publish_date']}</td>
               <td>{$row['description']}</td></tr>";
        };
        echo "</table>";
        ?>
        </section>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/creative.min.js"></script>

    </body>

    </html>