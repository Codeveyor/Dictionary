//
//  MainViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/21/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var rsContainerView: UIView!
    @IBOutlet weak var srContainerView: UIView!
    @IBOutlet weak var infoContainerView: UIView!

    fileprivate var selectedPlist: String!
    fileprivate var savedSelectedPlist = "savedSelectedPlist"
    fileprivate let russianSerbianPlist = "DICT_R-S"
    fileprivate let serbianRussianPlist = "DICT_S-R"
    fileprivate let rsSegueIdentifier = "rsSegue"
    fileprivate let srSegueIdentifier = "srSegue"
    fileprivate let infoSegueIdentifier = "infoSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == rsSegueIdentifier {
            let dictionaryViewController =  segue.destination as! DictionaryViewController
            dictionaryViewController.dictionaryName = russianSerbianPlist
        } else if segue.identifier == srSegueIdentifier {
            let dictionaryViewController =  segue.destination as! DictionaryViewController
            dictionaryViewController.dictionaryName = serbianRussianPlist
        }
    }
}

extension MainViewController {
    @IBAction func segmentedControlDidChanged(segmentedControl: UISegmentedControl) {
        view.endEditing(true)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            highlight(containerView: rsContainerView)
        case 1:
            highlight(containerView: srContainerView)
        case 2:
            highlight(containerView: infoContainerView)
        default:
            break
        }
    }

    fileprivate func highlight(containerView: UIView) {
        let containersArray = [rsContainerView, srContainerView, infoContainerView]
        for container in containersArray {
            if container == containerView {
                UIView.animate(withDuration: 0.3, animations: { 
                    container?.alpha = 1.0
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    container?.alpha = 0.0
                })
            }
        }
    }
}
