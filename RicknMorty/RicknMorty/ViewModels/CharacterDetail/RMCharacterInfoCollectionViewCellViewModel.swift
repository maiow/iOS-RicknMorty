//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 10.09.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    private let type: `Type`
    private let value: String
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    public var title: String {
        type.displayTitle
    }
    
    public var displayValue: String {
        if value .isEmpty { return "None" }
        if let date = Self.dateFormatter.date(from: value),
            type == .created {
            return Self.shortDateFormatter.string(from: date)
        }
        return value
    }
    
    public var iconImage: UIImage? {
        type.iconImage
    }
    
    public var tintColor: UIColor {
        type.tintColor
    }
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemGreen
            case .gender:
                return .systemBlue
            case .type:
                return .systemRed
            case .species:
                return .systemPurple
            case .origin:
                return .systemOrange
            case .location:
                return .systemPink
            case .created:
                return .systemMint
            case .episodeCount:
                return .systemYellow
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "star")
            case .gender:
                return UIImage(systemName: "star")
            case .type:
                return UIImage(systemName: "star")
            case .species:
                return UIImage(systemName: "star")
            case .origin:
                return UIImage(systemName: "star")
            case .location:
                return UIImage(systemName: "star")
            case .created:
                return UIImage(systemName: "star")
            case .episodeCount:
                return UIImage(systemName: "star")
            }
        }
        
        var displayTitle: String {
            switch self {
            case
            .status,
            .gender,
            .type,
            .species,
            .origin,
            .location,
            .created:
                return rawValue.uppercased()
            case .episodeCount:
                return "EPISODE COUNT"
            }
        }
    }
    
    init(type: `Type`, value: String) {
        self.value = value
        self.type = type
    }
}
