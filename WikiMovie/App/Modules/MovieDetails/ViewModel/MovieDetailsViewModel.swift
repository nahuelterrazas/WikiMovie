//
//  MovieDetailsViewModel.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 25/07/2022.
//

import Foundation
class MovieDetailsViewModel {
    private var delegate: MovieDetailsDelegate
    private var service: MovieDetailsService
    private var movieURL: String
    
    init(movieURL: String, service: MovieDetailsService, delegate: MovieDetailsDelegate) {
        self.movieURL = movieURL
        self.service = service
        self.delegate = delegate
    }
    
    func getMovie() {
        service.getMovie(urlMovie: movieURL) { movie in
            self.delegate.movieData(data: movie)

        } onError: { errorMessage in
            self.delegate.showError(error: errorMessage)
        }
    }
}
