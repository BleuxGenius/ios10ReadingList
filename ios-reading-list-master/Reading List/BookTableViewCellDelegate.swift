//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Lambda_School_Loaner_167 on 9/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
        func toggleHasBeenRead(for cell: BookTableViewCell)
    }
