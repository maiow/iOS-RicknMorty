//
//  ViewController.swift
//  RicknMorty
//
//  Created by mivanovskaya on 04.09.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs() {
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let navConCharacters = UINavigationController(rootViewController: charactersVC)
        let navConLocations = UINavigationController(rootViewController: locationsVC)
        let navConEpisodes = UINavigationController(rootViewController: episodesVC)
        let navConSettings = UINavigationController(rootViewController: settingsVC)
        
        navConCharacters.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.fill"), tag: 1)
        navConLocations.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        navConEpisodes.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navConSettings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        for navCon in [navConCharacters, navConLocations, navConEpisodes, navConSettings] {
            navCon.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([navConCharacters, navConLocations, navConEpisodes, navConSettings], animated: true)
    }
}
