//
//  ToDo_AppApp.swift
//  ToDo App
//
//  Created by Damaris Muhia on 07/06/2023.
//

import SwiftUI
import FirebaseCore

@main
struct ToDo_AppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
