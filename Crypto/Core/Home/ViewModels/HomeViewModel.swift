//
//  HomeViewViewModel.swift
//  Crypto
//
//  Created by Baris Karalar on 25.09.23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistic] = []
//    [
//        Statistic(title: "Title", value: "Value", percentageChange: 1),
//        Statistic(title: "Title", value: "Value"),
//        Statistic(title: "Title", value: "Value"),
//        Statistic(title: "Title", value: "Value", percentageChange: -7)
//    ]
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
        
        addSubscribers()
        
    }
    
    func addSubscribers() {
        // We don't need it because we are also subscribed to dataService.$allCoins in the bottom
//        dataService.$allCoins
//            .sink { [weak self] returnedCoins in
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        
        // Updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(mapCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // Updates marketData
        marketDataService.$marketData
            .map(mapMarketdata)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
        
    }
    
    private func mapCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        let filteredCoins =  coins.filter { coin in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
        return filteredCoins
    }
    
    private func mapMarketdata(marketData: MarketData?) -> [Statistic] {
        var stats: [Statistic] = []
        
        guard let data = marketData else {
            return stats
        }
        
        let marketCap = Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        stats.append(marketCap)
        
        let volume = Statistic(title: "24h Volume", value: data.volume)
        stats.append(volume)
        
        let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
        stats.append(btcDominance)
        
        let portfolio = Statistic(title: "Portfolio value", value: "$0.00", percentageChange: 0)
        stats.append(portfolio)
        
        return stats
    }
    
}
