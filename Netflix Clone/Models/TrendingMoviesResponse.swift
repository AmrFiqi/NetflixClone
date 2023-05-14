//
//  TrendingMoviesResponse.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 14/05/2023.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}


struct Title: Codable {
    let id : Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let vote_average: Double
    let release_date: String?
}
