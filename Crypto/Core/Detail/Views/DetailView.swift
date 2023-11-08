//
//  Detail.swift
//  Crypto
//
//  Created by Baris Karalar on 08.11.23.
//

import SwiftUI

struct DetailView: View {
    
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        print("initializing detail view for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}
