<?php


require "init.php";

$email=$_POST["em"];
$password=$_POST["pas"];
//    echo $email ;
//    echo $password ;


  $query =   "INSERT INTO regist (em, pa)
VALUES ('".$email."','".$password."')";

$m=mysqli_query($con,$query);


if ($m)
{
$response=array();
$code="sign_up_true";



    $message="sign_up success. ";

array_push( $response,array("code"=>$code,"message"=>$message,"email"=>$email,"password"=>$password));

echo json_encode($response);






}
else
{
$response=array();
$code="reg_false";
$message="Some server error occurred. Try again....";
array_push($response,array("code"=>$code,"message"=>$message));
echo json_encode($response);

}
mysqli_close($con);
?>


