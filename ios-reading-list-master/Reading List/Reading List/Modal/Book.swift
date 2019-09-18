//
//  Book.swift
//  Reading List
//
//  Created by Lambda_School_Loaner_167 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// conforming to Equatable and Codable
struct Book: Equatable, Codable {
    var title: String
    var reasonToRead: String
    var hasbeenRead: Bool = false
//    Creating an Initializer for the struct , give default values 
    init (title: String, reasonToRead: String, hasbeenRead: Bool = false) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasbeenRead = hasbeenRead
}
    
}
