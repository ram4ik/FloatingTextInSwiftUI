//
//  FloatingTextInSwiftUIApp.swift
//  FloatingTextInSwiftUI
//
//  Created by ramil on 02.01.2022.
//

import SwiftUI

@main
struct FloatingTextInSwiftUIApp: App {
    
    @State var emailAddress: String = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView(leftIcon: "person", placeHolder: "Email Address", text: $emailAddress)
                .padding()
        }
    }
}
