 

//
//  HomeViewModel.swift
//  awsbookapp
//
//  Created by Sebastian Panesso on 21/6/21.
//


import Foundation
import RxSwift

class BooksViewModel {
    
    let dataManager = BooksDataManager.shared
    var books = Variable<[Book]>([])
    var cachedBooks: [Book] = []
    
    init() {}
    
    
    func getBooks() {
        dataManager.getBooks(){
            (json)in
            
            if let booksJson = json as? String{
                if let bookList = self.parseToBookList(json:booksJson) as? [Book]{
                    self.cachedBooks = bookList
                    self.books.value = bookList
                }
            }
        }
    }
    
    func parseToBookList(json:String)->[Book]{
        let bookList: [Book] = try! JSONDecoder().decode([Book].self, from: json.data(using: .utf8)!)
        return bookList
    }
    
    
    func filter(text: String) {
        if (text.count == 0) {
            books.value = cachedBooks
        } else {
            books.value = books.value.filter{$0.title!.lowercased().contains(text.lowercased())}
        }
    }
}
