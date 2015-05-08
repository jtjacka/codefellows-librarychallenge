//
//  ShelfViewController.swift
//  CodeChallenge
//
//  Created by Jeff Jacka on 5/7/15.
//  Copyright (c) 2015 Jeff Jacka. All rights reserved.
//

import UIKit

class ShelfViewController: UITableViewController {
    
    var shelf: [Shelf] = []
    var booksOnShelf: [Book] = []
    
    //Optional from LibraryViewController
    var libraryShelves : Library? {
        didSet {
            // Update the view.
            self.configureView()
            
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        configureView()
        
        //Set View Name
        title = libraryShelves?.libraryName
        
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let library = libraryShelves {

            
            
            shelf = library.containsShelves

        }
    }
    
    //Set Up Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let books = shelf[indexPath.row]
                println("Shelf VC - Segue: \(books)")
                (segue.destinationViewController as! BookViewController).bookList = books           }
        }
    }
    
    //Set Up/Fill Table View
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryShelves!.containsShelves.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var shelves : Shelf
        
        shelves = libraryShelves!.containsShelves[indexPath.row]
        
        cell.textLabel?.text = shelves.shelfName
        return cell;
        
    }
    
    
}