//
//  SearchBarView.swift
//  Crypto
//
//  Created by Baris Karalar on 19.10.23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @FocusState private var searchTextIsFocused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name of symbol", text: $searchText)
                .foregroundStyle(Color.theme.accent)
                .autocorrectionDisabled(true)
                .focused($searchTextIsFocused)
                .overlay(alignment: .trailing, content: {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10.0)
                        .foregroundStyle(Color.theme.accent)
                    //                        .background(Color.red)
                        .opacity(
                            searchText.isEmpty ? 0.0 : 1.0
                        )
                        .onTapGesture {
                            searchText = ""
                            searchTextIsFocused = false
                        }
                })
            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10)
        )
        .padding()
    }
}
#Preview(traits: .sizeThatFitsLayout) {
    SearchBarView(searchText: .constant(""))
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
}
