//
//  DirectoryReader.swift
//  BibleApp
//
//  Created by Sky Wong on 3/4/2018.
//  Copyright © 2018 Sky Wong. All rights reserved.
//

import UIKit
import Foundation

class DirectoryObject: NSObject {
    
    // variables initiated from properties settings
    let directory: String
    let fullname_index: Int
    let shortname_index: Int
    let dir_index: Int
    
    // directory book contain
    var books: [BookObject] = []
    
    init(language: String){
        if (language == "en"){
            self.fullname_index = Properties.english_full_name_index
            self.shortname_index = Properties.english_short_name_index
        } else if (language == "ch"){
            self.fullname_index = Properties.chinese_full_name_index
            self.shortname_index = Properties.chinese_short_name_index
        } else {
            //default chinese
            self.fullname_index = Properties.chinese_full_name_index
            self.shortname_index = Properties.chinese_short_name_index
        }
        self.directory = Properties.directory_directory
        self.dir_index = Properties.chapter_index
    }
    
    func directoryReader() {
        if let path = Bundle.main.path(forResource: directory, ofType: "txt"){
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                for myString in myStrings{
                    let elementarray = myString.components(separatedBy: ",")
                    let BOOK_FULLNAME = elementarray[fullname_index]
                    let BOOK_SHORTNAME = elementarray[shortname_index]
                    let BOOK_DIR = elementarray[dir_index]
                    books.append(BookObject(displayName: BOOK_FULLNAME, shortName: BOOK_SHORTNAME, directoryName: BOOK_DIR))
                }
                
            } catch {
                print(error)
            }
        }
    }

    func getBooks() -> [BookObject] {
        return books
    }
    
}
