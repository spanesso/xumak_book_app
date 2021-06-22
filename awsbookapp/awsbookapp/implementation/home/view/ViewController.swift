//
//  ViewController.swift
//  awsbookapp
//
//  Created by Sebastian Panesso on 21/6/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewList: UITableView!
    
    let viewModel = BooksViewModel()
    var disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        binding()
        viewModel.getBooks()
    }
    
    private func layout(){
        navigationController?.navigationBar.topItem?.title = Constants.app.name
        tableViewList.register(UINib(nibName: BookViewCell.key, bundle: nil), forCellReuseIdentifier: BookViewCell.key)
    }
    
    private func binding(){
        bindTableView()
        bindSearchBar()
    }
 
 
    private func bindTableView() {
        viewModel.books.asObservable()
            .bind(to:tableViewList.rx.items) { (tableView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: BookViewCell.key, for: indexPath) as! BookViewCell
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.loadData(book: element)
                return cell
        }
        .disposed(by: disposeBag)
        
        tableViewList.rx.modelSelected(Book.self).subscribe(onNext: {
            item in
            //self.showBookDetail(book: item)
        }).disposed(by: disposeBag)
        
        tableViewList.rx.setDelegate(self)
    }
    
    private func bindSearchBar() {
        searchBar.rx.text.asObservable()
            .filter{$0 != nil}
            .subscribe(onNext: {
                text in
                self.viewModel.filter(text: text!)
            }).disposed(by: disposeBag)
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

 

