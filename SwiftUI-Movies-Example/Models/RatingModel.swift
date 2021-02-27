//
//  RatingModel.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation

struct RatingModel: Decodable {
    
    var source: String?
    var value: String?
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        source = try? container.decodeIfPresent(.source)
        value =  try? container.decodeIfPresent(.value)
    }
}

extension RatingModel {
    
    enum CodingKeys: String, CodingKey {
        
        case source = "Source"
        case value = "Value"
    }
}
