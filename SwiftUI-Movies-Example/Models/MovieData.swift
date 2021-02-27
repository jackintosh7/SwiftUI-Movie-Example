//
//  MovieData.swift
//
//  Created by Jack Higgins on 1/28/21.
//

import Foundation

struct MovieBucket: Hashable {
    let title: String
    let movies: [MovieModel]
}
