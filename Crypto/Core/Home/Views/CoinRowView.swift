//
//  CoinRowView.swift
//  Crypto
//
//  Created by Baris Karalar on 13.09.23.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    
    var body: some View {
        Text(coin.name)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin)
    }
}
