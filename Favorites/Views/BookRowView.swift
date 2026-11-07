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
        VStack(spacing: 1) {
            HStack {
                Text("📖")
                    .font(.title2)
                Text(book.bookTitle)
                    .bold()
                    .padding(.vertical, 4)
                
                Spacer()
                
                Button(action: {
                    favorites.toggleFavoriteBook(book: book)
                }) {
                    Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(book.isFavorite ? .red : .gray)
                }
                .padding(.horizontal, 20)
            }
            .padding(.horizontal, 10)
            
            HStack {
                Text("Author: ")
                Text(book.bookAuthor)
                Spacer()
            }
            .padding(.horizontal, 10)
        }
        .padding(.vertical, 6)
        
        Divider()
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "To Kill a Mockingbird", bookAuthor: "Harper Lee"))
}
