//
//  MainMoviesViewModel.swift
//  SwiftUI-Movies-Example
//
//  Created by Jack Higgins on 2/26/21.
//

import Foundation

class MainMoviesViewModel: ObservableObject {
    
    @Published private(set) var movieBuckets: [MovieBucket] = []
    private let repository = MovieRepository()
    
    init() {
        fetchMovieBuckets()
    }
    
    func fetchMovieBuckets() {        
        for title in Config.MoviesToSearch {
            repository.searchByTitle(title: title) { result in
                switch result {
                case .success(let bucket):
                    self.movieBuckets.append(bucket)
                case .failure(let error):
                    print("error", error)
                }
            }
        }
    }
}
