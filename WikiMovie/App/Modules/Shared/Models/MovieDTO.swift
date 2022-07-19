//
//  MovieDTO.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import Foundation

struct MovieDTO: Codable {
    let adult: Bool
    let id: Int
    let overview: String
    let releaseDate: String
    let title: String
}

