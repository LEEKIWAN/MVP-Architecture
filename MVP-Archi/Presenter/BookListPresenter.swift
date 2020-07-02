//
//  BookListPresenter.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import Foundation

protocol BookListViewDelegate: NSObjectProtocol {
    func setBookList(bookList: [Book])
}

class BookListPresenter {
    private let bookListService: BookListService
    weak private var bookListViewDelegate: BookListViewDelegate?
    
    
    init(bookListService: BookListService) {
        self.bookListService = bookListService
    }
    
    func setViewDelegate(bookListViewDelegate: BookListViewDelegate?) {
        self.bookListViewDelegate = bookListViewDelegate
    }
    
    // MARK: - Business Logic
    
    func requestBookList() {
        
        bookListService.requestBookList { [weak self] (response) in
            guard let self = self else { return }
            switch response.result {
            case .success(let result):
                debugPrint(response)
                self.bookListViewDelegate?.setBookList(bookList: result.list)
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}
