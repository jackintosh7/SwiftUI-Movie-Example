//
//  MovieModel.swift
//  Wipfli Challenge
//
//  Created by Jack Higgins on 1/27/21.
//

import Foundation

final class MovieModel: NSObject, Decodable {
    
    var id: String = ""
    var title: String = ""
    var year: String = ""
    var rated: String?
    var released: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var runtime: String?
    
    var _posterURL: String?
    var posterURL: URL? {
       get {
          if let posterURL = _posterURL {
             return URL(string: posterURL)
          }
          
          return nil
       }
       set {
        _posterURL = newValue?.absoluteString
       }
    }
    
    var ratings: [RatingModel]?
    
    var metaScore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var type: String?
    var totalSeasons: String?
    var response: String?
    
    override init() {
        super.init()
    }
    
    init(from decoder: Decoder) throws {
        super.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(.imdbID)
        title = try container.decode(.title)
        year = try container.decode(.year)
        rated = try? container.decodeIfPresent(.rated)
        released = try? container.decodeIfPresent(.released)
        genre = try? container.decodeIfPresent(.genre)
        director = try? container.decodeIfPresent(.director)
        writer = try? container.decodeIfPresent(.writer)
        actors = try? container.decodeIfPresent(.actors)
        plot = try? container.decodeIfPresent(.plot)
        language = try? container.decodeIfPresent(.language)
        country = try? container.decodeIfPresent(.country)
        awards = try? container.decodeIfPresent(.awards)
        posterURL = try? container.decodeIfPresent(.poster)
        ratings = try? container.decodeIfPresent(.ratings)
        metaScore = try? container.decodeIfPresent(.metaScore)
        imdbRating = try? container.decodeIfPresent(.imdbRating)
        imdbVotes = try? container.decodeIfPresent(.imdbVotes)
        imdbID = try container.decode(.imdbID)
        type = try? container.decodeIfPresent(.type)
        totalSeasons = try? container.decodeIfPresent(.totalSeasons)
        response = try? container.decodeIfPresent(.response)
        runtime = try? container.decodeIfPresent(.runtime)
    }
}

extension MovieModel {
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case totalSeasons = "totalSeasons"
        case response = "Response"
    }
}

extension MovieModel {
    // TODO: Loop through ratings array, calculate and return average
    public func calculateMovieAverage(ratings: [RatingModel]) -> Double {
        return 3
    }
}
