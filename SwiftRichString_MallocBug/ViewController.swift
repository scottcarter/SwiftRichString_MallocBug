//
//  ViewController.swift
//  SwiftRichString_MallocBug
//
//  Created by Scott Carter on 12/19/17.
//  Copyright © 2017 Scott Carter. All rights reserved.
//

import Cocoa

import SwiftRichString


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = ViewController.formResult(valid: true)
        
        print("str = \(str)")
    }


    class func formResult(valid: Bool) -> NSAttributedString {
        
        let resultNoMarkup = valid ? "Form is valid." : "Please correct errors in form."
        
        let result = valid ? "<valid>Form is valid.</valid>" : "<invalid>Please correct errors in form.</invalid>"
        
        // Define our styles
        let defaultStyle = Style.default {
            $0.font = FontAttribute(.HelveticaNeue, size: 14) // font + size
            $0.color = NSColor.black // text color
        }
        
        // .HelveticaNeue_Bold
        let invalidStyle = Style("invalid", {
            $0.font = FontAttribute(.HelveticaNeue, size: 14)
            $0.color = NSColor.red
        })
        
        let validStyle = Style("valid", {
            $0.font = FontAttribute(.HelveticaNeue, size: 14)
            $0.color = NSColor.init(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
        })
        
        
        
        let parser = result.parse(andSet: defaultStyle, invalidStyle, validStyle)
        
        // If the parser fails, provide a fallback.
        let str = parser?.render() ?? NSAttributedString.init(string: resultNoMarkup)
        
        return str
    }
    

}

