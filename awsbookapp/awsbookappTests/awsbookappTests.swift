//
//  awsbookappTests.swift
//  awsbookappTests
//
//  Created by Sebastian Panesso on 21/6/21.
//

import XCTest
@testable import awsbookapp

class awsbookappTests: XCTestCase {
    
    var viewModel:BooksViewModel!

    override func setUpWithError() throws {
        viewModel = BooksViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //UnitTest from logical model list
    
    func testGetBookList(){
        let json = "[{\"title\":\"Harry Potter: Complete 8-Film Collection (DVD, 2011, 8-Disc Set)\",\"imageURL\":\"https://images.cdn1.buscalibre.com/fit-in/360x360/c4/e9/c4e93e876288b4a0021a0cef47efc8bf.jpg\"},{\"title\":\"Harry Potter and the Sorcerer's Stone (DVD, 2002, 2-Disc Set, Widescreen)\",\"imageURL\":\"https://images.cdn1.buscalibre.com/fit-in/360x360/c4/e9/c4e93e876288b4a0021a0cef47efc8bf.jpg\"},{\"title\":\"Harry Potter: Complete 8-Film Collection (Blu-ray Disc, 2011, 8-Disc Set)\",\"imageURL\":\"https://images.cdn1.buscalibre.com/fit-in/360x360/c4/e9/c4e93e876288b4a0021a0cef47efc8bf.jpg\"}]"
        
        let bookList = viewModel.parseToBookList(json: json)
        
        XCTAssert(bookList.count==3)
    }

   

}
