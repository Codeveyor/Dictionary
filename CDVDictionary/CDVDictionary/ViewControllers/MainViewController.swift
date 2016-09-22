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
    @IBOutlet weak var dictionaryContainerView: UIView!
    @IBOutlet weak var infoContainerView: UIView!

    fileprivate var selectedPlist: String!
    fileprivate var savedSelectedPlist = "savedSelectedPlist"
    fileprivate let russianSerbianPlist = "DICT_R-S"
    fileprivate let serbianRussianPlist = "DICT_S-R"
    fileprivate let dictionarySegueIdentifier = "dictionarySegueIdentifier"
    fileprivate let infoSegueIdentifier = "infoSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlistType()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setupPlistType()
        if segue.identifier == dictionarySegueIdentifier {
            let dictionaryViewController =  segue.destination as! DictionaryViewController
            dictionaryViewController.dictionaryType = selectedPlist
        }
    }
}

extension MainViewController {
    @IBAction func segmentedControlDidChanged(segmentedControl: UISegmentedControl) {
        var segueIdentifier: String!
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segueIdentifier = dictionarySegueIdentifier
            selectedPlist = russianSerbianPlist
        case 1:
            segueIdentifier = dictionarySegueIdentifier
            selectedPlist = serbianRussianPlist
        case 2:
            segueIdentifier = infoSegueIdentifier
        default:
            break
        }
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}

extension MainViewController {
    //MARK: Utils
    fileprivate func setupPlistType() {
        let userDefaults = UserDefaults.standard
        if let savedValue = userDefaults.string(forKey: savedSelectedPlist) {
            selectedPlist = savedValue
        } else {
            userDefaults.setValue(selectedPlist, forKey: savedSelectedPlist)
            selectedPlist = russianSerbianPlist
        }
    }
}
