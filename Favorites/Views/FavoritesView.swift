//
//  FavoritesView.swift
//  Favorites
//
//  Created by rahul v on 11/3/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("Cities")
                    .font(.headline)
//
                let favoriteCitiesIds : [Int] = loadFavoriteIds(storageKey: "favoriteCities")
                
                ForEach( favoriteCitiesIds, id: \.self) {cityId in
                    if let matchedCity = favorites.cities.first(where: {$0.id == cityId}) {
                        CityCardView(city: matchedCity)
                }
                    }
                }
            }
            
            VStack {
                Text("Hobbies")
                    .font(.headline)
            }
            
            VStack {
                Text("Books")
            }
        }
        
//        Text("Favorites")
    }
    
    func loadFavoriteIds(storageKey : String) -> [Int] {
        return UserDefaults.standard.array(forKey: storageKey) as? [Int] ?? []
    }


//#Preview {
//    FavoritesView()
//}
