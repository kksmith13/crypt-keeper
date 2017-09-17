//
//  APIClient.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 9/11/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

//
//  APIClient.swift
//  Clarks
//
//  Created by Kyle Smith on 8/30/16.
//  Copyright © 2016 Codesmiths. All rights reserved.
//

import Foundation
import Alamofire
//import KeychainAccess
import SwiftyJSON


class APIClient {
    static let sharedInstance = APIClient()

    let baseAPIURL = "http://localhost:3000/api"
    
    // MARK: - Internal Functions
    
    func setupGETHeaders() -> NSDictionary {
        let verifyHeaders:NSDictionary = [
            "Content-Type" : "application/json",
            "Accept"       : "application/json" ]
        
        return verifyHeaders
    }
    
    func setupPUTHeaders() -> NSDictionary {
        let verifyHeaders:NSDictionary = [
            "Accept"       : "application/json" ]
        
        return verifyHeaders
    }
    
    // MARK: - REST API Functions
    
    func GET(urlString: URLConvertible,
             headers: NSDictionary,
             success: @escaping (JSON) -> Void,
             failure: @escaping (NSError) -> Void) {
        
        Alamofire
            .request(urlString, method: .get, headers: headers as? HTTPHeaders)
            .responseJSON { (responseObject) -> Void in
                
                if responseObject.result.isSuccess {
                    let resJSON = JSON(responseObject.result.value!)
                    success(resJSON)
                }
                
                if responseObject.result.isFailure {
                    let error : Error = responseObject.result.error!
                    failure(error as NSError)
                }
        }
    }
    
    func getWithParams(urlString: URLConvertible,
                       parameters: NSDictionary,
                       headers: NSDictionary,
                       success: @escaping (JSON) -> Void,
                       failure: @escaping (NSError) -> Void) {
        
        Alamofire
            .request(urlString, method: .get, parameters: parameters as? Parameters, headers: headers as? HTTPHeaders)
            .responseJSON { (responseObject) -> Void in
                
                if responseObject.result.isSuccess {
                    let resJSON = JSON(responseObject.result.value!)
                    success(resJSON)
                }
                
                if responseObject.result.isFailure {
                    let error : Error = responseObject.result.error!
                    failure(error as NSError)
                }
        }
    }
    
    func POST(urlString:URLConvertible,
              parameters:NSDictionary,
              headers:NSDictionary,
              success: @escaping (JSON) -> Void,
              failure: @escaping (NSError) -> Void) {
        
        Alamofire
            .request(urlString, method: .post, parameters: parameters as? Parameters, encoding: URLEncoding.default, headers: headers as? HTTPHeaders)
            .responseJSON { (responseObject) -> Void in
                if responseObject.result.isSuccess {
                    let resJSON = JSON(responseObject.result.value!)
                    success(resJSON)
                }
                
                if responseObject.result.isFailure {
                    let error : Error = responseObject.result.error!
                    failure(error as NSError)
                }
        }
    }
    
    func PUT(urlString:URLConvertible,
             parameters:NSDictionary,
             headers:NSDictionary,
             success: @escaping (JSON) -> Void,
             failure: @escaping (NSError) -> Void) {
        
        Alamofire
            .request(urlString, method: .put, parameters: parameters as? Parameters, encoding: URLEncoding.default, headers: headers as? HTTPHeaders)
            .responseJSON { (responseObject) -> Void in
                if responseObject.result.isSuccess {
                    let resJSON = JSON(responseObject.result.value!)
                    success(resJSON)
                }
                
                if responseObject.result.isFailure {
                    let error : Error = responseObject.result.error!
                    failure(error as NSError)
                }
        }
    }
    
    // MARK: - External Functions
    func fetchCoins(success: @escaping (JSON) -> Void,
                    failure: @escaping (NSError) -> Void) {
        
        let coinsURL:URLConvertible = baseAPIURL + "/coins/usd"
        let fetchCoinsHeaders = setupGETHeaders()
        
        return GET(urlString: coinsURL,
                   headers: fetchCoinsHeaders,
                   success: {(responseObject) -> Void in
                    success(responseObject)
        },
                   failure: failure)
    }
}
