//
//  AttributedStringUtils.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/22/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

struct AttributedStringUtils {
    let diminishedAlphaComponent: CGFloat = 0.8
    func createAttributedString(fullString: String, subString: String) -> NSMutableAttributedString
    {
        let attributedString = NSMutableAttributedString(string: fullString)
        let str = NSString(string: fullString)
        let theRange = str.range(of: subString, options: NSString.CompareOptions.caseInsensitive)
        let yellowColor = Colors().yellowColor().withAlphaComponent(diminishedAlphaComponent)
        attributedString.addAttribute(NSBackgroundColorAttributeName, value: yellowColor, range: theRange)
        return attributedString
    }
}
