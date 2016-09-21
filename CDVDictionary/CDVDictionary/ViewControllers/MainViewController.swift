//
//  MainViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/21/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!

    fileprivate let russianSerbianPlist = "DICT_R-S"
    fileprivate let serbianRussianPlist = "DICT_S-R"

    fileprivate let dictionarySegueIdentifier = "dictionarySegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == dictionarySegueIdentifier {
            let dictionaryViewController =  segue.destination as! DictionaryViewController
            dictionaryViewController.dictionaryType = russianSerbianPlist
        }
    }
}
