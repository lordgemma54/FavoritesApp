//
//  HomeView.swift
//  Favorites
//
//  Created by rahul v on 11/3/26.
//

import SwiftUI

// CaseIterable allows these enums to be looped over when building the UI
enum ContentCategory : String, CaseIterable{
    case cities = "Cities"
    case hobbies = "Hobbies"
    case books = "Books"
}

struct HomeView: View {
    
    @State private var selectedCategory : ContentCategory = .cities
    @State private var searchText : String = ""
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(ContentCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                selectedContentView()
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt:"Search \(selectedCategory.rawValue)")
        }
    }
    
//  allows for multiple views in a func or closure and returns a TupleView<Text, Text>
    @ViewBuilder
    private func selectedContentView() -> some View {
        if selectedCategory == .cities {
            CitiesView(searchText: $searchText)
        } else if selectedCategory == .hobbies {
            HobbiesView(searchText: $searchText)
        } else if selectedCategory == .books {
            BooksView(searchText: $searchText)
        }
        
        
    }
}

#Preview {
    HomeView().environmentObject(FavoritesViewModel())
}
