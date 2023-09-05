//
//  RMEndpoint.swift
//  RicknMorty
//
//  Created by mivanovskaya on 05.09.2023.
//

import Foundation

/// Represents unique Rick&Morty API endpoint
@frozen enum RMEndpoint: String {
    ///Endpoint to get character info
    case character // ="character"
    ///Endpoint to get episode info
    case episode
    ///Endpoint to get location info
    case location
}
