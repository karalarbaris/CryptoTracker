//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by Baris Karalar on 09.11.23.
//

import Foundation

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetail?
    var coinDetailSubscription: AnyCancellable?
    let coin: Coin
    
    
    init(coin: Coin) {
        self.coin = coin
        getCoinDetails()
    }
    
    private func getCoinDetails() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetail.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] returnedCoinDetails in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}
