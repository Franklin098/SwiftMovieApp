//
//  MovieListView.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 21/06/23.
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
     
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            
            NavigationLink {
                MovieDetailScreen(imdbId: movie.imdbId)
            } label: {
                MovieCellView(movie: movie)
            }
        }
    }
}


struct MovieCellView: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack (alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            
            VStack(alignment: .leading){
                
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
                
                
            }.padding(5)
            
            Spacer()
        }.contentShape(Rectangle())
    }
}
