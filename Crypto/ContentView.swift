//
//  ContentView.swift
//  Crypto
//
//  Created by Baris Karalar on 10.09.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Accent")
                    .foregroundColor(.theme.accent)
                
                Text("Secondary tet")
                    .foregroundColor(.theme.secondaryText)
                
                Text("Red")
                    .foregroundColor(.theme.red)
                
                Text("Green")
                    .foregroundColor(.theme.green)
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
