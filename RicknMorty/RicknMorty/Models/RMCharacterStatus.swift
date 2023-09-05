//
//  RMCharacterStatus.swift
//  RicknMorty
//
//  Created by mivanovskaya on 05.09.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
