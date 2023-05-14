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
    static let trendingMovies = "/3/trending/movie/day?api_key="
    static let trendingTvs = "/3/trending/tv/day?api_key="
    static let upcomingMovies = "/3/movie/upcoming?api_key="
    static let setLanguage = "&language=en-US&page=1"
    static let popular = "/3/movie/popular?api_key="
    static let topRated = "/3/movie/top_rated?api_key="
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: getFullUrl(Constants.trendingMovies))) { data, response, error in
            
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
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: getFullUrl(Constants.trendingTvs))) { data, response, error in
            
            guard let data = data, error == nil else {
                print(String(describing: error))
                return
            }
            do{
                let results =  try JSONDecoder().decode(TrendingTvsResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: getFullUrl(Constants.upcomingMovies))) { data, response, error in
            
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
    
    func getPopular(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: getFullUrl(Constants.popular))) { data, response, error in
            
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
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: getFullUrl(Constants.topRated))) { data, response, error in
            
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
    
    
    func getFullUrl(_ urlString: String) -> URL {
        guard let url = URL(string: "\(Constants.baseURL)\(urlString)\(Constants.API_KEY)\(Constants.setLanguage)") else {return URL(string: Constants.baseURL)!}
        return url
    }
}
