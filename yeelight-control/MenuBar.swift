//
//  MenuBar.swift
//  yeelight-control
//
//  Created by Arhun Saday on 11/02/2024.
//

import SwiftUI

struct MenuBar: View {
  let alignment: HorizontalAlignment = .center
  let stackSpacing: CGFloat = 16.0

  @State private var lightEnabled: Bool = true
  @State private var brightness: Double = 50.0
  @State private var color: Color = .accentColor

  var yeelightController = YeelightController(ip: "192.168.1.20", port: 55443)

  func action1() {}
  func action2() {}
  func action3() {}
  func openSettingsPage() {
    let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy")!
    NSWorkspace.shared.open(url)
  }
    
  func quitApp() {
    NSApplication.shared.terminate(nil)
  }

  var body: some View {
    VStack(alignment: alignment, spacing: stackSpacing) {
      HStack {
        Text("Enable light")
        Spacer()
        Toggle("", isOn: $lightEnabled)
          .toggleStyle(SwitchToggleStyle(tint: .accentColor))
          .onChange(of: lightEnabled) { oldValue, newValue in
            yeelightController.toggleLight()
            NotificationService.showNotification(
              title: "Yeelight", body: "Toggle light command sent.")
          }
      }

      Slider(
        value: $brightness,
        in: 0...100,
        step: 1,
        minimumValueLabel: Text("0"),
        maximumValueLabel: Text("100"),
        label: { Text("Brightness") }
      )
      .onChange(of: brightness) { oldValue, newValue in
        yeelightController.setBrightness(Int(newValue))
      }

      HStack {
        Text("Color")
        Spacer()
        ColorPicker(
          "",
          selection: $color
        )
      }

      Button("Settings", action: openSettingsPage)
        .buttonStyle(.borderedProminent)
        .padding()
        .background(Color.accentColor)
        .cornerRadius(8)

      Button("About", action: action3)
        .buttonStyle(.borderedProminent)
        .padding()
        .background(Color.accentColor)
        .cornerRadius(8)
    }
      
    .padding()
      Button(action: quitApp, label: { Text("Quit app") })

  }
}

#Preview {
  MenuBar()
}
