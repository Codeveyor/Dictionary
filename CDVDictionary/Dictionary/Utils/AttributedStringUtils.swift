//
//  AttributedStringUtils.swift
//  Dictionary
//
//  Created by Alex Golub on 9/22/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

struct AttributedStringUtils {
    func createAttributedString(fullString: String, subString: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: fullString)
        let fullNSString = NSString(string: fullString)
        let range = fullNSString.range(of: subString, options: .caseInsensitive)

        attributedString.addAttribute(.backgroundColor,
                                      value: UIColor.attributed,
                                      range: range)

        return attributedString
    }
}
