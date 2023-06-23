//
//  ImageLoader.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 20/06/23.
//

import Foundation


class ImageLoader: ObservableObject {
    
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: String){
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { optData, _, error in
            
    
            // data is not nil and error doesn't exists
            guard let data = optData , error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }.resume()
    }
    
}
