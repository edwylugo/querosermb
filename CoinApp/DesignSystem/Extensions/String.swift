//
//  String.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation
import UIKit

extension String {
    func formatDateToEUA() -> String {
        if self.count > 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "MM/dd/yyyy"
            return  dateFormatter.string(from: date!)
        } else {
            return "-"
        }
    }
    
    func formatDateTimeToPtEUADateTime() -> String {
        if self.count > 15 {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            inputFormatter.timeZone = TimeZone(abbreviation: "GMT")
            var string = self.replacingOccurrences(of: "T", with: " ")
            string = string.substring(to: 15)
            if let date = inputFormatter.date(from: string) {
                
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "MM/dd/yyyy HH:mm"
                return outputFormatter.string(from: date)
            }
            
        }
        return self
    }
    
    // Substring
    func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
        
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
        
        if let start = from, let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
        
        let startIndex: String.Index
        if let start = from, start >= 0 {
            startIndex = self.index(self.startIndex, offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
        
        let endIndex: String.Index
        if let end = to, end >= 0, end < self.count {
            endIndex = self.index(self.startIndex, offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
        
        return String(self[startIndex ..< endIndex])
    }
    func substring(from: Int) -> String {
        return self.substring(from: from, to: nil)
    }
    func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        
        let end: Int
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        
        return self.substring(from: from, to: end)
    }
    func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else {
            return ""
        }
        
        let start: Int
        if let end = to, end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
        
        return self.substring(from: start, to: to)
    }
}
