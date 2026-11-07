//
//  FavoritesView.swift
//  Favorites
//
//  Created by rahul v on 11/3/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    //    I used computed properties here to try an address a bug: originally the logic for loading the categories into arrays was inside the ScrollView which pushed the heart buttons and icons outside the view horizontally. I thought putting them into computed properties outside the scrollview would fix the bug but it did not. Ultimately using computed properties was a good way to practice using them and made the code a little easier to understand, but using a GeometryReader in the CityCardView actually fixed the bug. 
    
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
    
    private var favoriteBooksArray: [BookModel] {
        let favoriteBookIds : [Int] = loadFavoriteIds(storageKey: "favoriteBooks")
        var favoriteBooks : [BookModel] = []
        
        for bookId in favoriteBookIds {
            if let matchedBook = favorites.books.first(where: {$0.id == bookId}) {
                favoriteBooks.append(matchedBook)
            }
        }
        return favoriteBooks
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
                
                ForEach( favoriteBooksArray, id: \.id) {book in
                        BookRowView(book: book)
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
