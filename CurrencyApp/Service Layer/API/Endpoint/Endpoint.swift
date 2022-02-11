//
//  Endpoint.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation
import Alamofire

protocol Endpoint {
    var method: HTTPMethod { get }
    var body: Data? { get }
    var params: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
    var encoding: Alamofire.ParameterEncoding { get }
    var baseURL: String { get }
    var url: String? { get }
}

extension Endpoint {
    var baseURL: String { "https://cbu.uz/ru/arkhiv-kursov-valyut/json/" }
    var headers: HTTPHeaders? { nil }
    var encoding: Alamofire.ParameterEncoding { URLEncoding.default }
    var body: Data? { nil }
    var params: [String: Any]? { nil }
}
