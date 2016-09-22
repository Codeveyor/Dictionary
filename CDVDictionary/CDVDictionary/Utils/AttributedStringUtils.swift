//
//  AttributedStringUtils.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/22/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

struct AttributedStringUtils {
    func createAttributedString(fullString: String, fullStringColor: UIColor, subString: String, subStringColor: UIColor) -> NSMutableAttributedString
    {
        let attributedString = NSMutableAttributedString(string: fullString)
        let str = NSString(string: fullString)
        let theRange = str.range(of: subString, options: NSString.CompareOptions.caseInsensitive)
        attributedString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellow, range: theRange)
        return attributedString
    }
}
