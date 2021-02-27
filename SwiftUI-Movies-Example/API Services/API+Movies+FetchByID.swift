//
//  API+Movies+FetchByID.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation
import Alamofire

extension API.Movies {
    
    struct FetchByID: APIService {
        
        struct Request: Encodable {
            
            let id: String
            let apiKey = Config.apiKey
            
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(apiKey, forKey: .apiKey)
                try container.encode(id, forKey: .id)
            }
            
            enum CodingKeys: String, CodingKey {
                
                case id = "i"
                case apiKey = "apiKey"
            }
        }
        
        typealias Response = MovieModel

        var path: String { "/" }
        var method: Alamofire.HTTPMethod { .get }
        let request: Request?
        
        init(request: Request) {
            self.request = request
        }
    }
}
