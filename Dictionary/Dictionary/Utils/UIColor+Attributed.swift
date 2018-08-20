//
//  UIColor+Attributed.swift
//  Dictionary
//
//  Created by Alex Golub on 9/22/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

extension UIColor {

    static let attributed: UIColor = {
        guard let color = UIColor(named: "attributed") else {
            fatalError("ERROR! Unable to get attributed color")
        }

        return color
    }()
    static let base: UIColor = {
        guard let color = UIColor(named: "base") else {
            fatalError("ERROR! Unable to get base color")
        }

        return color
    }()
    static let baseCell: UIColor = {
        guard let color = UIColor(named: "baseCell") else {
            fatalError("ERROR! Unable to get baseCell color")
        }

        return color
    }()
    static let blackCustom: UIColor = {
        guard let color = UIColor(named: "blackCustom") else {
            fatalError("ERROR! Unable to get blackCustom color")
        }

        return color
    }()
}
