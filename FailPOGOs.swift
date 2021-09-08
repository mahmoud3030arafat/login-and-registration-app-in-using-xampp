



import Foundation
class FailPOGOs:Decodable{
    
    var code : String?
    var message : String?
    
    private enum CodingKeys:String,CodingKey{
        case code = "code"
        case message = "message"
        
    }
    
    
    
}
