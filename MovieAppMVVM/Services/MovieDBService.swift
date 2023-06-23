//
//  HTTPClient.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 21/06/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}


class MovieDBService {
    
    // using Result we can add custom types:  Result<SuccessType, ErrorType>
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void){
        
                      // Extesion to URL created by ourselves
        guard let url = URL.forMoviesBy(search: search) else {
            return completion(.failure(.badURL))
        }
        
        
        URLSession.shared.dataTask(with: url) { optData, response, optError in
            
            guard let data = optData, optError == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieResponse.movies))
            
        }
        .resume() // make sure to call resume, or the request won't go anywhere
        
    }
}
