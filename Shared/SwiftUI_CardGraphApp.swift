//
//  SwiftUI_CardGraphApp.swift
//  Shared
//
//  Created by H Chan on 2020/10/28.
//

import SwiftUI

@main
struct SwiftUI_CardGraphApp: App {
    var body: some Scene {
        WindowGroup {
            Home().environmentObject(AppState())
        }
    }
}

class AppState: ObservableObject {
    @Published var colors: [Color] = [.red, .yellow, .blue, .green, .orange, .purple, .pink]
}
