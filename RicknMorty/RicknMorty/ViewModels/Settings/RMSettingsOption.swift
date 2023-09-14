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
    case privacyPolicy
    case apiReference
    case viewSeries
    case viewCode
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacyPolicy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
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
        case .privacyPolicy:
            return .systemOrange
        case .apiReference:
            return .systemPink
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
        case .privacyPolicy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "link")
        case .viewSeries:
            return UIImage(systemName: "tv")
        case .viewCode:
            return UIImage(systemName: "hammer")
        }
    }
}
