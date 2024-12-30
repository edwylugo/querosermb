//
//  String.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import Foundation

extension String {
    func formatDateToEUA() -> String {
        guard !self.isEmpty else { return "-" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self) else { return "-" }
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
    
    func formatDateTimeToPtEUADateTime() -> String {
        guard self.count > 15 else { return self }
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        inputFormatter.timeZone = TimeZone(abbreviation: "GMT")
        
        let cleanedString = self.replacingOccurrences(of: "T", with: " ").prefix(16)
        
        guard let date = inputFormatter.date(from: String(cleanedString)) else { return self }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        return outputFormatter.string(from: date)
    }
    
    // Substring methods
    func substring(from: Int? = nil, to: Int? = nil) -> String {
        let start = from ?? 0
        let end = to ?? self.count - 1
        
        guard start >= 0, end >= 0, start < self.count, end < self.count, end >= start else { return "" }
        
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end + 1)
        
        return String(self[startIndex..<endIndex])
    }
    
    func substring(from: Int) -> String {
        return self.substring(from: from, to: nil)
    }
    
    func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    
    func substring(from: Int? = nil, length: Int) -> String {
        guard length > 0 else { return "" }
        
        let start = from ?? 0
        let end = start + length - 1
        
        return self.substring(from: start, to: end)
    }
    
    func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else { return "" }
        
        let start = max(0, end - length + 1)
        return self.substring(from: start, to: end)
    }
}
