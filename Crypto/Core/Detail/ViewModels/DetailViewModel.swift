//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Baris Karalar on 09.11.23.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    init(coin: Coin) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("Coin detail received")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
        
    }
}
