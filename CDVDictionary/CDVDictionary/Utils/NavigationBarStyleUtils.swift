//
//  NavigationBarStyleUtils.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/25/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

struct NavigationBarStyleUtils {
    func style(navigationBar: UINavigationBar) {
        navigationBar.tintColor = .base
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "",
                                                                   style: .plain,
                                                                   target: nil,
                                                                   action: nil)
    }
}
