//
//  API+Movies.swift
//  SwiftUI-Movies-Example
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation
import Alamofire

extension API.Movies {
    
    struct Search: APIService {
        
        struct Request: Encodable {
            
            let searchTerm: String
            let page: String
            let apiKey = Config.apiKey

            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(apiKey, forKey: .apiKey)
                try container.encode(searchTerm, forKey: .searchTerm)
                try container.encode(page, forKey: .page)
            }
            
            enum CodingKeys: String, CodingKey {
                
                case searchTerm = "s"
                case page = "page"
                case apiKey = "apiKey"
            }
        }
        
        struct Response: Decodable {
           
           let movies: [MovieModel]
           let totalResults: String
           
           enum CodingKeys: String, CodingKey {
              
              case movies = "Search"
              case totalResults = "totalResults"
           }
        }
        var path: String { "/" }
        var method: Alamofire.HTTPMethod { .get }
        let request: Request?
        
        init(request: Request) {
            self.request = request
        }
    }
}
