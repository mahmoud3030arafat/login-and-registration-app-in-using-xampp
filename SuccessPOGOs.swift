


import Foundation
class SuccessPOGOs: Decodable {
    
      let code: String?
         let message: String?
         let email: String?
         let password: String?
        
         
         private enum CodingKeys: String,CodingKey{
             case code="code"
             case message="message"
             case email = "email"
             case password="password"
           
       
           
           
       }
    
}
