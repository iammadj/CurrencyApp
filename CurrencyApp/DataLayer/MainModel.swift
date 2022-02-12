//
//  MainModel.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import Foundation

struct Main: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case currency = "Ccy"
        case currencyRu = "CcyNm_RU"
        case currencyUz = "CcyNm_UZ"
        case currencyUs = "CcyNm_EN"
        case rate = "Rate"
        case diff = "Diff"
        case date = "Date"
    }
    
    let currency: String
    let currencyRu: String
    let currencyUz: String
    let currencyUs: String
    let rate: String
    let diff: String
    let date: String
    
}
