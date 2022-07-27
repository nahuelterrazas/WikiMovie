//
//  MovieDTO.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import Foundation

struct MovieDTO: Codable {
    let id: Int
    let title: String
    let posterPath: String?
}

