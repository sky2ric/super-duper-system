//
//  ViewController.swift
//  BibleApp
//
//  Created by Sky Wong on 2/4/2018.
//  Copyright © 2018 Sky Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let directories = DirectoryObject(language: "ch")
        directories.directoryReader()
        
        for book in directories.books {
            book.chapterReader()
            print(book.displayName)
            print(book.directoryName)
            
            for chapter in book.chapters {
                chapter.verseReader()
            }
        }
        
        print(directories.books.count)
        print(directories.books[0].chapters.count)
        print(directories.books[0].chapters[0].verses.count)
        print(directories.books[0].chapters[0].verses[0])
        print(directories.books[0].chapters[0].verses[1])
        print(directories.books[0].chapters[0].verses[2])


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

