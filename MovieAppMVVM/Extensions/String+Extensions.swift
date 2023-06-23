//
//  String+Extensions.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 22/06/23.
//

import Foundation

extension String {
    
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
