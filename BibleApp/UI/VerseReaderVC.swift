//
//  VerseReaderVC.swift
//  BibleApp
//
//  Created by Sky Wong on 6/4/2018.
//  Copyright © 2018 Sky Wong. All rights reserved.
//

import UIKit

class VerseReaderVC: UIViewController {

    @IBOutlet var verseTextView: UITextView!
    @IBOutlet var fontSizeUp: UIBarButtonItem!

    var chapter: ChapterObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        var displaystring = stringbuilder()
        displaystring = displaystring + displaystring
        verseTextView.text = displaystring
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stringbuilder()->String{
        var tempstring: String = ""
        var tempcounter: Int = 1
        for string in chapter.get_verses(){
            tempstring.append(String(tempcounter))
            tempstring.append("\n")
            tempstring.append(string)
            tempstring.append("\n\n")
            print(tempstring)
            tempcounter = tempcounter + 1
        }
        return tempstring
    }
    
    
    @IBAction func fontSizeUpOnClick(_ sender: Any) {
        verseTextView.font = UIFont(name: (verseTextView.font?.fontName)!, size: (verseTextView.font?.pointSize)!+0.5)
    }
    
    @IBAction func fontSizeDownOnClick(_ sender: Any) {
            verseTextView.font = UIFont(name: (verseTextView.font?.fontName)!, size: (verseTextView.font?.pointSize)!-0.5)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
