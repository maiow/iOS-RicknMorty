//
//  RMSettingsOption.swift
//  RicknMorty
//
//  Created by mivanovskaya on 13.09.2023.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case apiReference
    case supportApi
    case viewSeries
    case viewCode
    
    var targetUrl: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://rickandmortyapi.com/about")
        case .terms:
            return URL(string: "https://www.rickandmortyapi.com/terms")
        case .apiReference:
            return URL(string: "https://rickandmortyapi.com/documentation")
        case .supportApi:
            return URL(string: "https://rickandmortyapi.com/support-us")
        case .viewSeries:
            return URL(string: "https://www.netflix.com/tr-en/title/80014749")
        case .viewCode:
            return URL(string: "https://github.com/maiow/iOS-RicknMorty")
        }
    }
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .apiReference:
            return "API Reference"
        case .supportApi:
            return "Support API"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemYellow
        case .contactUs:
            return .systemRed
        case .terms:
            return .systemGreen
        case .apiReference:
            return .systemPink
        case .supportApi:
            return .systemOrange
        case .viewSeries:
            return .systemBlue
        case .viewCode:
            return .systemPurple
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .apiReference:
            return UIImage(systemName: "link")
        case .supportApi:
            return UIImage(systemName: "dollarsign")
        case .viewSeries:
            return UIImage(systemName: "tv")
        case .viewCode:
            return UIImage(systemName: "hammer")
        }
    }
}
