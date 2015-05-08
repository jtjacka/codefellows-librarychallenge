//
//  BookCRUDVC.swift
//  CodeChallenge
//
//  Created by Jeff Jacka on 5/8/15.
//  Copyright (c) 2015 Jeff Jacka. All rights reserved.
//

//
//  BookDetailViewController.swift
//  CodeChallenge
//
//  Created by Jeff Jacka on 5/7/15.
//  Copyright (c) 2015 Jeff Jacka. All rights reserved.
//

import UIKit

class BookCRUDVC: UIViewController {
    
    
    var currentBook: Book?
    
    //Fill in data in book view
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var libraryName: UITextField!
    @IBOutlet weak var shelfName: UITextField!
    
    //Action Buttons
    @IBAction func enshelf(sender: AnyObject) {
        currentBook?.addToShelfForm(shelfName.text, library: libraryName.text)
    }
    @IBAction func unshelf(sender: AnyObject) {
        bookEdit?.unshelfForm(shelfName.text, library: libraryName.text)
    }
    @IBAction func update(sender: AnyObject) {
        currentBook?.title = bookTitle.text
        currentBook?.libraryContainer = libraryName.text
        currentBook?.shelfLocation = shelfName.text
    }
    
    @IBAction func create(sender: AnyObject) {
        println("New Book!")
        var newBook = Book()
        newBook.title = bookTitle.text
        //print some tests
        println("Adding:")
        println(libraryName.text)
        println(shelfName.text)
        newBook.addToLibraryForm(libraryName.text)
        if shelfName?.text != nil{
            newBook.addToShelfForm(shelfName.text, library: libraryName.text)
        }

    }

    
    
    var bookEdit: Book? {
        didSet {
            //Configure the view
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureView()
        
    }
    
    func configureView() {
        currentBook = bookEdit;
        // Update the user interface for the detail item.
        println("Inside configure view")
        if let book = bookEdit {
            
            title = book.title
            bookTitle.text = book.title
            libraryName.text = book.libraryContainer
            if book.shelved{
                shelfName.text = book.shelfLocation
            }
            else{
                shelfName.text = "Unshelfed"
            }
            
        }
    }
    
}
