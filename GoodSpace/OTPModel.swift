//
//  DataModel.swift
//  GoodSpace
//
//  Created by Prathmesh Parteki on 08/12/23.
//

import Foundation

struct OtpDataModel : Decodable {
    var needToDoOnboarding : Bool
}

class OTPModel {
    
    static let shared  = OTPModel()
    
    func getOTPMethod(textPhone:String){
        let url = URL(string: "https://api.ourgoodspace.com/api/d2/auth/v2/login")
        
        guard url != nil else{
            print("Error")
            return
        }
        var request  = URLRequest(url: url!,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10)
        let headers = ["Content-Type": "application/json",
                       "Authorization": "Bearer YOUR_ACCESS_TOKEN",
                       "device-id": "626D59E5-6AA0-4189-9B9E-4BE6DCCE785A",
                       "device-type": "web"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        
        
        let requestObject = ["number": textPhone,"countryCode":"+91"] as [String : Any]
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: requestObject,options: .fragmentsAllowed)
            request.httpBody = requestBody
        }catch{
            print("Error")
        }
        
        let session  = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data , response , error in
            do{
                let parsingData = try JSONSerialization.jsonObject(with: data! ,options: .mutableContainers)
                print(parsingData)
            }catch{
                print("Parsing error")
            }
        }
        dataTask.resume()
    }
    
    func verifyOTPMethod(number : String , otp : String) -> Bool{
        let url = URL(string: "https://api.ourgoodspace.com/api/d2/auth/verifyotp")
        
        guard url != nil else{
            print("Error")
            return false
        }
        var request = URLRequest(url: url!,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10)
        let headers = ["Content-Type": "application/json",
                       "Authorization": "Bearer YOUR_ACCESS_TOKEN",
                       "device-id": "626D59E5-6AA0-4189-9B9E-4BE6DCCE785A",
                       "device-type": "web"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        
        let requestObject = ["number":number,"otp":otp,"inviteId":nil, "utmTracking":nil]
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: requestObject,options: .fragmentsAllowed)
            request.httpBody = requestBody
        }catch{
            print("Error")
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { data , response , error in
            do{
                let parsingData = try JSONSerialization.jsonObject(with: data! ,options: .mutableContainers)
                print(parsingData)
            }catch{
                print("Parsing error")
            }
        }
        dataTask.resume()
        return true
    }
    
    func getInActiveProducts(){
        let url = URL(string: "https://api.ourgoodspace.com/api/d2/manage_products/getInActiveProducts")
        
        guard url != nil else{
            print("Error")
            return
        }
        var request = URLRequest(url: url!,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10)
        let headers = ["Content-Type": "application/json",
                       "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTYyMjYwNDY4MH0.ZQxGVUbEZFpSyRYNEeTQysh4fNomDM_RS5XUSqx7YyY",
                       "device-id": "626D59E5-6AA0-4189-9B9E-4BE6DCCE785A",
                       "device-type": "web"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        
        let dataTask = URLSession.shared.dataTask(with: request) { data , response , error in
            do{
                let parsingData = try JSONSerialization.jsonObject(with: data! ,options: .mutableContainers)
                print(parsingData)
            }catch{
                print("Parsing error")
            }
        }
        dataTask.resume()
    }
    
    func getActiveProducts(){
        let url = URL(string: "https://api.ourgoodspace.com/api/d2/manage_products/getActiveProducts")
        
        guard url != nil else{
            print("Error")
            return
        }
        var request = URLRequest(url: url!,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10)
        let headers = ["Content-Type": "application/json",
                       "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTYyMjYwNDY4MH0.ZQxGVUbEZFpSyRYNEeTQysh4fNomDM_RS5XUSqx7YyY",
                       "device-id": "626D59E5-6AA0-4189-9B9E-4BE6DCCE785A",
                       "device-type": "web"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        
        let dataTask = URLSession.shared.dataTask(with: request) { data , response , error in
            do{
                let parsingData = try JSONSerialization.jsonObject(with: data! ,options: .mutableContainers)
                print(parsingData)
            }catch{
                print("Parsing error")
            }
        }
        dataTask.resume()
    }
    
    func getJobListFeed(){
        let url = URL(string: "https://api.ourgoodspace.com/api/d2/member/dashboard/feed")
        
        guard url != nil else{
            print("Error")
            return
        }
        var request = URLRequest(url: url!,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10)
        let headers = ["Content-Type": "application/json",
                       "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTYyMjYwNDY4MH0.ZQxGVUbEZFpSyRYNEeTQysh4fNomDM_RS5XUSqx7YyY",
                       "device-id": "626D59E5-6AA0-4189-9B9E-4BE6DCCE785A",
                       "device-type": "web"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        
        let dataTask = URLSession.shared.dataTask(with: request) { data , response , error in
            do{
                let parsingData = try JSONSerialization.jsonObject(with: data! ,options: .mutableContainers)
                print(parsingData)
            }catch{
                print("Parsing error")
            }
        }
        dataTask.resume()
    }
    
}
