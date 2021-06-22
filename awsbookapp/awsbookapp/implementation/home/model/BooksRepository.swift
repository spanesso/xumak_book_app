//
//  BooksRepository.swift
//  awsbookapp
//
//  Created by Sebastian Panesso on 21/6/21.
//

import Foundation
import Alamofire


class BooksRepository:BaseRepository {
    
    override init(){}
    
    public static let shared = BooksRepository()
    
    public func getBooks(completionHandler: @escaping (String?) -> Void) -> () {
        let url = Constants.web.aws_books
        self.requestGET(url:url){
            (response)in
            
            if let responseData =  response as? String {
                completionHandler(responseData)
            }else{
                completionHandler(nil)
            }
        }
    }
}

