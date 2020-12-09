//
//  WorkWithString.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 09/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class WorkWithString {
    
    static func changeImageSizeInUrl(_ url: String) -> String {
        
        let endIndex = url.index(url.endIndex, offsetBy: -14)
        var newStr = String(url[..<endIndex])
        newStr += "/400x400bb.jpg"
        return newStr
    }
    
    static func replaceSpaces(_ text: String) -> String {
        var word = ""
        for i in text {
            if i == " " {
                word += "+"
            } else {
                word += "\(i)"
            }
        }
        return word
    }
}