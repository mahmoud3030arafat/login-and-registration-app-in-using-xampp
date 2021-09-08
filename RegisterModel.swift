
import UIKit

class RegisterModel {
    
    var task = URLSessionTask()
    
    
    
    var delegate : Myprotocol?
    init(delegate:Myprotocol) {
        self.delegate=delegate
    }
    
    func registerOperation (email:String,password:String){
    
        
        
       
               let postParameters = "em=\(email)&pas=\(password)"
        
           print(email)
        print(password)
               
                   
                      var request = URLRequest(url: URL(string: "http://192.168.64.2/sign_up.php")!)
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
                            
//                            let str = "[{\"code\":\"sign_up_true\",\"message\":\"sign_up success. \",\"email\":\"ssssd\",\"password\":\"ddddd\"}] ".utf8
//                            print(str)
                            do{
                                //let jsonArray = try JSONSerialization.jsonObject(with: Data(str), options: []) as! [Any]
                               // print(jsonArray)
                               // print(jsonArray[0])
                                let jsonArr = try JSONDecoder().decode([SuccessPOGOs].self, from: Data(st) )
                                let jsonAr = try JSONDecoder().decode([FailPOGOs].self, from: Data(st) )
                                
                                print(jsonArr[0].code!)

                                if jsonArr != nil{
                                    self.delegate?.getData(arr: jsonArr)
                                }else{
                                    
                                    self.delegate?.getdata(arr: jsonAr)
                                    
                                }


                            }catch{
                                print(error)

                            }
                            
                            
                            
                         
                              // also not necessary in a real app
                          }
                          task.resume()
                         
                      }
        
        
                  
        



    
        
    
    
    
    
}
