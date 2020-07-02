//
//  ViewController.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {

    private let bookListPresenter = BookListPresenter(bookListService: BookListService())
    @IBOutlet weak var tableView: UITableView!
    
    var bookList: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookListPresenter.setViewDelegate(bookListViewDelegate: self)
        
        bookListPresenter.requestBookList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? BookDetailViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.id = bookList[indexPath.row].id
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        
    }
}

extension BookListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCell", for: indexPath) as! BookListTableViewCell
        cell.titleLabel.text = bookList[indexPath.row].title
        cell.descriptionLabel.text = bookList[indexPath.row].description
        return cell
    }
}

extension BookListViewController: BookListViewDelegate {
    func setBookList(bookList: [Book]) {
        self.bookList = bookList
        self.tableView.reloadData()
    }
    
    
}
