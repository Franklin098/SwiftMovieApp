//
//  View+Extensions.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 21/06/23.
//

import SwiftUI

extension View {
    
    
    func embedNavigationView() -> some View {
        // wrap the own View in a NavigationView
        return NavigationView {
            self
        }
    }
    
}
