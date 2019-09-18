//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Lambda_School_Loaner_167 on 9/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookController: BookController?
    var book: Book?
    
//    private func updateViews() {
//        guard let book = book else {
//            title = "Add a new book"
//       return }
//
//        title = book.title
//        bookTextField.text = book.title
//        bookDetailTextField.text = book.reasonToRead
//    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
            updateViews()

           // Do any additional setup after loading the view.
       }
    
//    MARK: - Outlets
    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var bookDetailTextField: UITextView!
    
//    MARK: Actions
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let title = bookTextField.text,
            let reasonToRead = bookDetailTextField.text,
            title != "" && reasonToRead != "" else { return }
        
        if let book = book {
            bookController?.update(book: book, withTitle: title, reasonToRead: reasonToRead)
        } else {
            bookController?.createBook(withTitle: title, reasonToRead: reasonToRead)
           
    }
        
        navigationController?.popViewController(animated: true)
    }
// MARK: - Private
    private func updateViews() {
        guard let book = book else {
            title = "Add a new book"
       return }
        
        title = book.title
        bookTextField.text = book.title
        bookDetailTextField.text = book.reasonToRead
    }
}
