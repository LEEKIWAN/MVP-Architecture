//
//  BookList.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import Foundation


struct BookList: Codable {
    let totalCount: Int
    let code: Int
    let message: String?
    let list: [Book]
}


struct Book: Codable {
    let id: Int
    let title: String
    let description: String
    let yes24Link: String
    let publicationDate: String
}
