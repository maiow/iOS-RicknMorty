//
//  RMSearchResultViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 14.10.2023.
//

import Foundation
    
final class RMSearchResultViewModel {
    public private (set) var results: RMSearchResultType
    private var next: String?
    
    init(results: RMSearchResultType, next: String?) {
        self.results = results
        self.next = next
    }
    
    public private(set) var isLoadingMoreResults = false
    
    public var shouldShowLoadMoreIndicator: Bool {
        return next != nil
    }
    
    public func fetchAdditionalLocations(completion: @escaping ([RMLocationTableViewCellViewModel]) -> Void) {
        guard !isLoadingMoreResults else {
            return
        }
        
        guard let nextPageUrlString = next,
              let url = URL(string: nextPageUrlString) else {
            return
        }
        
        isLoadingMoreResults = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreResults = false
            return
        }
        
        RMService.shared.executeRequest(request, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
                switch result {
                case .success(let responseModel):
                    let moreResults = responseModel.results
                    let info = responseModel.info
                    strongSelf.next = info.next //Capture new pagination url
                    
                    let additionalLocations = moreResults.compactMap({
                        return RMLocationTableViewCellViewModel(location: $0)
                    })
                    
                    var newResults: [RMLocationTableViewCellViewModel] = []
                    
                    switch strongSelf.results {
                    case .locations(let currentResults):
                        newResults = currentResults + additionalLocations
                        strongSelf.results = .locations(newResults)
                    case .characters, .episodes:
                        break
                    }
                    
                    DispatchQueue.main.async {
                        strongSelf.isLoadingMoreResults = false
                        
                        //Notify via callback
                        completion(newResults)
                    }
                    
                case .failure(let error):
                    print(String(describing: error))
                    self?.isLoadingMoreResults = false
                }
            }
    }
}

enum RMSearchResultType {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
