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
    let title: String
    let posterPath: String
    let backdropPath: String
    let genres: [GenresDTO]
    let originalLanguage: String
    let voteAverage: Double
    let runtime: Int
}

