//
//  API.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/27/21.
//

enum API {}

//Recomnded to put below in a seperate file, but due to the
//simplicity of the project and lack of endpoints placing
//here to decrease file clutter
extension API {
   enum Movies {}
}

//TODO: Configure multiple search types
enum SearchParams: String, Codable {
   case title = "t"
   case general = "s"
}
