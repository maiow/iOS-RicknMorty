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
    
    private var searchResultsHandler: (() -> Void)?
    
    //MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    //MARK: - Public
    
    public func registerSearchResultsHandler(
        _ block: @escaping () -> Void
    ) {
        self.searchResultsHandler = block
    }
    
    public func executeSearch() {
        //test search text
        searchText = "Rick"
        
        //Build arguments
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "name", value: searchText)
        ]
        
        //Add options
        queryParams.append(contentsOf: optionMap.enumerated().compactMap ({ _, element in
            let key: RMSearchInputViewViewModel.DynamicOptions = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        }))
        
        //Create request
        let request = RMRequest(
            endpoint: config.type.endpoint,
            queryParameters: queryParams
        )
        
        RMService.shared.executeRequest(request, expecting: RMGetAllCharactersResponse.self) { result in
            //Notify view of results, no results or error
            switch result {
            case .success(let model):
                print("Search results found: \(model.results.count)")
            case .failure:
                break
                
            }
        }
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
