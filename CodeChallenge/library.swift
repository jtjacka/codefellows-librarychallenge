//
//  library.swift
//  CodeChallenge
//
//  Created by Jeff Jacka on 5/4/15.
//  Copyright (c) 2015 Jeff Jacka. All rights reserved.
//

import Foundation

var publicLibraries: [Library] = []

//Create class for library
class Library{
    
    
    //Initalize neccesary properties
    var libraryName = "null"
    var containsShelves: [Shelf] = []
    var containsBooks: [Book] = []
    
    
    func printBooks() {
        for(var i = 0; i < containsBooks.count; i++){
            println(containsBooks[i].title)
        }
    }
    
    func addToPub(){
        publicLibraries.append(self);
    }
}



//Create class for shelf
class Shelf {
    
    //Initialize neccesary Properties
    var shelfName = "null"
    var containsBooks: [Book] = []
    
    func printBooks() {
        for(var i = 0; i < containsBooks.count; i++){
            println("Inside Shelf Print")
            println(containsBooks[i].title)
        }
    }
    
    func addToLibrary(library: Library){
        library.containsShelves.append(self);
    }

}

//Create class for book

class Book {
    
   //Initalize neccesary properties
    var title:String = "null"
    var shelved:Bool = false
    var libraryContainer = "null"
    var shelfLocation = "null"
    var onShelf: Shelf?
    
    //add to library general
    func addToLibrary(library: Library){
            library.containsBooks.append(self);
            libraryContainer = library.libraryName
    }
    
    //addtoLibrary from form
    func addToLibraryForm(library: String){
        println("In add to library form")
        for(var i = 0; i < publicLibraries.count; i++){
            println("library for loop: \(publicLibraries[i].libraryName)")
            if(publicLibraries[i].libraryName == library){
                println("found library")
                addToLibrary(publicLibraries[i])
                println("Added to library: \(publicLibraries[i].libraryName)")
            }
        }
    }
    
    func enshelf(shelf: Shelf){
        if(!shelved)
        {
            shelved = true
            addToShelf(shelf)
        }
    }
    

    
    func unshelf(shelf: Shelf){
        if(shelved)
        {
            shelved = false;
            println(shelf.containsBooks.count)
            for var i = 0; i < shelf.containsBooks.count; i++ {
                if(shelf.containsBooks[i].title == self.title){
                    shelf.containsBooks.removeAtIndex(i)
                }
            }
            shelfLocation = "null"
        }
        else{
            println("Book is already unshelved!")
        }
    }
    
    func unshelfForm(shelf: String, library: String){
        var tempLibary: Library?;
        for var i = 0; i < publicLibraries.count; i++ {
            if(publicLibraries[i].libraryName == library){
                tempLibary = publicLibraries[i]
            }
        }
        for var j = 0; j < tempLibary!.containsShelves.count; j++ {
            if(tempLibary!.containsShelves[j].shelfName == shelf){
                unshelf(tempLibary!.containsShelves[j])
            }
            
        }
    }
    
    func addToShelf(shelf: Shelf){
        shelf.containsBooks.append(self)
        shelfLocation = shelf.shelfName
        shelved = true
        self.onShelf = shelf
    }
    
    func addToShelfForm(shelf: String, library: String){
        var tempLibary: Library?;
        for var i = 0; i < publicLibraries.count; i++ {
            if(publicLibraries[i].libraryName == library){
                tempLibary = publicLibraries[i]
            }
        }
        for var j = 0; j < tempLibary!.containsShelves.count; j++ {
            if(tempLibary!.containsShelves[j].shelfName == shelf){
                addToShelf(tempLibary!.containsShelves[j])
                println("Found Shelf")
            }
            
        }
    }
    
    func removeFromLibrary(library: String){
        for var i = 0; i < publicLibraries.count; i++ {
            if(publicLibraries[i].libraryName == library){
                publicLibraries.removeAtIndex(i);
            }
        }
    }
    
    func delete(){
        self.unshelf(self.onShelf!)
        self.removeFromLibrary(self.libraryContainer)
    }
}