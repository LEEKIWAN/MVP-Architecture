//
//  BookDetailPresenter.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import Foundation

protocol BookDetailViewDelegate: NSObjectProtocol {
    func setBook(book: Book)
}

class BookDetailPresenter {
    
    var bookDetailService: BookDetailService
    
    weak private var bookDetailViewDelegate: BookDetailViewDelegate?
    
    init(bookDetailService: BookDetailService) {
        self.bookDetailService = bookDetailService
    }
    
    func setViewDelegate(bookDetailViewDelegate: BookDetailViewDelegate) {
        self.bookDetailViewDelegate = bookDetailViewDelegate
    }
    
    func requestBookDetail(id: Int) {
        bookDetailService.requestBookDetail(id: id) { [weak self] (response) in
            guard let self = self else { return }
            switch response.result {
            case .success(let result):
                debugPrint(response)
                self.bookDetailViewDelegate?.setBook(book: result.book)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
