//
//  DateFormatter.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import Foundation

class AppDateFormatter {
    
    class func getCurrentStringDate() -> String {
        let date = Date()
        let dateFormatter = getFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let stringDate = dateFormatter.string(from: date)
        
        return stringDate
    }
    
    class func getFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        
        return dateFormatter
    }
    
}
