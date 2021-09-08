//
//  RegisterViewController.swift
//  Elearning app
//
//  Created by Mahmoud on 7/7/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController ,Myprotocol{
    
    lazy var model  = {
        return RegisterModel(delegate: self)
    }()

    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func siginPressed(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "login") as! LoginViewController
               self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        let uName = userName.text
        let  Email = email.text
        let Password = password.text
        let confiPassword  = confirmPassword.text
        if (uName != "" && Email != "" && Password != "" && confiPassword != ""){
            if Password == confiPassword{
            model.registerOperation(email: Email!, password: Password!)
            }else {
                print("Passwords are not matched ")
                 self.showPopupWithTitle(title: "message", message: "Passwords are not matched", interval: 1)
                
            }
        }else {
            
            print("all fields are required ")
            self.showPopupWithTitle(title: "message", message: "all fields are required", interval: 1)
        }
        
        
         let vcc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "home") as! HomeViewController
                self.present(vcc, animated: true, completion: nil)
        
        
        
        
    }
    
    func showPopupWithTitle(title: String, message: String, interval: TimeInterval) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        self.perform(#selector(dismissAlertViewController), with: alertController, afterDelay: interval)
    }

    @objc func dismissAlertViewController(alertController: UIAlertController) {
        alertController.dismiss(animated: true, completion: nil)
    }
    
    
    // func
    
    func getData(arr: [SuccessPOGOs]) {
        DispatchQueue.main.async {
                  self.showPopupWithTitle(title: "Title", message: "\(arr[0].code!)", interval: 1)
              }
        
    }
    
    func getdata(arr: [FailPOGOs]) {
        DispatchQueue.main.async {
                  self.showPopupWithTitle(title: "Title", message: "\(arr[0].code!)", interval: 1)
              }
        
    }
    
    
}
