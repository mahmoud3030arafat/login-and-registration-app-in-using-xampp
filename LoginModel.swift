//
//  LoginModel.swift
//  localhost
//
//  Created by Mahmoud on 9/4/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import Foundation
class LoginModel {
    
    var delgate : Myprotocol?
    init(delgate:Myprotocol) {
        self.delgate=delgate
    }
    
     func LoginOperation (email:String,password:String){
        
            
            
           
                   let postParameters = "em=\(email)&pas=\(password)"
            
            
                   
                       
                          var request = URLRequest(url: URL(string: "http://192.168.64.2/code.php")!)
                              // set the HTTP method to POST
                              request.httpMethod = "POST"
                              // set the HTTP body to the encoded "Post" struct
                             request.httpBody = postParameters.data(using: .utf8)
                              // set the appropriate HTTP header fields
                              request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                              // HACK: this line allows the workspace or an Xcode playground to execute the request, but is not needed in a real app
           
                             request.addValue( "application/json", forHTTPHeaderField: "Content-Type")
                             
                              // task for making the request
                              let task = URLSession.shared.dataTask(with: request) {data, response, error in
                                guard let data =  String(data: data!, encoding: .utf8)  else {return}

                              let st  =   "\(data)".utf8
                                print(st)
                                
   
                                do{
                                    let jsonArr = try JSONDecoder().decode([SuccessPOGOs].self, from: Data(st) )
                                    let jsonAr = try JSONDecoder().decode([FailPOGOs].self, from: Data(st) )
                                    
                                    print(jsonArr[0].code!)
                                    if !jsonArr.isEmpty {
                                        self.delgate?.getData(arr: jsonArr)
                                    }else{
                                        
                                        self.delgate?.getdata(arr: jsonAr)
                                        
                                    }
                                    


                                }catch{
                                    print(error)

                                }
                                
                                
                                
                             
                                  // also not necessary in a real app
                              }
                              task.resume()
                             
                          }
            
    
}

