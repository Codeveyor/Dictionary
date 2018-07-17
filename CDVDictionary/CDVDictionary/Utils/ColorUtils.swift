//
//  ColorUtils.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/22/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

struct ColorUtils {
    func yellowColor() -> UIColor {
        return color(r: 205.0,
                     g: 150.0,
                     b: 62.0)
    }

    func cellYellowColor() -> UIColor {
        return yellowColor().withAlphaComponent(0.8)
    }

    func attributedYellowColor() -> UIColor {
        return cellYellowColor()
    }

    func blackColor() -> UIColor {
        return color(r: 51.0,
                     g: 51.0,
                     b: 51.0)
    }

    func cellWhiteColor() -> UIColor {
        return .white
    }

    fileprivate func color(r: CGFloat,
                           g: CGFloat,
                           b: CGFloat) -> UIColor {
        return UIColor.init(red: r / 255.0,
                            green: g / 255.0,
                            blue: b / 255.0,
                            alpha: 1.0)
    }
}
