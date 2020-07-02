//
//  BookDetail.swift
//  MVP-Archi
//
//  Created by kiwan on 2020/07/02.
//  Copyright © 2020 kiwan. All rights reserved.
//

import Foundation


struct BookDetail: Codable {
    let code: Int
    let message: String?
    let book: Book
}
