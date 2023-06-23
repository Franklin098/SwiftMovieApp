//
//  Movie.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 21/06/23.
//

import Foundation

// Our model must agree with Codable to make it easy to parse form JSON to an Object of our Data Type
struct Movie: Codable {
    

    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
    // the MovieDBAPI returns a json with Upper case, use CodingKeys to solve this
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
    
}

struct MovieResponse: Codable {
    
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search" // in the json response we have Search, map it
    }
}





