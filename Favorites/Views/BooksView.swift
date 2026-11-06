//
//  BooksView.swift
//  Favorites
//
//  Created by rahul v on 11/6/26.
//

import SwiftUI

struct BooksView: View {
    
    @EnvironmentObject var favorites : FavoritesViewModel
    @Binding var searchText : String
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(favorites.filteredBooks(searchText: searchText)) {book in
                    BookRowView(book: book)
                }
            }
            .padding()
        }
    
    }
}

//#Preview {
//    BooksView()
//}
