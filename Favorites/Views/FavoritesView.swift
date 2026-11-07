//
//  FavoritesView.swift
//  Favorites
//
//  Created by rahul v on 11/3/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    //    using computed properties to load the Int arrays. Putting these inside a scrollView, didnt allow the hearts to show in the favorites list
    
    private var favoriteCitiesArray: [CityModel] {
        let favoriteCityIds : [Int] = loadFavoriteIds(storageKey: "favoriteCities")
        var favoriteCities : [CityModel] = []
        
        for cityId in favoriteCityIds {
            if let matchedCity = favorites.cities.first(where: {$0.id == cityId}) {
                favoriteCities.append(matchedCity)
            }
        }
        return favoriteCities
    }
    
    private var favoriteHobbiesArray: [HobbyModel] {
        let favoriteHobbyIds : [Int] = loadFavoriteIds(storageKey: "favoriteHobbies")
        var favoriteHobbies : [HobbyModel] = []
        
        for hobbyId in favoriteHobbyIds {
            if let matchedHobby = favorites.hobbies.first(where: {$0.id == hobbyId}) {
                favoriteHobbies.append(matchedHobby)
            }
        }
        return favoriteHobbies
    }
    
    
    var body: some View {
        ScrollView{
            VStack {
                VStack {
                    Text("Cities")
                        .font(.headline)
                    Divider()

                    ForEach( favoriteCitiesArray, id: \.id) {city in
                        CityCardView(city: city)
                    }
                }
                
                
                VStack {
                    Text("Hobbies")
                        .font(.headline)
                    Divider()

                    ForEach( favoriteHobbiesArray, id: \.id) {hobby in
                        HobbyRowView(hobby: hobby)
                    }
                }
            
            VStack {
                Text("Books")
                    .font(.headline)
                Divider()

                let favoriteBookIds : [Int] = loadFavoriteIds(storageKey: "favoriteBooks")
                
                ForEach( favoriteBookIds, id: \.self) {bookId in
                    if let matchedBook = favorites.books.first(where: {$0.id == bookId}) {
                        BookRowView(book: matchedBook)
                    }
                }
            }
            }
//            .border(.orange) // border for debugging - remove
        }
        
        
//        .frame(maxWidth: .infinity) // added for testing
//        .border(.purple) // border for debugging - remove
        
        
//        ScrollView {
//                VStack(spacing: 12) {
//                    Text("Testing ScrollView width")
//                        .frame(maxWidth: .infinity)
//
//                    Text("This should span the available width.")
//                        .frame(maxWidth: .infinity)
//                }
//                .border(.orange)
//            }
//            .border(.purple)
    }
}
    
    func loadFavoriteIds(storageKey : String) -> [Int] {
        return UserDefaults.standard.array(forKey: storageKey) as? [Int] ?? []
    }


//#Preview {
//    FavoritesView()
//}
