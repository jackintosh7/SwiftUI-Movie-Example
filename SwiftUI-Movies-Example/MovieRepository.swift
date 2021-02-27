//
//  MovieRepository.swift
//  SwiftUI-Movies-Example
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation

class MovieRepository {
    
    /// Search By Movie Title
    /// - Parameters:
    ///   - title: Title
    ///   - page: Page
    ///   - completion: Return array of MovieModels or return an error if faliure
    func searchByTitle(
        title: String,
        completion: @escaping (Result<MovieBucket, Error>) -> ()
    ) {
        let request = API.Movies.Search.Request(searchTerm: title, page: "1")
        API.Movies.Search(request: request).invoke { result in
            switch result {
            case .success(let response):
                let movieBucket = MovieBucket.init(title: title, movies: response.movies)
                completion(.success(movieBucket))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetch Movie By ID
    /// - Parameters:
    ///   - id: imdb ID
    ///   - completion: Return completed MovieModel or error if fali
    func fetchByID(
        id: String,
        completion: @escaping (Result<MovieModel, Error>) -> ()
    ) {
        let request = API.Movies.FetchByID.Request(id: id)
        API.Movies.FetchByID(request: request).invoke { result in
            switch result {
            case .success(let movie):
                completion(.success(movie))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
