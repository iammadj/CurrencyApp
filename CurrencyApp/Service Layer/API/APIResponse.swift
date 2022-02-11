//
//  APIResponse.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation
import SwiftyJSON

protocol APIResponse {
    var response: HTTPURLResponse? { get }
    var data: Data? { get }
    
    func body(for key: String?) -> Any?
    func bodyData(for key: String?) -> Data?
    func error() -> Error?
}

extension APIResponse {
    
    func body(for key: String?) -> Any? {
        guard let data = self.data else { return nil }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            
            guard let jsonData = json?["data"] else { return nil }
            
            if let jsonData = jsonData as? [String: Any] {
                if let key = key {
                    return jsonData[key]
                }
            }
            
            return jsonData
        } catch {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    func bodyData(for key: String?) -> Data? {
        guard let json = self.body(for: key) else { return nil }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            
            return data
        } catch {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    func error() -> Error? {
        guard let body = self.body(for: nil) as? [String: Any] else {
            return nil
        }
        
        let isSuccess = (body["success"] as? Bool) ?? true
        
        if !isSuccess {
            let message = (body["message"] as? String) ?? ""
            
            return MessagedError(message: message)
        }
        
        return nil
    }
    
}

//MARK: - Implementation

struct APIResponseImp: APIResponse {
    var response: HTTPURLResponse?
    var data: Data?
}
