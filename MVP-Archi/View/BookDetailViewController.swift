//
//  BookDetailViewController.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let bookDetailPresenter = BookDetailPresenter(bookDetailService: BookDetailService())
    
    var id: Int = 0
    var book: Book? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookDetailPresenter.setViewDelegate(bookDetailViewDelegate: self)
        bookDetailPresenter.requestBookDetail(id: id)
    }
    
}

extension BookDetailViewController: BookDetailViewDelegate {
    
    func setBook(book: Book) {
        self.book = book
        titleLabel.text = book.title
        descriptionLabel.text = book.description
    }
    
}
 
