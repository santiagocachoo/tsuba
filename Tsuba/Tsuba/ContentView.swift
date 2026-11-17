//
//  ContentView.swift
//  Tsuba
//
//  Created by Santiago Cacho Herrera on 17/11/26.
//

import SwiftUI
import TsubaKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Tsuba").font(.largeTitle)
            Text("TsubaKit \(TsubaKit.version)").foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
