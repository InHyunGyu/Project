<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

     
 <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>UtaJJang</title>
        <!-- Favicons-->
        <link rel="shortcut icon" href="resources/assets/images/favicon.png">
        <link rel="apple-touch-icon" href="resources/assets/images/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="resources/assets/images/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="resources/assets/images/apple-touch-icon-114x114.png">
        <!-- Web Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600%7cPlayfair+Display:400i" rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <!-- Plugins-->
        <link href="resources/assets/css/plugins.min.css" rel="stylesheet">
        <!-- Template core CSS-->
        <link href="resources/assets/css/template.css" rel="stylesheet">
    </head>
    <body>

        <!-- Preloader-->
        <div class="page-loader">
            <div class="page-loader-inner">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Preloader end-->

        <!-- Header-->
        <header class="header header-transparent">
            <div class="container-fluid">
                <!-- Brand-->
                <div class="inner-header"><a class="inner-brand" href="/www">UtaJJang</a></div>
                <!-- Navigation-->
                <div class="inner-navigation collapse">
                    <div class="inner-nav"> 
                        <ul>
                            <li class="menu-item-has-children menu-item-has-mega-menu"><a href="#"><span class="menu-item-span">Home</span></a>
                                <div class="mega-menu">
                                    <ul class="sub-menu mega-menu-row" data-background="resources/assets/images/menu-3.jpg">
                                                                           </ul>
                                </div>
                            </li>
                            <li class="menu-item-has-children menu-item-has-mega-menu"><a href="#"><span class="menu-item-span">Pages</span></a>
                                <div class="mega-menu">
                                    <ul class="sub-menu mega-menu-row" data-background="resources/assets/images/menu-1.jpg">
                                        
                                    </ul>
                                </div>
                            </li>
                            <li class="menu-item-has-children"><a href="#"><span class="menu-item-span">Portfolio</span></a>
                                <ul class="sub-menu">
                                    
                                </ul>
                            </li>
                            <li class="menu-item-has-children"><a href="#"><span class="menu-item-span">Blog</span></a>
                                <ul class="sub-menu">
                                   
                                   
                                </ul>
                            </li>
                            <li class="menu-item-has-children"><a href="#"><span class="menu-item-span">Shop</span></a>
                                <ul class="sub-menu">
                                   
                                </ul>
                            </li>
                            <li class="menu-item-has-children menu-item-has-mega-menu"><a href="current_music"><span class="menu-item-span">Components</span></a>
                                <div class="mega-menu">
                                    <ul class="sub-menu mega-menu-row" data-background="resources/assets/images/menu-2.jpg">
                                       
                                    </ul>
                                </div>
                            </li>
                            <li><a href="file_list"><span class="menu-item-span">Demos</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="extra-nav">
                    <ul>
                        <li><a class="top-bar-cart" href="shop-cart-1.html"><span class="menu-item-span"><i class="ti-shopping-cart"></i><span>3</span></span></a></li>
                        <li><a class="off-canvas-open" href="#"><span class="menu-item-span"><i class="ti-menu"></i></span></a></li>
                        <li class="nav-toggle"><a href="#" data-toggle="collapse" data-target=".inner-navigation"><span class="menu-item-span"><i class="ti-menu"></i></span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- Header end-->
 
        <!-- Wrapper-->
        <div class="wrapper">
            <section class="module-cover parallax text-center" data-background="resources/assets/images/module-10.jpg" data-overlay="1" data-gradient="1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="space" data-mY="60px"></div> 
                            <h1 class="demo-heading"><strong>Uta<span>J</span>Jang</strong></h1>
                            <p class="m-b-40">Quickly create your One or Multi Page website in fastest<br> and easiest way with SASS and Pug based template.</p>
                            <div class="space" data-MY="60px"></div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="module p-t-0">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 m-auto">
                            <div class="space" data-mY="-120px"></div>
                            <p><img src="resources/assets/images/main/macbook.png" alt=""></p>
                            <div class="space" data-mY="80px"></div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid" style="max-width: 1600px;">
                    <div class="row">
                        <div class="col-md-6">
                            <h6 class="text-special text-center m-b-40">Multi Page Demos</h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="/www"><img src="resources/assets/images/demo/1.jpg" alt=""></a>
                                        <h6>Parallax</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="index-2.html"><img src="resources/assets/images/demo/2.jpg" alt=""></a>
                                        <h6>Slider - Slide</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="index-3.html"><img src="resources/assets/images/demo/3.jpg" alt=""></a>
                                        <h6>Slider - Fade</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="index-4.html"><img src="resources/assets/images/demo/4.jpg" alt=""></a>
                                        <h6>Youtube</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="index-5.html"><img src="resources/assets/images/demo/5.jpg" alt=""></a>
                                        <h6>Vimeo</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="index-6.html"><img src="resources/assets/images/demo/6.jpg" alt=""></a>
                                        <h6>Local Video</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="index-7.html"><img src="resources/assets/images/demo/7.jpg" alt=""></a>
                                        <h6>Gradient Style 1</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="index-8.html"><img src="resources/assets/images/demo/8.jpg" alt=""></a>
                                        <h6>Gradient Style 2</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h6 class="text-special text-center m-b-40">One Page Demos</h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index.html"><img src="resources/assets/images/demo/op-1.jpg" alt=""></a>
                                        <h6>Parallax</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index-2.html"><img src="resources/assets/images/demo/op-2.jpg" alt=""></a>
                                        <h6>Slider - Slide</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index-3.html"><img src="resources/assets/images/demo/op-3.jpg" alt=""></a>
                                        <h6>Slider - Fade</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index-4.html"><img src="resources/assets/images/demo/op-4.jpg" alt=""></a>
                                        <h6>Youtube</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index-5.html"><img src="resources/assets/images/demo/op-5.jpg" alt=""></a>
                                        <h6>Vimeo</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index-6.html"><img src="resources/assets/images/demo/op-6.jpg" alt=""></a>
                                        <h6>Local Video</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index-7.html"><img src="resources/assets/images/demo/op-7.jpg" alt=""></a>
                                        <h6>Gradient Style 1</h6>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="demo-item"><a href="op-index-8.html"><img src="resources/assets/images/demo/op-8.jpg" alt=""></a>
                                        <h6>Gradient Style 2</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer-->
            <footer class="footer">
                <div class="footer-widgets">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <!-- Text widget-->
                                <aside class="widget widget-text">
                                    <div class="widget-title">
                                        <h6>About Us</h6>
                                    </div>
                                    <div class="textwidget">
                                        <p>Map where your photos were taken and discover local points of interest. Map where your photos.</p>
                                        <p>
                                            Location: 12 London Avenue, Suite 18<br>
                                            E-mail: support@theme.com<br>
                                            Phone: 8 800 123 4567<br>
                                        </p>
                                        <ul class="social-icons">
                                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                            <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                        </ul>
                                    </div>
                                </aside>
                            </div>
                            <div class="col-md-3">
                                <!-- Recent entries widget-->
                                <aside class="widget widget-recent-entries">
                                    <div class="widget-title">
                                        <h6>Recent Posts</h6>
                                    </div>
                                    <ul>
                                        <li><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">May 8, 2018</span></li>
                                        <li><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">April 7, 2018</span></li>
                                        <li><a href="#">Map where your photos were taken and discover local points.</a><span class="post-date">September 7, 2018</span></li>
                                    </ul>
                                </aside>
                            </div>
                            <div class="col-md-3">
                                <!-- Twitter widget-->
                                <aside class="widget twitter-feed-widget">
                                    <div class="widget-title">
                                        <h6>Twitter Feed</h6>
                                    </div>
                                    <div class="twitter-feed" data-twitter="double_theme" data-number="1"></div>
                                </aside>
                            </div>
                            <div class="col-md-3">
                                <!-- Recent works-->
                                <aside class="widget widget-recent-works">
                                    <div class="widget-title">
                                        <h6>Portfolio</h6>
                                    </div>
                                    <ul>
                                        <li><a href="#"><img src="resources/assets/images/widgets/1.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/2.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/3.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/7.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/8.jpg" alt=""></a></li>
                                        <li><a href="#"><img src="resources/assets/images/widgets/6.jpg" alt=""></a></li>
                                    </ul>
                                </aside>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bar">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>© 2018 Boomerang, All Rights Reserved. Design with love by <a href="#">2theme</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer end-->
        </div>
        <!-- Wrapper end-->
        <!-- Off canvas-->
        <div class="off-canvas-sidebar">
            <div class="off-canvas-sidebar-wrapper">
                <div class="off-canvas-header"><a class="off-canvas-close" href="#"><span class="ti-close"></span></a></div>
                <div class="off-canvas-content">
                    <!-- Text widget-->
                    <aside class="widget widget-text">
                        <div class="textwidget">
                            <p class="text-center"><img src="resources/assets/images/logo-light-2.png" alt="" width="80px"></p>
                            <p class="text-center">See how users experience your website in realtime to see changes.</p>
                        </div>
                    </aside>
                    <!-- Recent portfolio widget-->
                    <aside class="widget widget-recent-works">
                        <ul>
                            <li><a href="#"><img src="resources/assets/images/widgets/1.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/2.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/3.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/4.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/5.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/6.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/7.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/8.jpg" alt=""></a></li>
                            <li><a href="#"><img src="resources/assets/images/widgets/9.jpg" alt=""></a></li>
                        </ul>
                    </aside>
                    <!-- Social Icons-->
                    <ul class="social-icons text-center">
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Off canvas end-->

        <!-- To top button--><a class="scroll-top" href="#top"><i class="fas fa-angle-up"></i></a>

        <!-- Scripts-->
        <script src="resources/assets/js/custom/jquery.min.js"></script>
        <script src="resources/assets/js/custom/popper.min.js"></script>
        <script src="resources/assets/js/bootstrap/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0rANX07hh6ASNKdBr4mZH0KZSqbHYc3Q"></script>
        <script src="resources/assets/js/custom/plugins.min.js"></script>
        <script src="resources/assets/js/custom/custom.min.js"></script>
    </body>
</html>    