//
//  DirectoryObject.swift
//  BibleApp
//
//  Created by Sky Wong on 3/4/2018.
//  Copyright © 2018 Sky Wong. All rights reserved.
//

import UIKit

class ChapterObject: NSObject {
    
    // the directory of this chapter
    let directory: String
    
    // list of verses in this chapter
    var verses: [String] = []
    
    init(directory: String){
        self.directory = directory
    }
    
    func verseReader(){
        
        if let path = Bundle.main.path(forResource: directory, ofType: "txt"){
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                for myString in myStrings{
                    let elementarray = myString.components(separatedBy: ",")
                    if(elementarray.count>1){
                        verses.append(elementarray[1])
                    }
                }
                
            } catch {
                print(error)
            }
        }
        
    }
        
    func get_verses()->[String]{
        return verses
    }
    
}
