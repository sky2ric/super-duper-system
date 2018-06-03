//
//  BookObject.swift
//  BibleApp
//
//  Created by Sky Wong on 2/4/2018.
//  Copyright © 2018 Sky Wong. All rights reserved.
//

import UIKit

class BookObject: NSObject {

    // constant initiated from super class
    let displayName: String
    let shortName: String
    let directoryName: String
    
    var chapters: [ChapterObject] = []
    
    init(displayName:String, shortName:String, directoryName: String) {
        self.displayName = displayName
        self.shortName = shortName
        self.directoryName = directoryName
    }
    
    func chapterReader(){
        
        var chapterCounter = 1

        while true {
            if let path = Bundle.main.path(forResource: directoryName + "_" + String(chapterCounter), ofType: "txt"){
                do {
//                    let data = try String(contentsOfFile: path, encoding: .utf8)
//                    let myStrings = data.components(separatedBy: .newlines)
                    let chapter = ChapterObject(directory: directoryName + "_" + String(chapterCounter))
//                    var verses: [String] = []
                    
//                    for myString in myStrings{
//                        let elementarray = myString.components(separatedBy: ",")
//                        //let BOOK_FULLNAME = elementarray[0]
//                        if (elementarray.count>1){
//                            verses.append(elementarray[1])
//                        }
//                    }
                    
//                    chapter.verses = verses
                    chapters.append(chapter)
                    chapterCounter = chapterCounter + 1
                    
                } catch {
                    print(error)
                    break;
                }
            }
            break;
        }

    }
    
    func getChapters()->[ChapterObject]{
        return chapters
    }
    
    func getChapters(chapter: Int)->ChapterObject?{
        if (chapters.count>chapter){
            return chapters[chapter]
        } else {
            return nil
        }
    }
    
    func getChapters(start: Int, end: Int)->[ChapterObject]?{
        return []
    }
    
    
}
