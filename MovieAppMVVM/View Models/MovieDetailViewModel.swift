//
//  MovieDetailViewModel.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 24/06/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    
    private var movieDetail: MovieDetail?
    
    @Published var loadingState = LoadingState.loading
    
    private var movieDBService = MovieDBService()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingDouble = Double(self.movieDetail?.imdbRating ?? "0.0") ?? 0
            return Int(ceil(ratingDouble))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
    
    func getDetailsByImdbId(imdbId: String){
        
        self.loadingState = .loading
        
        self.movieDBService.getMovieDetailBy(imdbId: imdbId) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let details):
                    
                    self.movieDetail = details
                    self.loadingState = .success
                    
                case .failure(let error):
                    
                    print("Error fetching Movie Details: \(error)")
                    self.loadingState = .failed
                    
                }
            }
            
        }
    }
}
