//
//  MovieDetailScreen.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 24/06/23.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId: String
    
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack{
            
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: self.movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
            
        }.onAppear{
            self.movieDetailVM.getDetailsByImdbId(imdbId: imdbId)
        }
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(imdbId: "tt4116284")
    }
}
