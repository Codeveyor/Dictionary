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

    // TODO: test
    private var selectedPlist: String!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rsSegue" {
            guard let dictionaryViewController =  segue.destination as? DictionaryViewController else { return }

            dictionaryViewController.dictionaryName = "DICT_R-S"
        } else if segue.identifier == "srSegue" {
            guard let dictionaryViewController =  segue.destination as? DictionaryViewController else { return }

            dictionaryViewController.dictionaryName = "DICT_S-R"
        }
    }

    // MARK: - Action

    @IBAction func didChange(segmentedControl: UISegmentedControl) {
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

    // MARK: - Util

    private func highlight(containerView: UIView) {
        let containersArray = [rsContainerView, srContainerView, infoContainerView]
        for container in containersArray {
            if container == containerView {
                // TODO: test
//                UIView.animate(withDuration: 0.3, animations: {
                    container?.alpha = 1.0
//                })
            } else {
//                UIView.animate(withDuration: 0.3, animations: {
                    container?.alpha = 0.0
//                })
            }
        }
    }
}
