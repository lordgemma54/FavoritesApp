//
// FavoritesApp.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

@main
struct FavoritesApp: App {
    
//  This makes the FVM accessible by all child models
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesViewModel) // passes the object in to the Parent view (ContentView)
        }
    }
}
