//
//  MovieListViewModel.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 21/06/23.
//

import SwiftUI

struct MovieViewModel {
    
    let movie: Movie
    
    var imdbId : String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}


// inherit from our base ViewModel
class  MovieListViewModel: ViewModelBase {
    
    // @Published to let the View know when this variable changes
    @Published var movies = [MovieViewModel] ()
    
    let movieDBService = MovieDBService()
    
    
    func searchByName(_ name: String){
        
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        // replace spaces by %20 (url encode) "Lord of the rings" -> "Lord%20of%20the%20rings" we use String+Extensions
        
        movieDBService.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            
            switch result {
            case .success(let optionalMovies):
                
                if let movies = optionalMovies {
                    
                    // update on the main thread to let the View know that something changes
                    DispatchQueue.main.async {
                        
                        // map the list of Movies and convert it to a list of MovieViewModel
                        self.movies = movies.map({ movie in
                            MovieViewModel(movie: movie)
                        })
                        
                        self.loadingState = .success
                    }
                    
                }
                
            case .failure(let error):

                print(error.localizedDescription)
                
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
}
