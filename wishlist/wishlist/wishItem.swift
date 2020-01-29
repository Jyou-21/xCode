//
//  wishItem.swift
//  wishlist
//
//  Created by Jack Younger on 1/26/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import Foundation

class wishItem: Codable {
    init(wishText: String, date: String) {
        self.wishText = wishText
        self.date = date
    }
    var wishText: String
    var date: String
}

