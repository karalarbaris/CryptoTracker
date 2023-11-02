//
//  NetworkingManager.swift
//  Crypto
//
//  Created by Baris Karalar on 28.09.23.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                "Bad response from url \(url)"
            case .unknown:
                "Unknown error occurred"
            }
        }
        
    }
    
    
    static func download(url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
        //            .tryMap({ handleURLResponse(output: $0)})
            .tryMap({ try handleURLResponse(output: $0, url: url) })
        //            .tryMap { output in
        //
        //                guard let response = output.response as? HTTPURLResponse,
        //                      response.statusCode >= 200 && response.statusCode < 300 else {
        //                    throw URLError(URLError.badServerResponse)
        //                }
        //                return output.data
        //            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Publishers.Decode<AnyPublisher<Data, Error>, [Coin], JSONDecoder>.Failure>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error)
        }
    }
    
    
    
}
