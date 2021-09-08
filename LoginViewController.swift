//
//  LoginViewController.swift
//  Elearning app
//
//  Created by Mahmoud on 7/7/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

import KRProgressHUD



class LoginViewController: UIViewController,LoginButtonDelegate,Myprotocol{
      func getData(arr: [SuccessPOGOs]) {
        if arr[0].code! == "login_true"{
            DispatchQueue.main.async {
                     // self.showPopupWithTitle(title: "Title", message: "\(arr[0].code!)", interval: 1)
                let vcc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "home") as! HomeViewController
                self.present(vcc, animated: true, completion: nil)
                
                }
            
            
        }else {
            
            DispatchQueue.main.async {
                       self.showPopupWithTitle(title: "Title", message: "\(arr[0].code!)", interval: 1)
                 
//                 let vcc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "home") as! HomeViewController
//                             self.present(vcc, animated: true, completion: nil)
                               }
            
            
        }

             
        
        
    }
    
    func getdata(arr: [FailPOGOs]) {
        DispatchQueue.main.async {
                  self.showPopupWithTitle(title: "Title", message: "\(arr[0].code!)", interval: 1)
              }
        
    }
    
    
    @IBOutlet weak var fb: FBLoginButton!
    
      lazy var modell  = {
                 return LoginModel(delgate: self)
             }()
         
    //var  ar : [blocks]=[]
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        if let token = AccessToken.current,
            !token.isExpired {
            // User is logged in, do work such as go to next view controller.
        }else {
            let loginButton = FBLoginButton()
            // loginButton.center = view.center
            let newCenter = CGPoint(x: 200, y: 400)
            loginButton.center = newCenter
            loginButton.delegate=self
            loginButton.permissions = ["public_profile", "email"]
            
            // view.addSubview(loginButton)
        }
    }
    
    
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        //
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
        
        //
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "register") as! RegisterViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBAction func login(_ sender: Any) {
        
         let Email = email.text
        let Password =  password.text
        if (Email != "" && Password != ""){
            modell.LoginOperation(email: Email!, password: Password!)
          
            
        }else {
            self.showPopupWithTitle(title: "message", message: "you forget email or password ", interval: 1)
            
        }
     
        
        
      
        
     
        
        
    }
    func showPopupWithTitle(title: String, message: String, interval: TimeInterval) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        self.perform(#selector(dismissAlertViewController), with: alertController, afterDelay: interval)
    }

    @objc func dismissAlertViewController(alertController: UIAlertController) {
        alertController.dismiss(animated: true, completion: nil)
    }

    
    
}
extension String{
    func localized()->String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
