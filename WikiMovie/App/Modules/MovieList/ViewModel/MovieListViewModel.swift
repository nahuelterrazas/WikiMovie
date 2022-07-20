//
//  MovieListViewModel.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//
// se va a encargar de manejar la logica
import Foundation

class MovieListViewModel {
    private var service: MovieListService
    private var delegate: MovieListDelegate
    private var movies = [MovieDTO]()
    
    init(service: MovieListService, delegate: MovieListDelegate) {
        self.service = service
        self.delegate = delegate
    }
    // alternativamente se podria hacer con closure (patron reactivo)
    
    func getMovies() {
        service.getMovies { movies in
            self.movies = movies
            self.delegate.reloadTable()
        } onError: { error in
            self.delegate.showError(error: error)
        }

    }
    
    func moviesCount() -> Int{
        self.movies.count
    }
    
    func getAMovie(at index: Int) -> MovieDTO {
        return movies[index]
    }
    
}
