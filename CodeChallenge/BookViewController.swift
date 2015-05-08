//
//  BookViewController.swift
//  CodeChallenge
//
//  Created by Jeff Jacka on 5/7/15.
//  Copyright (c) 2015 Jeff Jacka. All rights reserved.
//

import UIKit

class BookViewController: UITableViewController {
    
    var bookDisplay: [Book] = []
    
    var bookList : Shelf? {
        didSet {
            // Update the view.
            self.configureView()
            
        }
    }
    
    var bookDirect : Library? {
        didSet {
            self.configureView()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureView()
        title = bookList?.shelfName
        
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let shelf = bookList {
            title = shelf.shelfName
            bookDisplay = shelf.containsBooks
            
        }
        if let books = bookDirect {
            title =  "Book Detail - No Shelf"
            bookDisplay = books.containsBooks
        }
    }
    //Segue Set Up
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "bookdetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let books = bookDisplay[indexPath.row]
                println("Shelf VC - Segue to Detail: \(books.title)")
                (segue.destinationViewController as! BookDetailViewController).bookDetail = books     }
        }
    }
    
    
    
    
    //Set Up Table View
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDisplay.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var books : Book
        
        books = bookDisplay[indexPath.row]
        
        cell.textLabel?.text = books.title
        return cell;
        
    }
    
    
}