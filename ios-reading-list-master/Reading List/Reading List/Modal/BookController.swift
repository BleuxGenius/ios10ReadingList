//
//  BookController.swift
//  Reading List
//
//  Created by Lambda_School_Loaner_167 on 8/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//



import Foundation
// conforms to codable, codes data into books and books into data.
class BookController: Codable {
    
//    MARK: - Initialization
    init() {
        loadFromPersistentStore()
    }
//    MARK: - CRUD/Method Create
    
    func createBook(withTitle title: String, reasonToRead: String) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        
        books.append(book)
//        call saveToPersistentStore() to update the changes or they wont persist
        saveToPersistentStore()
    }
//    MARK: - CRUD/Method Update
//    updates books have been read or not
    func updateHasBeenRead(for book: Book) {
           
           guard let index = books.firstIndex(of: book) else { return }
           
           books[index].hasbeenRead = !books[index].hasbeenRead
           
           saveToPersistentStore()
       }
//       updates book titles
       func update(book: Book, withTitle title: String, reasonToRead: String) {
           guard let index = books.firstIndex(of: book) else { return }
           
           var scratch = book
           
           scratch.title = title
           scratch.reasonToRead = reasonToRead
           
           books.remove(at: index)
           books.insert(scratch, at: index)
       }
       
//    MARK: - CRUD/Method Delete
    func delete(book: Book) {
        guard let index = books.firstIndex(of: book) else { return }
        
        books.remove(at: index)
        
        saveToPersistentStore()
    }
    // MARK: - Methods
    
//    creates function to save
        func saveToPersistentStore() {
//        Book > Data > Plist
            guard let fileUrl = readingListURL else { return }
            do {
                let plistEncoder = PropertyListEncoder()
            let data = try plistEncoder.encode(books)
                try data.write(to: fileUrl)
        } catch {
            print("Error encoding memories to property list: \(error)")
        }
    }
    
       func loadFromPersistentStore() {
//          Plist > data > books
        let fileManager = FileManager.default
        guard let urlFile = readingListURL,
            fileManager.fileExists(atPath: urlFile.path) else { return }
        
          do {
              let data = try Data(contentsOf: urlFile)
              let plistDecoder = PropertyListDecoder()
              books = try plistDecoder.decode([Book].self, from: data)
          } catch {
              print("Error decoding memories from property list: \(error)")
          }
      }
    
    // MARK: - Properties
    // creates a private variable of books so its readable and not settable
    private(set) var books: [Book] = []
    
//    Computed Property. Accessing the Books Documents Directory.
    private var readingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//        creating the File Name in the Directory.
        let fileName = "ReadingList.plist"
//        returns the Document. and Appends the Files. Now they will be stored on the users device.
        return documentDirectory?.appendingPathComponent(fileName)
    }
//    MARK: - Computed Properties
    var unreadBooks: [Book] {
        return books.filter({ $0.hasbeenRead == false })
    }
    
    var readBooks: [Book] {
        return books.filter({ $0.hasbeenRead == true })
    }
}

// MARK: - Questions

//1. what exactly is a filter , and how else can i use it?
//2. how would I use persistence when using images or diffrent data that isnt just text?
//3. if I wanted to recreate an app using the same method we have here as far as persistence , for a basic journal entry app, would this work step by step as far as trying to get acces to the file manager, and getting the data to stay on the app everytime its up uploaded with new data. (basically, does the persistance layout change for diffrent data ? ex. save and load and CRUD methods)
//4. will we use crud methods in all apps ?
