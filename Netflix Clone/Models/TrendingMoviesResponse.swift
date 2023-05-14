//
//  TrendingMoviesResponse.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 14/05/2023.
//

import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}


struct Movie: Codable {
    let id : Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let vote_average: Double
    let release_date: String?
//    adult = 0;
//    "backdrop_path" = "/8rpDcsfLJypbO6vREc0547VKqEv.jpg";
//    "genre_ids" =             (
//        878,
//        12,
//        28
//    );
//    id = 76600;
//    "media_type" = movie;
//    "original_language" = en;
//    "original_title" = "Avatar: The Way of Water";
//    overview = "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.";
//    popularity = "1961.805";
//    "poster_path" = "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg";
//    "release_date" = "2022-12-14";
//    title = "Avatar: The Way of Water";
//    video = 0;
//    "vote_average" = "7.704";
//    "vote_count" = 7945;
}
