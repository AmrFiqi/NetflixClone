//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 14/05/2023.
//

import Foundation
import UIKit

struct Constants {
    static let API_KEY = ""
    static let baseURL = "https://api.themoviedb.org"
    static let movieList = "/3/movie/550?api_key="
    static let trendingMovies = "/3/trending/all/day?api_key="
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.trendingMovies)\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, error == nil else {
                print(String(describing: error))
                return
            }
            do{
                let results =  try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
