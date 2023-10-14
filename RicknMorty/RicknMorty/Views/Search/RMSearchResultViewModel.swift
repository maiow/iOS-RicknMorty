//
//  RMSearchResultViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 14.10.2023.
//

import Foundation
    
enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
