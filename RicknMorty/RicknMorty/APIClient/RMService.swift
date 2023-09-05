//
//  RMService.swift
//  RicknMorty
//
//  Created by mivanovskaya on 05.09.2023.
//

import Foundation


/// Primary API service object to communicate with the Rick and Morty API
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick&Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: Type of object we expect to get back
    ///   - completion: Callback with data or error
    public func executeRequest<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
//        guard let urlRequest = try? request.asURLRequest() else {}
    }
}
