//
//  BookViewCell.swift
//  awsbookapp
//
//  Created by Sebastian Panesso on 21/6/21.
//

import Foundation
import UIKit

class BookViewCell: UITableViewCell {
    
    static let key = "BookViewCell"
    
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(book: Book){
        
        bookDescription.text = book.title
        
        if let imageURL = book.imageURL as? String,
           let url = URL(string:imageURL) as? URL {
            bookImage.load(url: url)
        }
    }
}
