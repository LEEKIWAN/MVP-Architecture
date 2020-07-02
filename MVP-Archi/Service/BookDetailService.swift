//
//  BookDetailService.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import Foundation
import Alamofire


class BookDetailService {
    
    func requestBookDetail(id: Int, completionHandler: @escaping (DataResponse<BookDetail, AFError>) -> Void) {
        AF.request("https://kxcoding-study.azurewebsites.net/api/books/\(id)", method: .get)
            .responseDecodable(of: BookDetail.self) { (response: DataResponse<BookDetail, AFError>) in
                
                completionHandler(response)
        }
    }
    
}
