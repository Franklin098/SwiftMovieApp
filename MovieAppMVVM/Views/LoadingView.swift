//
//  LoadingView.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 22/06/23.
//

import SwiftUI

struct LoadingView: View {
    
    @State var isLoading = false
    
    private var animation: Animation {
        return .default
        .repeatForever(autoreverses:false)
        .speed(0.5)
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: self.isLoading ?  360: 0))
            .onAppear(){
                withAnimation (animation){
                    self.isLoading = true
                }
            }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
