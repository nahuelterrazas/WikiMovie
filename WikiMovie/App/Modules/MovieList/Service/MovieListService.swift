//
//  File.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import Foundation

class MovieListService {
    func getMovies(onComplete: @escaping ([MovieDTO]) -> Void,
                   onError: @escaping (String) -> Void) {
        
        ApiManager.shared.getCall(url: Constants().MovieListURL) {
            response in
            
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        print("Datos encontrados")
                        let movieResponse = try decoder.decode(MovieListDTO.self, from: data)
                        onComplete(movieResponse.results)
                    }
                } catch {
                    onError("Fallo la conversion del JSON")
                }
                
            case .failure(_):
                onError("Fallo el apiManager")
            }
        }
    }
}
