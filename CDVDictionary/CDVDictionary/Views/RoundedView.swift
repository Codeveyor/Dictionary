//
//  RoundedView.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/23/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

@IBDesignable class RoundedView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
