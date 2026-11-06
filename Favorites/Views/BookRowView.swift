//
//  BookRowView.swift
//  Favorites
//
//  Created by rahul v on 11/6/26.
//

import SwiftUI

struct BookRowView: View {
    
    let book : BookModel
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    var body: some View {
        HStack {
            Text("📖")
            Text(book.bookTitle)
                .padding()
            
            Text(book.bookAuthor)
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
            }
        }
        
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "To Kill a Mockingbird", bookAuthor: "Harper Lee"))
}
