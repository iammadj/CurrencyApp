//
//  MainViewEndpoint.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import Foundation
import Alamofire

enum MainViewEndpoint: Endpoint {
    
    case allFromLastWeek
    case allToday
    case allTodayFor(String)
    
    var url: String? {
        switch self {
        case .allFromLastWeek:
            return "all/"
        case .allToday:
            let date = AppDateFormatter.getCurrentStringDate()
            return "all/\(date)/"
        case .allTodayFor(let currency):
            let date = AppDateFormatter.getCurrentStringDate()
            return "\(currency)/\(date)/"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
}
