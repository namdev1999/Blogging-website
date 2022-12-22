
<%@page import="gist.beans.Blogger"%>
<%@page import="gist.daos.BloggerDao"%>
<%@page import="gist.beans.Admin"%>
<%@page import="gist.daos.AdminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Blogger blogger = (Blogger) session.getAttribute("blogger");
Admin admin = (Admin) session.getAttribute("admin"); 
if(blogger!=null)
 response.sendRedirect("blogger/dashboard.jsp"); 
else if(admin!=null)
 response.sendRedirect("admin/dashboard.jsp");

%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Login page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="assets/css/owl.css">

    <script>
        function ValidateDataAndSendOtp(userid,mobile,output){
            alert(userid+"," + mobile);
            ajax = new XMLHttpRequest();
            ajax.open("GET","SmsController?op=sendotp&userid="+userid+"&mobile="+mobile,true);
            ajax.send();
            ajax.onreadystatechange = function(){
                if(this.readyState==4 && this.status==200){
                    output.innerHTML = this.responseText;
        };
        }
    }
        </script>
  </head>

  <body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <jsp:include page="header.jsp"></jsp:include>

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="main-banner header-text">
      <div class="container-fluid">
      </div>
    </div>
   <br/><br/>
    <section class="blog-posts">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                  <!-- main conent area -->
                  
                  <div class="col-lg-12" style="height: 100vh">
                    <h2> Mobile Varification page </h2> <br/><br/>
                    <span style="color:red;font-weight: bold;font-size: 20px" id='s1'></span><br/>
                  <form>
                        <table class="table" width='50%'>
                        <tr>
                            <td>Enter Registered Email-Id(userid) </td>
                            <td>
                                <input type="email" id="userid" name="userid" class="form-control" required/>   
                            </td>
                        </tr>
                         <tr>
                            <td>Enter Registered Mobile  </td>
                            <td>
                                <input type="text" name="mobile" id="mobile" class="form-control" required/>   
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="button" name="submit" value="SEND OTP" class="btn btn-primary form-control " onclick="ValidateDataAndSendOtp(userid.value, mobile.value, s1);"/></td>
                        </tr>
                        <tr>
                            <td>Enter otp </td>
                            <td><input type="text" name="otp" class="form-control" required/></td>
                            
                        </tr>
                         <tr>
                             <td colspan="2"> <input type="button" value="submit otp" name="varify" class="form-control btn btn-success" /></td>
                            
                        </tr>
                    
                    </table>
                    </form>
                </div>
                
                
                </div>
            </div>
          </div>
          <!-- sidebr -->
        
        </div>
      </div>
    </section>

    
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

    
  </body>
</html>