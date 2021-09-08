<?php
     
    
//    $email="nour";
//    $pass="ios";
  
     require "init.php";
    $email=$_POST["em"];
    $password=$_POST["pas"];
    

    
    
    
   // $query="select * from regist where em like '".$email."' and pa like '".$pass."'";
    $query="SELECT em, pa FROM regist WHERE em ='".$email."'AND pa = '".$password."'";
     
    $result=mysqli_query($con,$query);
    if (mysqli_num_rows($result)>0)
    {
      
        $response=array();
        $code="login_true";
        //$row=mysqli_fetch_array($result);
         //$password=$row[1];
         //$email=$row[0];
        $message="login success..welcome";
        array_push($response,array("code"=>$code,"message"=>$message,"email"=>$email,"password"=>$password));
        echo json_encode($response);

        
    }
    else
    
    {
        $response=array();
        $code="login_false";
        $message="login failed..try again ";
        array_push($response,array("code"=>$code,"message"=>$message));
        echo json_encode($response);
        
        
    }
    mysqli_close($con);
    
?>
