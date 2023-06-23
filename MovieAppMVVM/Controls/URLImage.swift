//
//  URLImage.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 20/06/23.
//

import SwiftUI

struct URLImage: View {
    
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder"){
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        if let data = self.imageLoader.downloadedData, let image = UIImage(data: data) {
            return Image (uiImage: image).resizable()
        } else {
            return Image ("placeholder").resizable()
        }
    }
    
    
}


struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://t1.uc.ltmcdn.com/es/posts/9/5/5/como_es_el_temperamento_del_doberman_52559_orig.jpg")
    }
}
