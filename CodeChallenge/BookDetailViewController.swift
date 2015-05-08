//
//  BookDetailViewController.swift
//  CodeChallenge
//
//  Created by Jeff Jacka on 5/7/15.
//  Copyright (c) 2015 Jeff Jacka. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var currentBook: Book?
    
    //Fill in data in book view
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var libraryName: UILabel!
    @IBOutlet weak var shelfName: UILabel!
    
    //Action - Destory
    @IBAction func destroy(sender: AnyObject) {
        currentBook!.delete()
    }
    
    
    var bookDetail: Book? {
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
        // Update the user interface for the detail item.
        currentBook = bookDetail
        if let book = bookDetail {
            title = book.title
            bookName?.text = book.title
            libraryName?.text = book.libraryContainer
            if book.shelved{
                shelfName?.text = book.shelfLocation
            }
            else{
                shelfName?.text = "Unshelfed"
            }
            
        }
    }
    
    //Set Up Segue for Update
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "update" {
            let crudBook = currentBook
            println("Shelf VC - Segue to CRUD: \(currentBook)")
                (segue.destinationViewController as! BookCRUDVC).bookEdit = crudBook
        }
    }
    
}
