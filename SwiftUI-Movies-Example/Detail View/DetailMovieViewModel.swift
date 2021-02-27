//
//  DetailMovieViewModel.swift
//  SwiftUI-Movies-Example
//
//  Created by Jack Higgins on 2/26/21.
//

import Foundation

class DetailMovieViewModel: ObservableObject {
    
    @Published private(set) var movie: MovieModel?
    private let repository = MovieRepository()
    
    init(movie: MovieModel) {
        self.movie = movie
        fetchMovieDetails(id: movie.id)
    }
    
    func fetchMovieDetails(id: String) {
        repository.fetchByID(id: id) { result in
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                print("error", error)
            }
        }
    }
}
