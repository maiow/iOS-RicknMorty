//
//  RMSettingsCellViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 13.09.2023.
//

import UIKit

//Identifiable - gives unique id - to be able to loop over collection of this
struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    private let type: RMSettingsOption
    
    //MARK: - Init
    
    init(type: RMSettingsOption) {
        self.type = type
    }
    
    //MARK: - Public
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
