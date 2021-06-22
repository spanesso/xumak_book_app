//
//  BaseRepository.swift
//  awsbookapp
//
//  Created by Sebastian Panesso on 21/6/21.
//

import Foundation
import Alamofire

class BaseRepository {
     
    
    init(){
    }
    
    public func requestGET(url:String , completionHandler: @escaping (String?) -> Void) -> () {
    
        AF.request(URL.init(string: url)!, method: .get, encoding: JSONEncoding.default).responseJSON {
            (response) in
                print(response.result)

                switch response.result {

                case .success(_):
                    guard response.response?.statusCode == 200 else {
                        completionHandler(nil)
                        return
                    }
                    
                    if let data = response.data,
                       let utf8Text = String(data: data, encoding: .utf8) {
                        completionHandler(utf8Text)
                    }else{
                        completionHandler(nil)
                    }
                    
                   
                    break
                case .failure(let error):
                    completionHandler(nil)
                    break
                }
            }
    }
}
