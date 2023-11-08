//
//  NavigationLazyView.swift
//  Crypto
//
//  Created by Baris Karalar on 08.11.23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
