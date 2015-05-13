<%@ page contentType="text/html; charset=ISO-8859-1" language="java"
         errorPage=""%>
<%@page import="org.owasp.webgoat.session.WebSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    WebSession webSession = ((WebSession) session.getAttribute(WebSession.SESSION));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
        <!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
        <!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
        <!--[if gt IE 8]><!-->

        <!--  CSS -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"/>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css"/>
        <!-- Fonts from Font Awsome -->
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <!-- CSS Animate -->
        <link rel="stylesheet" href="css/animate.css"/>
        <!-- Custom styles for this theme -->
        <link rel="stylesheet" href="css/main.css"/>
        <!--  end of CSS -->

        <!-- JS -->
        
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->

        <!-- Require.js used to load js asynchronously -->
        <script src="js/libs/require.min.js" data-main="js/main.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>WebGoat</title>
    </head>
    <body>
        <section id="container">
            <header id="header">
                <!--logo start-->
                <div class="brand">
                    <a href="${pageContext.request.contextPath}/start.mvc" class="logo"><span>Web</span>Goat</a>
                </div>
                <!--logo end-->
                <div class="toggle-navigation toggle-left">
                    <button type="button" class="btn btn-default" id="toggle-left" data-toggle="tooltip" data-placement="right" title="Toggle Navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                </div><!--toggle navigation end-->
                <div class="lessonTitle" >
                    <h1 id="lessonTitle"></h1>
                </div><!--lesson title end-->
                <div class="user-nav pull-right" style="margin-right: 75px;">
                    <div class="dropdown" style="display:inline">
                        <button type="button" class="btn btn-default dropdown-toggle" id="dropdownMenu1" >
                            <i class="fa fa-user"></i> <span class="caret"></span>
                        </button>                   
                        <ul class="dropdown-menu dropdown-menu-left" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value="j_spring_security_logout" />">Logout</a></li>
                            <li role="presentation" class="divider"></li>     
                            <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">User: ${user}</a></li>
                            <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Role: ${role}</a></li>
                            <li role="presentation" class="divider"></li>   
                            <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">${version}</a></li>
                            <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Build: ${build}</a></li>                            

                        </ul>
                    </div>
                    <button type="button" class="btn btn-default right_nav_button" data-toggle="tooltip" title="About WebGoat">
                        <i class="fa fa-info"></i>
                    </button>
                    <a href="mailto:${contactEmail}?Subject=Webgoat%20feedback" target="_top">
                        <button type="button" class="btn btn-default right_nav_button"data-toggle="tooltip" title="Contact Us">
                            <i class="fa fa-envelope"></i>
                        </button>
                    </a>


                </div>
            </header>

            <aside class="sidebar" >
                <div id="menuContainer"></div>
            </aside>
            <!--sidebar left end-->

            <!--main content start-->
            <section class="main-content-wrapper">
                <section id="main-content" > <!--ng-controller="goatLesson"-->
                    <div class="row">
                        <div class="col-md-8">
                            <div class="col-md-12" align="left">
                                <div class="panel">
                                    <div id="help-buttons" class="panel-body">
                                        <!-- <button type="button" id="showSourceBtn" ng-show="showSource" class="btn btn-primary btn-xs" onclick="showLessonSource()">Java [Source]</button>
                                        <button type="button" id="showSolutionBtn" class="btn btn-primary btn-xs" onclick="showLessonSolution()">Solution</button>
                                        <button type="button" id="showPlanBtn" class="btn btn-primary btn-xs" onclick="showLessonPlan()">Lesson Plan</button>
                                        <button type="button" id="showHintsBtn" ng-show="showHints" class="btn btn-primary btn-xs"  onclick="viewHints()">Hints</button>
                                        <button type="button" id="restartLessonBtn"  class="btn btn-xs"  onclick="restartLesson()">Restart Lesson</button> -->
                                    </div>
                                </div>
                                <div class="lessonHelp" id="lesson-hint-row">
                                    <h4>Hints</h4>
                                    <div class="panel" >
                                        <div class="panel-body" id="lesson_hint">
                                            <span class="glyphicon-class glyphicon glyphicon-circle-arrow-left" id="showPrevHintBtn" onclick="viewPrevHint()"></span>
                                            <span class="glyphicon-class glyphicon glyphicon-circle-arrow-right" id="showNextHintBtn" onclick="viewNextHint()"></span>
                                            <br/>
                                            <span ng-show="showHints" bind-html-unsafe="curHint"></span>
                                            <!--<span id="curHintContainer"></span>-->
                                        </div>                                    
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" align="left">
                                <div id="lessonContentWrapper" class="panel">

                                </div>
                            </div>
                        </div><!--col-md-8 end-->
                        <div class="col-md-4">
                            <div class="col-md-12">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div align="left">
                                            <h3>Cookies / Parameters</h3>
                                        </div>
                                        <hr />
                                        <div id="cookiesAndParamsView">
                                            <div class="cookiesView">
                                                <h4>Cookies</h4>
                                                <!-- <div class="cookieContainer" ng-repeat="cookie in cookies">
                                                    <table class="cookieTable table-striped table-nonfluid" >
                                                        <thead>
                                                            <tr><th class="col-sm-1"></th><th class="col-sm-1"></th></tr> 
                                                        </thead>
                                                        <tbody>
                                                            <tr ng-repeat="(key, value) in cookie">
                                                                <td>{{key}}</td>
                                                                <td>{{value}}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div> -->
                                            </div>
                                            <div id="paramsView"> <!--class="paramsView"-->
                                                <h4>Params</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!--col-md-4 end-->         
                    </div>
                    <div id="lessonHelpsWrapper">
                        <div class="row lessonHelp" id="lesson-cookies-row">
                            <div class="col-md-12">
                                <h4>Lesson Parameters and Cookies</h4>
                                
                            </div>
                        </div>   

                        <div class="row lessonHelp" id="lesson-plan-row">
                            <div class="col-md-12">
                                <h4>Lesson Plan</h4>
                                <div class="panel" >
                                    <div class="panel-body" id="lesson-plan">
                                        <!-- allowing jQuery to handle this one -->
                                    </div>                                    
                                </div>
                            </div>
                        </div> 
                        <div class="row lessonHelp" id="lesson_solution_row">
                            <div class="col-md-12">
                                <h4>Lesson Solution</h4>
                                <div class="panel">
                                    <div class="panel-body" id="lesson_solution">
                                    </div>                                    
                                </div>
                            </div>
                        </div> 
                        <div class="row lessonHelp" id="lesson_source_row">
                            <div class="col-md-12">
                                <h4>Lesson Source Code</h4>
                                <div class="panel">
                                    <div class="panel-body" id="lesson_source">
                                        <!-- <pre>{{source}}</pre> -->
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>

        </section>


        <!-- About WebGoat Modal -->
        <div class="modal fade" id="aboutModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <jsp:include page="../pages/about.jsp"/> 
                </div>
            </div>
        </div>
    </body>


</html>
