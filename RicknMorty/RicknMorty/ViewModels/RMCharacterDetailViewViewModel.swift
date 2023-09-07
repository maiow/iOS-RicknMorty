//
//  RMCharacterDetailViewViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 07.09.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
