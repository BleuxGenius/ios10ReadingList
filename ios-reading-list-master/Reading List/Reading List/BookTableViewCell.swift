//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Lambda_School_Loaner_167 on 9/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var book: Book?
    var delegate: BookTableViewCellDelegate?
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//    MARK: - OUTLETS
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var readButton: UIButton!
// MARK: - ACTIONS
    @IBAction func readButtonPressed(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }
// MARK: - Methods
    
    func updateViews() {
        guard let bookTitle = book?.title else { return }
        bookTitleLabel.text = bookTitle
        if book?.hasbeenRead == true {
            readButton.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            readButton.setImage(UIImage(named: "unchecked"), for: .normal)
        }

    }
    
}
