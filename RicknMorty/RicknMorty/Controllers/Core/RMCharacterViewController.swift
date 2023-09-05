//
//  RMCharacterViewController.swift
//  RicknMorty
//
//  Created by mivanovskaya on 04.09.2023.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character)
        print(request.url)
        
        RMService.shared.executeRequest(request, expecting: RMCharacter.self) { result in
        }
    }
}
