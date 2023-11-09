//
//  Detail.swift
//  Crypto
//
//  Created by Baris Karalar on 08.11.23.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("initializing detail view for \(coin.name)")
    }
    
    var body: some View {
        Text("hello")
    }
        
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}
