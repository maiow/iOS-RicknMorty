//
//  RMLocationTableViewCellViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 15.09.2023.
//

import Foundation

struct RMLocationTableViewCellViewModel: Hashable, Equatable {
    private let location: RMLocation
    
    init(location: RMLocation) {
        self.location = location
    }
    
    public var name: String {
        return location.name
    }
    
    public var type: String {
        return "Location type: " + location.type
    }
    
    public var dimension: String {
        return "Dimension: " + location.dimension
    }
    
    static func == (lhs: RMLocationTableViewCellViewModel, rhs: RMLocationTableViewCellViewModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        //As location.id is unique, should be enough
//        hasher.combine(name)
        hasher.combine(location.id)
//        hasher.combine(type)
//        hasher.combine(dimension)
    }
}
