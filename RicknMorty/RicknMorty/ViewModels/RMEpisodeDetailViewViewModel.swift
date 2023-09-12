//
//  RMEpisodeDetailViewViewModel.swift
//  RicknMorty
//
//  Created by mivanovskaya on 11.09.2023.
//

import UIKit

class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let url = endpointUrl, let request = RMRequest(url: url) else {
            return
        }
        RMService.shared.executeRequest(request,
                                        expecting: RMEpisode.self) { result in
            switch result {
                case .success(let model):
                    print(String(describing: model))
                case .failure:
                    break
            }
        }
    }
}
