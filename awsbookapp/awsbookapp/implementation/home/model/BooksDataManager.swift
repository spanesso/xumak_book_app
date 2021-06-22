//
//  BooksDataManager.swift
//  awsbookapp
//
//  Created by Sebastian Panesso on 21/6/21.
//


import Foundation

class BooksDataManager {
     
    private let repository = BooksRepository.shared
    
    private init() {}
    
    public static let shared = BooksDataManager()
    
    public func getBooks(completionHandler: @escaping (String?) -> Void) -> () {
        self.repository.getBooks(){
            (books)in
            completionHandler(books)
        }
    }
    
    /*
    public func getBreedImage(url:String,completionHandler: @escaping (String) -> Void) -> () {
        self.repository.getBreedImageUrl(url:url){
            (url)in
            completionHandler(url)
        }
    }*/
}

