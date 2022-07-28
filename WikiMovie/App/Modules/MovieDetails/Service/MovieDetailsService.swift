//
//  MovieDetailsService.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 25/07/2022.
//

import Foundation

class MovieDetailsService {
    
    func getMovie(urlMovie: String, onComplete: @escaping (MovieDetailsDTO) -> Void,
                     onError: @escaping (String) -> Void) {
        
        ApiManager.shared.getCall(url: urlMovie) { response in
            
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = . convertFromSnakeCase
                        let pokemonResponse = try decoder.decode(MovieDetailsDTO.self, from: data)
                        onComplete(pokemonResponse)
                    }
                    
                } catch {
                    onError("fallo la conversión del json")
                }
            case .failure(_):
                onError("Fallo en el apimanager")
            }
            
        }
        
        
    }
    
}

