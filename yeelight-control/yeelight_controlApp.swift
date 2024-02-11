//
//  yeelight_controlApp.swift
//  yeelight-control
//
//  Created by Arhun Saday on 10/02/2024.
//

import SwiftUI

@main
struct yeelight_controlApp: App {
    var body: some Scene {
        MenuBarExtra("Yeelight Control", systemImage: "rectangle.righthalf.inset.filled") {
            MenuBar()
        }.menuBarExtraStyle(.window)

        WindowGroup {
            ContentView()
        }
    }
}
