//
//  MovieListScreen.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 21/06/23.
//

import SwiftUI

struct MovieListScreen: View {
    
    // @ObservedObject to know that our View is listening for changes on this variable
    @ObservedObject private var movieListVM : MovieListViewModel
    
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack{
        
            
            TextField("Search", text: $movieName,
                      onEditingChanged: { _ in },
                      onCommit: {
                            // when user hits done
                            self.movieListVM.searchByName(self.movieName)
                        }
            ).textFieldStyle(.roundedBorder)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            
            Spacer()
                .navigationTitle("Movies")
            
            
            if self.movieListVM.loadingState == .success {
                MovieListView(movies: self.movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed {
                FailedView()
                Spacer()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
                Spacer()
            }


        }
        .embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
