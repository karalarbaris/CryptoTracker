//
//  MarketDataService.swift
//  Crypto
//
//  Created by Baris Karalar on 26.10.23.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketData?
    var marketDataSubscription: AnyCancellable?
    
    init() {
        
        getData()
    }
    
    private func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()

            })
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            } receiveValue: { [weak self] returnedCoins in
//                self?.allCoins = returnedCoins
//                self?.coinSubscription?.cancel()
//            }

        
        
    }
}
