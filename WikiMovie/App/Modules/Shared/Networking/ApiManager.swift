//
//  ApiManager.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 18/07/2022.
//

import Alamofire

class ApiManager {
    
    static let shared = ApiManager() // patron de delegado de singleton
    
    func getCall(url: String, success: @escaping(Result<Data?, AFError>) -> Void){
        AF.request(url).response { response in success(response.result)
        }
    }
    
}
