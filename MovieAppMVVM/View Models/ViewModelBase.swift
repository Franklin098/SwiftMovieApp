//
//  ViewModelBase.swift
//  MovieAppMVVM
//
//  Created by Franklin Velásquez on 22/06/23.
//

import Foundation

enum LoadingState {
    case none, failed, loading, success
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
