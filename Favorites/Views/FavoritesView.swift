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
                let favoriteCityIds : [Int] = loadFavoriteIds(storageKey: "favoriteCities")
                
                ForEach( favoriteCityIds, id: \.self) {cityId in
                    if let matchedCity = favorites.cities.first(where: {$0.id == cityId}) {
                        CityCardView(city: matchedCity)
                }
                    }
                }
            }
            
            VStack {
                Text("Hobbies")
                    .font(.headline)
                
                let favoriteHobbyIds : [Int] = loadFavoriteIds(storageKey: "favoriteHobbies")
                
                ForEach( favoriteHobbyIds, id: \.self) {hobbyId in
                    if let matchedHobby = favorites.hobbies.first(where: {$0.id == hobbyId}) {
                        HobbyRowView(hobby: matchedHobby)
                    }
                }
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
