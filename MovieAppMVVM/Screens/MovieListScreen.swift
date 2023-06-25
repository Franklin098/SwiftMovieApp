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
    
    @Environment(\.dismissSearch) var dismissSearch
    @Environment(\.isSearching) var isSearching
    
    let defaultMovie = "lego"
    
    init() {
        self.movieListVM = MovieListViewModel()
        self.movieListVM.searchByName(self.defaultMovie)
    }
    
    var body: some View {
        VStack{
            
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
        .navigationTitle("Movies")
        .searchable(text: $movieName)
        .onSubmit(of: .search, {
            self.movieListVM.searchByName(self.movieName)
        })
        .onChange(of: self.movieName, perform: { newValue in
            if newValue.isEmpty && !isSearching {
                self.movieListVM.searchByName(self.defaultMovie)
            }
        })
        .embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
