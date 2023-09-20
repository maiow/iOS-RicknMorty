//
//  RMSearchViewViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 16.09.2023.
//

import Foundation

//Responsibilities:
// - show search results
// - show no results view
// - kick off API requests

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    private var optionMap: [RMSearchInputViewViewModel.DynamicOptions : String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOptions, String)) -> Void)?
    
    //MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    //MARK: - Public
    
    public func executeSearch() {
        //Create request based on filters
        switch config.type {
        case .character:
            break
        case .episode:
            break
        case .location:
            break
        }
        //Send API Call
        //Notify view of results, no results or error
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOptions) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(
        _ block: @escaping ((RMSearchInputViewViewModel.DynamicOptions, String)) -> Void
    ) {
        self.optionMapUpdateBlock = block
    }
}
