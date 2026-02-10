//
//  SupportPageApp.swift
//  SupportPage
//
//  Created by next on 10/02/26.
//

import SwiftUI

@main
struct SupportPageApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                SupportView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
