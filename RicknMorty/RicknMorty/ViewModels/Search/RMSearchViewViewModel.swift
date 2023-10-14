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
    
    private var searchResultsHandler: ((RMSearchResultViewModel) -> Void)?
    
    //MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    //MARK: - Public
    
    public func registerSearchResultsHandler(
        _ block: @escaping (RMSearchResultViewModel) -> Void
    ) {
        self.searchResultsHandler = block
    }
    
    public func executeSearch() {
        //Build arguments
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "name", value: searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
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
        
        switch config.type.endpoint {
        case .character: 
            makeSearchAPICall(RMGetAllCharactersResponse.self, request: request)
        case .episode: 
            makeSearchAPICall(RMGetAllEpisodesResponse.self, request: request)
        case .location: 
            makeSearchAPICall(RMGetAllLocationsResponse.self, request: request)
        }
    }
    
    private func makeSearchAPICall<T: Codable> (_ type: T.Type, request: RMRequest) {
        RMService.shared.executeRequest(request, expecting: type) { [weak self] result in
            //Notify view of results, no results or error
            switch result {
            case .success(let model):
                self?.processSearchResults(model: model)
            case .failure:
                print("Failed to get search results")
                break
            }
        }
    }
    
    private func processSearchResults(model: Codable) {
        // Episodes, Characters: CollectionView, Locations: TableView
        
        var resultsVM: RMSearchResultViewModel?
        if let charactersResults = model as? RMGetAllCharactersResponse {
            resultsVM = .characters(charactersResults.results.compactMap({
                return RMCharacterCollectionViewCellViewModel(
                    characterName: $0.name,
                    characterStatus: $0.status,
                    characterImageUrl: URL(string: $0.image)
                )
            }))
        }
        else if let episodesResults = model as? RMGetAllEpisodesResponse {
            resultsVM = .episodes(episodesResults.results.compactMap({
                return RMCharacterEpisodeCollectionViewCellViewModel(
                    episodeDataUrl: URL(string: $0.url)
                )
            }))
        }
        else if let locationsResults = model as? RMGetAllLocationsResponse {
            resultsVM = .locations(locationsResults.results.compactMap({
                return RMLocationTableViewCellViewModel(location: $0)
            }))
        }
        if let results = resultsVM {
            self.searchResultsHandler?(results)
        }
        else {
            //Error: No results view
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
