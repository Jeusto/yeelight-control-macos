//
//  ContentView.swift
//  yeelight-control
//
//  Created by Arhun Saday on 10/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        print("Test...")

        return VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
