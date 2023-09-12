//
//  HomeView.swift
//  Crypto
//
//  Created by Baris Karalar on 11.09.23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content layer
            VStack {
                homeHeader
                
                Spacer(minLength: 0)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()            
        }
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: UUID())
                .background {
                    CircleButtonAnimationView(animate: $showPortfolio)
                }
            
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none, value: UUID())
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
}