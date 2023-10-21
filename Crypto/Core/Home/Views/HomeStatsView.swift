//
//  HomeStatsView.swift
//  Crypto
//
//  Created by Baris Karalar on 21.10.23.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showpPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showpPortfolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatsView(showpPortfolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.homeVM)
}
