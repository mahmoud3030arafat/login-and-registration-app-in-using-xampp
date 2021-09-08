import UIKit

class Model2: NSObject {
    var dataTask:URLSessionDataTask?
        var message = ""
        func getNewsData (){
           
           
            let url = URL(string: "http://192.168.64.2/code.php")
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                guard let data = data else{return}
                print("\(data)")
                guard let response = response else {return}
                print("\(response)")
                do{
                   
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data)
            
                    self.message=(responseModel.server_response![0].message!) as String
                    print(self.message)
                    
                    print(data)
                    
                 
                }catch{
                    
                    print("getDataerror #############################################\(error)")
                }
                if error != nil {
                    
                }
            }
            
            task.resume()
            
    }
    
    
//        let newsURL =
//    "http://192.168.64.2/code.php"
//            guard let url = URL(string: newsURL)else{return}
//            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
//            let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)
////            dataTask=URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
////                // error  handler
////                if let error = error {
////                    print(error.localizedDescription)
////                    return
////                }
////                // response handler
////                guard let response = response as? HTTPURLResponse else{return}
////                print(" .....\(response)")
////                // data handeler
////                guard let data = data else{return}
////
////                do{
////                    let decoder = JSONDecoder()
////                    let json = try decoder.decode(Json4Swift_Base.self, from: data)
////                    print(json)
////
////
////                    let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
////                    let json4Swift_Base = Json4Swift_Base(from: <#T##Decoder#>)
////
//////                    DispatchQueue.main.async {
//////                        completion(.success(json))
//////                    }
////
////                }catch let error {
////
////                    print(error.localizedDescription)
////
////
////                }
//          })
//
//            dataTask?.resume()
//
//
//        }
////    var x  = [Replay]()
////
////    func getData(){
////
////        let serviceUrl = "http://192.168.64.2/code.php"
////        let url = URL(string: serviceUrl)
////        if let url = url {
////
////            let session = URLSession(configuration: .default)
////            let task  = session.dataTask(with: url) { (data, response, error) in
////                if error == nil{
////                    // sucessed
////                    self.parejson(data!)
////
////
////                }else{
////
////
////                }
////            }
////            task.resume()
////
////
////
////        }
////
////    }
////
////    func parejson(_ data:Data){
////
////        do{
////
////
////            let decoder = JSONDecoder()
////            let json = try decoder.decode(Replay.self, from: data)
////            print(json)
////
////
////        }
////
////        catch{
////            print(error.localizedDescription)
////
////        }
////
////
////    }
////
//
}
