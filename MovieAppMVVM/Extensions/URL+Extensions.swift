//
//  URL+Extensions.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 21/06/23.
//

import Foundation


extension URL {
    
    static func forMoviesBy(search: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?apikey=\(Constants.MDB_API_KEY)&s=\(search)")
    }
}
