//
//  BookService.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import Foundation
import Alamofire

class BookListService {
    
    func requestBookList(completionHandler: @escaping (DataResponse<BookList, AFError>) -> Void) {
        AF.request("https://kxcoding-study.azurewebsites.net/api/books", method: .get)
            .responseDecodable(of: BookList.self) { (response: DataResponse<BookList, AFError>) in
                
                completionHandler(response)
        }
    }
    
}

