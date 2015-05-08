//
//  LibraryViewController.swift
//  CodeChallenge
//
//  Created by Jeff Jacka on 5/4/15.
//  Copyright (c) 2015 Jeff Jacka. All rights reserved.
//

import UIKit

class LibraryViewController: UITableViewController {

    var libraries: [Library] = []
    var shelves: [Shelf] = []
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup()
        title = "Libraries"
        

    }
    
    //Create Everything
    
    func setup() {
        libraries.removeAll(keepCapacity: true)
        
        //create new library
        var fantasy = Library()
        fantasy.libraryName = "Fantasy"
        fantasy.addToPub()
        //add to array
        libraries.append(fantasy)
        
        //create new library
        var scifi = Library()
        scifi.libraryName = "Sci-Fi"
        scifi.addToPub()
        //add to array
        libraries.append(scifi)
        
        //create new library
        var nonfiction = Library()
        nonfiction.libraryName = "Non-Fiction"
        nonfiction.addToPub()
        //add to array
        libraries.append(nonfiction)
        
        //create new library
        var unsorted = Library()
        unsorted.libraryName = "Unsorted"
        unsorted.addToPub()
        //add to array
        libraries.append(unsorted)
    

    
        //Create Shelves
        shelves.removeAll(keepCapacity: true)
        
        //create new shelf
        var A = Shelf()
        A.shelfName = "Space"
        A.addToLibrary(scifi)
        var B = Shelf()
        B.shelfName = "Future"
        B.addToLibrary(scifi)
        var C = Shelf()
        C.shelfName = "Steampunk"
        C.addToLibrary(scifi)
        
        
        //add to array
        shelves.append(A)
        shelves.append(B)
        shelves.append(C)

        

    
        //Create Books
        books.removeAll(keepCapacity: true)
        
        //create new library
        var book1 = Book();
        book1.title = "The Bourne Identity"
        book1.addToLibrary(scifi)
        book1.addToShelf(A)
        //add to array
        books.append(book1)
        
    }
    
    //Set Up Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //head to shelves
        if segue.identifier == "show" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let library = libraries[indexPath.row]
                println("Show Segue")
                (segue.destinationViewController as! ShelfViewController).libraryShelves = library            }
        }
        //todo
        //head straight to books
        else{
            println("inside else")
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let books = libraries[indexPath.row]
                println("Books Segue")
                (segue.destinationViewController as! BookViewController).bookDirect = books          }
        }
    }

    
    
    
    
    //Set Up Table View
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.libraries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var library : Library
        
        library = libraries[indexPath.row]
        
        cell.textLabel?.text = library.libraryName
        return cell;
        
    }


}

