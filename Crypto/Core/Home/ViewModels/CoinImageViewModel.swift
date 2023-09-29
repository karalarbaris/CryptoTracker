//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by Baris Karalar on 29.09.23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    private let coin: Coin
    private let coinImageService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.isLoading = true
        self.coin = coin
        self.coinImageService = CoinImageService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinImageService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

        
    }
    
    
}
