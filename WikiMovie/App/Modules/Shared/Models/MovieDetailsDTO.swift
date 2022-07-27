//
//  MovieDetailsDTO.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 26/07/2022.
//

import Foundation

struct MovieDetailsDTO: Codable {
    let overview: String
    let releaseDate: String
    let originalTitle: String
    let posterPath: String
    let backdropPath: String
//    let genreIds: [Int]
    let originalLanguage: String
}
