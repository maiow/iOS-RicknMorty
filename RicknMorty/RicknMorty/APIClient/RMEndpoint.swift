//
//  RMEndpoint.swift
//  RicknMorty
//
//  Created by mivanovskaya on 05.09.2023.
//

import Foundation

/// Represents unique Rick&Morty API endpoint
/// Hashable - to use as a key in a dictionary for CacheManager; CaseIterable - to be able to loop through cases
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    ///Endpoint to get character info
    case character // ="character"
    ///Endpoint to get episode info
    case episode
    ///Endpoint to get location info
    case location
}
